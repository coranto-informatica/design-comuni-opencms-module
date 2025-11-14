<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div>
			<c:set var="rowsPerPage" value="20" />
			<c:set var="paramPage" value="${param.page}" />
			<c:choose>
				<c:when test="${empty paramPage}">
					<c:set var="currentPage" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="currentPage" value="${paramPage}" />
				</c:otherwise>
			</c:choose>
			<c:if test="${currentPage < 1}">
				<c:set var="currentPage" value="1" />
			</c:if>
			<c:set var="startIndex" value="${(currentPage - 1) * rowsPerPage}" />

			<c:set var="resType" value="${fn:substringBefore(value.TypesToCollect, ':')}" />
			<c:set var="path" value="${cms.requestContext.siteRoot}${value.Folder}" />
			<c:set var="index" value="" />
			<c:set var="queryParam" value="${not empty param.query ? fn:escapeXml(param.query) : '*:*'}" />
			<c:set var="query" value="${fn:toLowerCase(queryParam)}" />

			<c:set var="searchconfig">
				{
				"ignorequery": true,
				"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=con_locales:${cms.locale}&sort=created asc&rows=${rowsPerPage}&start=${startIndex}&q=${query}"
				}
			</c:set>

			<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

			<div class="container">
				<div class="row">
					<form method="post" action="" class="w-100">
						<div class="col-12 col-lg-8 offset-lg-2 px-sm-3 mt-2">
							<div class="cmp-input-search">
								<div class="form-group autocomplete-wrapper mb-2 mb-lg-4">
									<div class="input-group">
										<label for="autocomplete-autocomplete-three" class="visually-hidden active">Cerca nel sito</label>
										<input type="search" class="autocomplete form-control"
											   placeholder="Cerca"
											   id="autocomplete-autocomplete-three"
											   name="query"
											   value="${param.query}"
											   data-bs-autocomplete="[]"
											   data-focus-mouse="false" />
										<ul class="autocomplete-list"></ul>

										<div class="input-group-append">
											<button class="btn btn-primary" type="submit" id="button-3">Invio</button>
										</div>

										<span class="autocomplete-icon">
											<svg class="icon icon-sm icon-primary" role="img">
												<title>Cerca</title>
												<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
											</svg>
										</span>
									</div>
								</div>
							</div>
							<input type="hidden" name="page" value="1" />
						</div>
					</form>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-8 offset-lg-2 px-0 px-sm-3">
						<div class="cmp-accordion faq">
							<div class="accordion" id="accordion-faq">
								<c:choose>
									<c:when test="${empty value.TypesToCollect}">
										<div>Seleziona il tipo di risorsa</div>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${search.numFound > 0}">
												<c:forEach var="result" items="${search.searchResults}" varStatus="loop">
													<c:set var="index" value="${loop.index}" scope="request" />
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
						</div>
					</div>

					<div class="col-12 col-lg-8 offset-lg-2 px-4">
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
									class="btn btn-outline-primary w-100 mt-40 mb-40 title-medium-bold">
									<span>Carica altre domande</span>
								</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<script>
			const totalFound = <c:out value="${search.numFound}" default="0" />;
			const rowsPerPage = <c:out value="${rowsPerPage}" default="20" />;
		</script>

		<script>
			document.addEventListener('DOMContentLoaded', function () {
				const loadMoreBtn = document.getElementById('loadMoreBtn');
				const pageInput = document.getElementById('pageInput');
				let currentPage = parseInt(pageInput?.value || '1', 10);
				if (isNaN(currentPage) || currentPage < 1) currentPage = 1;

				if (loadMoreBtn && (currentPage * rowsPerPage < totalFound)) {
					loadMoreBtn.disabled = false;
					loadMoreBtn.querySelector('span').textContent = 'Carica altri risultati';
				} else if (loadMoreBtn) {
					loadMoreBtn.disabled = true;
					loadMoreBtn.querySelector('span').textContent = 'Nessun altro risultato';
				}

				loadMoreBtn?.addEventListener('click', function () {
					const btn = this;
					const query = document.getElementById('queryInput')?.value || '';
					let page = parseInt(pageInput.value || '1', 10);
					if (isNaN(page)) page = 1;

					btn.disabled = true;
					btn.querySelector('span').textContent = 'Caricamento...';
					page += 1;
					pageInput.value = page;

					const params = new URLSearchParams({ query, page });

					fetch(window.location.pathname + '?' + params.toString(), {
						headers: { 'X-Requested-With': 'XMLHttpRequest' }
					})
						.then(response => response.text())
						.then(html => {
							const parser = new DOMParser();
							const doc = parser.parseFromString(html, 'text/html');
							const newResults = doc.querySelectorAll('.accordion-item');
							const resultsContainer = document.getElementById('accordion-faq');

							if (newResults.length > 0) {
								newResults.forEach(item => resultsContainer.appendChild(item));

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

				const searchForm = document.querySelector('form[method="post"]');
				searchForm?.addEventListener('submit', function () {
					const pageInputMain = this.querySelector('input[name="page"]');
					if (pageInputMain && pageInput) {
						pageInputMain.value = pageInput.value;
					}
				});
			});
		</script>

	</cms:bundle>
</cms:formatter>
