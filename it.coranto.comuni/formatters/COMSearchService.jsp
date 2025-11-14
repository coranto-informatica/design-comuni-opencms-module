<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
  <fmt:setLocale value="it" />
  <cms:bundle basename="it.coranto.comuni.messages">

    <div>
      <!-- Imposta parametri paginazione -->
      <c:set var="rowsPerPage" value="5" />
      <c:set var="paramPage" value="${param.page}" />
      <!-- Se paramPage vuoto o non numerico usa 1 -->
      <c:choose>
        <c:when test="${empty paramPage}">
          <c:set var="currentPage" value="1" />
        </c:when>
        <c:otherwise>
          <c:set var="currentPage" value="${paramPage}" />
        </c:otherwise>
      </c:choose>
      <!-- Forza currentPage >= 1 -->
      <c:if test="${currentPage < 1}">
        <c:set var="currentPage" value="1" />
      </c:if>
      <c:set var="startIndex" value="${(currentPage - 1) * rowsPerPage}" />

      <!-- Imposta variabili ricerca -->
      <c:set var="resType" value="${fn:substringBefore(value.TypesToCollect, ':')}" />
      <c:set var="path" value="${cms.requestContext.siteRoot}${value.Folder}" />
      <c:set var="resCategory" value="" />
      <c:if test="${not empty value.Category}">
        <c:set var="resCategory" value="&fq=Category_${cms.locale}:${value.Category}" />
      </c:if>

      <c:set var="queryParam" value="${not empty param.query ? fn:escapeXml(param.query) : '*:*'}" />
      <c:set var="query" value="${fn:toLowerCase(queryParam)}" />

      <!-- Costruisce la stringa JSON per la configurazione di ricerca -->
      <c:set var="searchconfig">
        {
          "ignorequery": true,
          "extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=con_locales:${cms.locale}${resCategory}&sort=title_${cms.locale}_s asc&rows=${rowsPerPage}&start=${startIndex}&q=${query}"
        }
      </c:set>

      <cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

      <div class="bg-grey-card">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <h2 class="title-xxlarge mb-4 mt-5 mb-lg-10">${value.Title}</h2>
            </div>

            <div class="col-12 col-lg-8 pt-lg-50 pb-lg-50">
              <!-- Form di ricerca -->
              <form method="post" action="#search">
                <div id="search" class="form-group autocomplete-wrapper mb-2 mb-lg-4">
                  <div class="input-group">
                    <label for="query" class="visually-hidden active">Cerca una parola chiave</label>
                    <input type="search" class="autocomplete form-control" placeholder="Cerca una parola chiave" id="query" name="query" value="${param.query}" />
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="submit" id="button-3">Invio</button>
                    </div>
                    <span class="autocomplete-icon" aria-hidden="true">
                      <svg class="icon icon-sm icon-primary">
                        <use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
                      </svg>
                    </span>
                  </div>
                </div>
                <!-- Parte sempre da pagina 1 se cambia ricerca -->
                <input type="hidden" name="page" value="1" />
              </form>

                <p class="mb-4"><strong>${search.numFound}</strong> servizi trovati in ordine alfabetico</p>


              <div id="results-container" class="row g-4">
                <c:choose>
                  <c:when test="${empty value.TypesToCollect}">
                    <div>Seleziona il tipo di risorsa</div>
                  </c:when>
                  <c:otherwise>
                    <c:choose>
                      <c:when test="${search.numFound > 0}">
                        <c:forEach var="result" items="${search.searchResults}">
                          <cms:display
                            value="${result.xmlContent.filename}"
                            displayFormatters="${value.TypesToCollect}"
                            editable="true"
                            create="true"
                            delete="true" />
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <cms:edit createType="${resType}" create="true">
                          <div>Nessun altro risultato</div>
                        </cms:edit>
                      </c:otherwise>
                    </c:choose>
                  </c:otherwise>
                </c:choose>
              </div>

              <!-- Bottone "Carica altri risultati" -->
              <c:set var="shownResults" value="${currentPage * rowsPerPage}" />

              <c:set var="disableButton" value="${(currentPage * rowsPerPage) >= search.numFound}" />
              <c:if test="${not disableButton}">
                <form id="loadMoreForm" class="mt-4">
                  <input type="hidden" id="queryInput" name="query" value="${param.query}" />
                  <input type="hidden" id="pageInput" name="page" value="${currentPage}" />
                  <button
                    type="button"
                    id="loadMoreBtn"
                    data-element="load-other-cards"
                    class="btn btn-outline-primary pt-15 pb-15 pl-90 pr-90 mb-30 mt-3 mb-lg-50 full-mb text-button">
                    <span>Carica altri risultati</span>
                  </button>
                </form>
              </c:if>

            </div>

            <div class="col-12 col-lg-4 pt-30 pt-lg-5 ps-lg-5 order-first order-md-last">
              <cms:container name="servicelinks" type="servicelinks" />
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Esportiamo le variabili per JS -->
    <script>
      const totalFound = ${search.numFound};
      const rowsPerPage = ${rowsPerPage};
    </script>

    <script>
      document.getElementById('loadMoreBtn').addEventListener('click', function() {
        const btn = this;
        const query = document.getElementById('queryInput').value || '';
        let page = parseInt(document.getElementById('pageInput').value, 10);

        btn.disabled = true; // disabilita subito per evitare doppio click
        btn.querySelector('span').textContent = 'Caricamento...';

        // Prepara i parametri per la richiesta
        const params = new URLSearchParams({
          query: query,
          page: page + 1 // carica pagina successiva
        });

        // Fai la richiesta GET verso la stessa pagina (o un endpoint specifico)
        fetch(window.location.pathname + '?' + params.toString(), {
          headers: { 'X-Requested-With': 'XMLHttpRequest' }
        })
          .then(response => response.text())
          .then(html => {
            // Parse la risposta HTML per estrarre i nuovi risultati
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');

            // Seleziona i nuovi risultati da inserire
            const newResults = doc.querySelectorAll('#results-container > *, #results-container > cms\\:display');

            const resultsContainer = document.getElementById('results-container');

            if (newResults.length > 0) {
              newResults.forEach(item => {
                resultsContainer.appendChild(item);
              });

              // aggiorna pagina corrente
              page += 1;
              document.getElementById('pageInput').value = page;

              // Controlla se è ultima pagina
              if (page * rowsPerPage >= totalFound) {
                btn.disabled = true;
                btn.querySelector('span').textContent = 'Nessun altro risultato';
              } else {
                btn.disabled = false;
                btn.querySelector('span').textContent = 'Carica altri risultati';
              }
            } else {
              btn.disabled = true;
              btn.querySelector('span').textContent = 'Nessun altro risultato';
            }
          })
          .catch(err => {
            console.error(err);
            btn.disabled = false;
            btn.querySelector('span').textContent = 'Carica altri risultati';
          });
      });
    </script>

  </cms:bundle>
</cms:formatter>
