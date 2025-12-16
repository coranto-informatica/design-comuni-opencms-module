<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.net.URLEncoder" %>

<div class="container">

	<c:set var="rowsPerPage" value="10" />
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

	<c:set var="path" value="${cms.requestContext.siteRoot}/.content/" />
	<c:set var="resType" value="${not empty param.resType ? param.resType : '(COMOrganizationUnit or COMPublicPerson or COMPublicDocument or COMService or COMNews or COMVenue or COMEvent)'}" />
	<c:set var="pagesize">10</c:set>

	<c:set var="effectiveQuery" value="${not empty query ? query : param.query}" /> 
	<c:set var="querysearch"></c:set> 

	<c:if test="${not empty effectiveQuery}"> 
		<c:set var="trimmedQuery">${fn:trim(effectiveQuery)}</c:set>
		<c:set var="qSafe">${fn:trim( fn:replace( fn:replace(trimmedQuery, '&#34;', ' '), '&#39;', ' ' ) )} </c:set> 
		<c:set var="querysearch"> 
			&defType=edismax&q=${qSafe}&qf=title_${cms.locale}_s^20 it_excerpt^10 Abstract_${cms.locale}^7 Text_${cms.locale}^4 content_${cms.locale}^2&pf=title_${cms.locale}_s^50 it_excerpt^25 Abstract_${cms.locale}^15&ps=3&tie=0.1&mm=2%3C75%25
		</c:set> 
	</c:if>

	<c:set var="filterArgument">
		<c:choose>
			<c:when test="${not empty param.fq}">
				&fq=${param.fq}
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</c:set>


	<c:set var="searchOrganizationUnit">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMOrganizationUnit&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>

	<c:set var="searchPublicPerson">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMPublicPerson&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>
	<c:set var="searchPublicDocument">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMPublicDocument&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>
	<c:set var="searchService">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMService&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>
	<c:set var="searchNews">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMNews&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>
	<c:set var="searchVenue">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMVenue&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>
	<c:set var="searchEvent">
		{
		"ignorequery" : true,
		"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMEvent&fq=con_locales:${cms.locale}${filterArgument}${querysearch}&rows=0"
		}
	</c:set>

	<c:set var="searchconfig">
		{
		"ignorequery": true,
		"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=con_locales:${cms.locale}${filterArgument}&sort=score desc,created desc&rows=${rowsPerPage}&start=${startIndex}${querysearch}"
		}
	</c:set>




	<cms:search configString="${searchOrganizationUnit}" var="searchOrganizationUnitResult"/>
	<c:set var="totalOrganizationUnitFound" value="${searchOrganizationUnitResult.numFound}" />

	<cms:search configString="${searchPublicPerson}" var="searchPublicPersonResult"/>
	<c:set var="totalPublicPersonFound" value="${searchPublicPersonResult.numFound}" />

	<cms:search configString="${searchPublicDocument}" var="searchPublicDocumentResult" />
	<c:set var="totalPublicDocumentFound" value="${searchPublicDocumentResult.numFound}" />

	<cms:search configString="${searchService}" var="searchServiceResult" />
	<c:set var="totalServiceFound" value="${searchServiceResult.numFound}" />

	<cms:search configString="${searchNews}" var="searchNewsResult"/>
	<c:set var="totalNewsFound" value="${searchNewsResult.numFound}" />

	<cms:search configString="${searchVenue}" var="searchVenueResult" />
	<c:set var="totalVenueFound" value="${searchVenueResult.numFound}" />

	<cms:search configString="${searchEvent}" var="searchEventResult" />
	<c:set var="totalEventFound" value="${searchEventResult.numFound}" />

	<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
	<c:set var="totalFound" value="${search.numFound}" />

	<div class="row justify-content-center">
		<div class="col-lg-3 d-none d-lg-block scroll-filter-wrapper">
			<h2 class="visually-hidden" id="filter">filtri da applicare</h2>
			<fieldset>
				<legend class="h6 text-uppercase category-list__title">Tipologie</legend>
				<div class="categoy-list pb-4">
					<ul>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="unit" name="category" value="unità organizzativa" data-value="COMOrganizationUnit">
									<label for="unit" class="subtitle-small_semi-bold mb-0 category-list__list">Unità organizzativa (${totalOrganizationUnitFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="public-person" name="category" value="persona pubblica" data-value="COMPublicPerson">
									<label for="public-person" class="subtitle-small_semi-bold mb-0 category-list__list">Persona pubblica (${totalPublicPersonFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="documents" name="category" value="documenti" data-value="COMPublicDocument">
									<label for="documents" class="subtitle-small_semi-bold mb-0 category-list__list">Documenti (${totalPublicDocumentFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="services" name="category" value="servizi" data-value="COMService">
									<label for="services" class="subtitle-small_semi-bold mb-0 category-list__list">Servizi (${totalServiceFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="news" name="category" value="novita" data-value="COMNews">
									<label for="news" class="subtitle-small_semi-bold mb-0 category-list__list">Novità (${totalNewsFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="places" name="category" value="luoghi" data-value="COMVenue">
									<label for="places" class="subtitle-small_semi-bold mb-0 category-list__list">Luoghi (${totalVenueFound})</label> 
								</div>
							</div>
						</li>
						<li>
							<div class="form-check">
								<div class="checkbox-body border-light py-1">
									<input type="checkbox" id="events" name="category" value="eventi" data-value="COMEvent">
									<label for="events" class="subtitle-small_semi-bold mb-0 category-list__list">Eventi (${totalEventFound})</label> 
								</div>
							</div>
						</li>
					</ul>
				</div>
			</fieldset>
			<fieldset>
				<legend class="h6 text-uppercase category-list__title">Argomenti</legend>
				<div class="category-list pb-4">
					<c:set var="searchArgument">
						{
						"ignorequery" : true,
						"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:COMArgument&fq=con_locales:${cms.locale}&sort=title_${cms.locale}_s asc&rows=100"
						}
					</c:set>
					<ul>
						<cms:search configString="${searchArgument}" var="searchArgumentResult" addContentInfo="true" />
						<c:forEach var="result" items="${searchArgumentResult.searchResults}" varStatus="status">
							<c:set var="title" value="${result.fields['title_it_s']}" />
							<c:set var="escapedTitle">\"${title}\"</c:set>
							<c:set var="idSafeTitle" value="${fn:replace(title, ' ', '_')}" />
							<!-- Seconda ricerca per conteggio risultati -->
							<c:set var="searchSpecificArgument">
								{
								"ignorequery" : true,
								"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=Argument_it:${escapedTitle}&rows=0${querysearch}"
								}
							</c:set>
							<%
	String title = (String) pageContext.getAttribute("title");
String encodedTitle = URLEncoder.encode(title, "UTF-8");
pageContext.setAttribute("encodedTitle", encodedTitle);
%>
							<cms:search configString="${searchSpecificArgument}" var="specificArgumentResult" />    
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-1">
										<input type="checkbox" 
											   id="${fn:toLowerCase(idSafeTitle)}" 
											   name="argument" 
											   value="${title}"
											   data-value='\"${encodedTitle}\"'>
										<label for="${fn:toLowerCase(idSafeTitle)}" class="subtitle-small_semi-bold mb-0 category-list__list">
											${title} (${specificArgumentResult.numFound})
										</label> 
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</fieldset>
		</div>
		<div class="col-lg-8 offset-lg-1">
			<div class="d-flex justify-content-between align-items-center border-bottom border-light pb-3 mb-2">
				<h2 class="visually-hidden" id="search-result">Risultati di ricerca</h2>
				<span class="search-results u-grey-light"><span class="numResult">${totalFound}</span> Risultati</span>
				<button type="button" data-bs-toggle="modal" data-bs-target="#modal-categories" class="btn p-0 pe-2 d-lg-none">
					<span class="rounded-icon">
						<svg class="icon icon-primary icon-xs" aria-hidden="true">
							<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-funnel</cms:link>"></use>
						</svg>
					</span>
					<span class="t-primary title-xsmall-semi-bold ms-1">Filtra</span>
				</button>
				<button type="button" id="clearFiltersButtonDesktop" class="btn d-none d-lg-block btn-result" disabled="disabled">Rimuovi tutti i filtri</button>
			</div>

			<div class="container p-0">
				<div class="row flex-column-reverse flex-lg-row">
					<div class="col-12 pt-3" id="card-list">
						<c:forEach var="result" items="${search.searchResults}" varStatus="innerStatus">
							<c:set var="type" value="${result.fields['type']}" />
							<c:set var="title" value="${result.fields['title_it_s']}" />
							<c:set var="description" value="${result.fields['Abstract_it']}" />
							<c:set var="assignment" value="${result.fields['Assignment_it']}" />
							<c:set var="organizationType">${result.fields['OrganizationType_it']}</c:set>
							<c:set var="assignmentType">${result.fields['AssignmentType_it']}</c:set>
							<c:set var="elementType">${result.fields['Type_it']}</c:set>
							<c:set var="serviceCategory">${result.fields['Category_it']}</c:set>
							<c:set var="elementPath">${result.fields['path']}</c:set>
							<div class="cmp-card-latest-messages mb-3 mb-4" data-bs-toggle="modal" data-bs-target="#">
								<div class="card shadow-sm px-4 pt-4 pb-4 rounded">
									<span class="visually-hidden">Categoria:</span>
									<div class="card-header border-0 p-0">
										<c:choose>
											<c:when test="${type eq 'COMOrganizationUnit'}">
												<a href="<cms:link>/amministrazione/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Unità organizzativa</a>
												<c:choose>
													<c:when test="${organizationType eq 'area'}">
														<c:set var="basePath" value="/amministrazione/aree-amministrative/area/" />
													</c:when>
													<c:when test="${organizationType eq 'ufficio'}">
														<c:set var="basePath" value="/amministrazione/uffici/ufficio/" />
													</c:when>
													<c:when test="${organizationType eq 'giuntacomunale'}">
														<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
													</c:when>
													<c:when test="${organizationType eq 'consigliocomunale'}">
														<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
													</c:when>
													<c:when test="${organizationType eq 'commissione'}">
														<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
													</c:when>
													<c:when test="${organizationType eq 'biblioteca'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'museo'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'aziendamunicipalizzata'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'ente'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'fondazione'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'centroculturale'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:when test="${organizationType eq 'scuola'}">
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:when>
													<c:otherwise>
														<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${type eq 'COMPublicPerson'}">
												<a href="<cms:link>/amministrazione/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Persona pubblica</a>
												<c:choose>
													<c:when test="${assignmentType eq 'politico'}">
														<c:set var="basePath" value="/amministrazione/politici/politico" />
													</c:when>
													<c:otherwise>
														<c:set var="basePath" value="/amministrazione/personale-amministrativo/personale-amministrativo/" />	
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${type eq 'COMPublicDocument'}">
												<a href="<cms:link>/amministrazione/documenti-e-dati/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Documenti</a>
												<c:choose>
													<c:when test="${elementType eq 'documentoalbopretorio'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-albo-pretorio/documento-albo-pretorio/" />
													</c:when>
													<c:when test="${elementType eq 'modulistica'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/modulistica/modulistica/" />
													</c:when>
													<c:when test="${elementType eq 'documentofunzionamentointerno'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-funzionamento-interno/documento-funzionamento-interno/" />
													</c:when>
													<c:when test="${elementType eq 'attonormativo'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/atti-normativi/atto-normativo/" />
													</c:when>
													<c:when test="${elementType eq 'accordotraenti'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/accordi-tra-enti/accordo-tra-enti/" />
													</c:when>
													<c:when test="${elementType eq 'documentoattivitapolitica'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-attivita-politica/documento-attivita-politica/" />
													</c:when>
													<c:when test="${elementType eq 'documentotecnicosupporto'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-supporto/documento-di-supporto/" />
													</c:when>
													<c:when test="${elementType eq 'istanza'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/istanze/istanza/" />
													</c:when>
													<c:when test="${elementType eq 'documentodiprogrammazionerendicontazione'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/documento-di-programmazione-e-redicontazione/" />
													</c:when>
													<c:when test="${elementType eq 'dataset'}">
														<c:set var="basePath" value="/amministrazione/documenti-e-dati/dataset/dataset/" />
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${type eq 'COMService'}">
												<a href="<cms:link>/servizi/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Servizi</a>
												<c:choose>
													<c:when test="${serviceCategory eq 'educazioneeformazione'}">
														<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
													</c:when>
													<c:when test="${serviceCategory eq 'salutebenessereeassistenza'}">
														<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
													</c:when>
													<c:when test="${serviceCategory eq 'vitalavorativa'}">
														<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
													</c:when>
													<c:when test="${serviceCategory eq 'mobilitaetrasporti'}">
														<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
													</c:when>
													<c:when test="${serviceCategory eq 'catastoeurbanistica'}">
														<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
													</c:when>
													<c:when test="${serviceCategory eq 'anagrafestatocivile'}">
														<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
													</c:when>
													<c:when test="${serviceCategory eq 'turismo'}">
														<c:set var="basePath" value="/servizi/turismo/turismo/" />
													</c:when>
													<c:when test="${serviceCategory eq 'giustiziasicurezzapubblica'}">
														<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
													</c:when>
													<c:when test="${serviceCategory eq 'tributifinanzecontravvenzioni'}">
														<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
													</c:when>
													<c:when test="${serviceCategory eq 'culturatempolibero'}">
														<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
													</c:when>
													<c:when test="${serviceCategory eq 'ambiente'}">
														<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
													</c:when>
													<c:when test="${serviceCategory eq 'impreseecommercio'}">
														<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
													</c:when>
													<c:when test="${serviceCategory eq 'autorizzazioni'}">
														<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
													</c:when>
													<c:when test="${serviceCategory eq 'appaltipubblici'}">
														<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
													</c:when>
													<c:when test="${serviceCategory eq 'agricolturapesca'}">
														<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${type eq 'COMNews'}">
												<a href="<cms:link>/novita/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Novità</a>
												<c:choose>
													<c:when test="${elementType eq 'notizia'}">
														<c:set var="basePath" value="/novita/notizie/notizia/" />
													</c:when>
													<c:when test="${elementType eq 'avviso'}">
														<c:set var="basePath" value="/novita/avvisi/avviso/" />
													</c:when>
													<c:when test="${elementType eq 'comunicato'}">
														<c:set var="basePath" value="/novita/comunicati/comunicato/" />
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${type eq 'COMVenue'}">
												<a href="<cms:link>/eventi/luoghi/</cms:link>" class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase">Luoghi</a>
												<c:set var="basePath" value="/eventi/luoghi/luogo/" />
											</c:when>
											<c:otherwise>
												<a class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase" href="#">${type}</a>	
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body p-0 my-2">
										<h3 class="green-title-big t-primary mb-8"><a href="<cms:link detailPage='${basePath}'>${elementPath}</cms:link>" class="text-decoration-none" data-element="service-link">${title}</a></h3>
										<c:choose>
											<c:when test="${not empty assignment}">
												<p class="text-paragraph">${assignment}</p>
											</c:when>
											<c:otherwise>
												<p class="text-paragraph">${description}</p>	
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<c:set var="shownResults" value="${currentPage * rowsPerPage}" />
			<c:set var="disableButton" value="${(currentPage * rowsPerPage) >= search.numFound}" />

			<div class="container p-0">
				<form id="loadMoreForm" class="d-flex justify-content-center">
					<input type="hidden" id="queryInput" name="query" value="${effectiveQuery}" />
					<input type="hidden" id="pageInput" name="page" value="${currentPage}" />
					<input type="hidden" id="resTypeInput" name="resType" value="${resType}" />
					<input type="hidden" id="filteredArgumentInput" name="filteredArgument" value="${filteredArgument}" />
					<button
							type="button"
							id="loadMoreBtn"
							data-element="load-other-cards"
							class="btn btn-outline-primary pt-15 pb-15 pl-90 pr-90 mb-30 mb-lg-50 full-mb text-button ${disableButton ? 'd-none' : ''}"
							data-focus-mouse="false"
							>
						<span>Carica altri risultati</span>
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal it-dialog-scrollable fade categories-modal" tabindex="-1" id="modal-categories" aria-labelledby="modalrightTitle" style="display: none;" data-focus-mouse="false" aria-hidden="true">
	<div class="modal-dialog modal-dialog-right" role="document">
		<div class="modal-content">
			<div class="modal-header py-3 mb-4">
				<h2 class="modal-title h5 no_toc" id="modalrightTitle">
					${totalFound} Risultati
				</h2>
				<button type="button"  id="clearFiltersButtonMobile">
					Rimuovi tutti i filtri
				</button>
			</div>
			<div class="modal-body">
				<fieldset>
					<legend class="h6 text-uppercase category-list__title">
						Tipologie
					</legend>
					<div class="categoy-list pb-4">
						<ul>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-unita_organizzativa" value="unita_organizzativa" data-value="COMOrganizationUnit">
										<label for="mobile-unita_organizzativa" class="subtitle-small_semi-bold mb-0 category-list__list">Unità Organizzative                             
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-evento" value="evento" data-value="COMEvent">
										<label for="mobile-evento" class="subtitle-small_semi-bold mb-0 category-list__list">Eventi                                  
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-luogo" value="luogo" data-value="COMVenue">
										<label for="mobile-luogo" class="subtitle-small_semi-bold mb-0 category-list__list">Luoghi                                 
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-documento_pubblico" value="documento_pubblico" data-value="COMPublicDocument">
										<label for="mobile-documento_pubblico" class="subtitle-small_semi-bold mb-0 category-list__list">Documenti Pubblici                           
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-notizia" value="notizia" data-value="COMNews">
										<label for="mobile-notizia" class="subtitle-small_semi-bold mb-0 category-list__list">Notizie                              
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-servizio" value="servizio" data-value="COMService">
										<label for="mobile-servizio" class="subtitle-small_semi-bold mb-0 category-list__list">Servizi                          
										</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-check">
									<div class="checkbox-body border-light py-3">
										<input type="checkbox" name="category" id="mobile-persona_pubblica" value="persona_pubblica" data-value="COMPublicPerson">
										<label for="mobile-persona_pubblica" class="subtitle-small_semi-bold mb-0 category-list__list">Persone Pubbliche                         
										</label>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</fieldset>
				<fieldset>
					<legend class="h6 text-uppercase category-list__title">
						Argomenti
					</legend>
					<div class="categoy-list pb-4">
						<ul>
							<c:forEach var="result" items="${searchArgumentResult.searchResults}" varStatus="status">
								<c:set var="title" value="${result.fields['title_it_s']}" />
								<c:set var="escapedTitle">\"${title}\"</c:set>
								<c:set var="idSafeTitle" value="${fn:replace(title, ' ', '_')}" />
								<%
	String title = (String) pageContext.getAttribute("title");
String encodedTitle = URLEncoder.encode(title, "UTF-8");
pageContext.setAttribute("encodedTitle", encodedTitle);
%>
								<li>
									<div class="form-check">
										<div class="checkbox-body border-light py-3">
											<input type="checkbox" 
												   id="mobile-${fn:toLowerCase(idSafeTitle)}" 
												   name="argument" 
												   value="${title}"
												   data-value='\"${encodedTitle}\"'>
											<label for="mobile-${fn:toLowerCase(idSafeTitle)}" class="subtitle-small_semi-bold mb-0 category-list__list">
												${title}
											</label> 
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</fieldset>
			</div>
			<div class="modal-footer mt-3">
				<button class="btn btn-primary w-100" type="button" data-bs-dismiss="modal" aria-label="Filtra e chiudi finestra modale" onclick="goToResults()">
					Vai ai risultati
				</button>
			</div>
		</div>
	</div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', function () {
		const categoryCheckboxes = document.querySelectorAll('input[name="category"]');
		const argumentCheckboxes = document.querySelectorAll('input[name="argument"]');
		const clearButtonDesktop = document.getElementById('clearFiltersButtonDesktop');
		const clearButtonMobile = document.getElementById('clearFiltersButtonMobile');
		const searchForm = document.getElementById('loadMoreForm');
		const resultsContainer = document.getElementById('card-list');
		const numResultElement = document.querySelector('.numResult');
		const loadMoreBtn = document.getElementById('loadMoreBtn');

		function clearAllFiltersAndReload(isMobile = false) {
			const allCheckboxes = document.querySelectorAll(
				'input[type="checkbox"][name="category"], input[type="checkbox"][name="argument"], input[type="checkbox"][name="post_terms[]"]'
			);

			allCheckboxes.forEach(cb => cb.checked = false);

			if (isMobile) {
				const q = document.getElementById('queryInput').value || '';
				window.location.href = window.location.pathname + (q ? ('?query=' + encodeURIComponent(q)) : '');
			} else {
				updateSearch();
				updateClearButtonState();
			}

		}

		if (clearButtonDesktop) {
			clearButtonDesktop.addEventListener('click', () => clearAllFiltersAndReload(false));
		}
		if (clearButtonMobile) {
			clearButtonMobile.addEventListener('click', () => clearAllFiltersAndReload(true));
		}

		// Funzione per attivare/disattivare il bottone "Rimuovi tutti i filtri"
		function updateClearButtonState() {
			const checkboxes = document.querySelectorAll('input[type="checkbox"][name="category"], input[type="checkbox"][name="argument"], input[type="checkbox"][name="post_terms[]"]');
			const isAnyChecked = Array.from(checkboxes).some(cb => cb.checked);

			if (clearButtonDesktop) clearButtonDesktop.disabled = !isAnyChecked;
			if (clearButtonMobile) clearButtonMobile.disabled = !isAnyChecked;
		}

		// Listener per checkbox categoria
		categoryCheckboxes.forEach(checkbox => {
			checkbox.addEventListener('change', () => {
				updateSearch();
				updateClearButtonState();
			});
		});

		// Listener per checkbox argomento
		argumentCheckboxes.forEach(checkbox => {
			checkbox.addEventListener('change', () => {
				updateSearch();
				updateClearButtonState();
			});
		});

		// Funzione di ricerca
		function updateSearch() {
			const selectedTypes = Array.from(categoryCheckboxes)
			.filter(checkbox => checkbox.checked)
			.map(checkbox => checkbox.dataset.value);

			const selectedArguments = Array.from(argumentCheckboxes)
			.filter(checkbox => checkbox.checked)
			.map(checkbox => checkbox.dataset.value);

			let resType = '';
			if (selectedTypes.length > 0) {
				resType = selectedTypes.join(' or ');
				if (selectedTypes.length > 1) {
					resType = '(' + resType + ')';
				}
			} else {
				resType = '(COMOrganizationUnit or COMPublicPerson or COMPublicDocument or COMService or COMNews or COMVenue or COMEvent)';
			}

			let filteredArgument = '';
			if (selectedArguments.length > 0) {
				if (selectedArguments.length === 1) {
					filteredArgument = 'Argument_it:' + selectedArguments[0];
				} else {
					filteredArgument = 'Argument_it:(' + selectedArguments.join(' or ') + ')';
				}
			}

			document.getElementById('resTypeInput').value = resType;
			document.getElementById('filteredArgumentInput').value = filteredArgument;

			const params = new URLSearchParams({
				query: document.getElementById('queryInput').value || '',
				page: 1,
				resType: resType
			});

			if (filteredArgument) {
				params.append('fq', filteredArgument);
			}

			fetch(window.location.pathname + '?' + params.toString(), {
				headers: { 'X-Requested-With': 'XMLHttpRequest' }
			})
				.then(response => response.text())
				.then(html => {
				const parser = new DOMParser();
				const doc = parser.parseFromString(html, 'text/html');

				resultsContainer.innerHTML = doc.getElementById('card-list').innerHTML;

				const newNumResult = doc.querySelector('.numResult');
				if (newNumResult) {
					numResultElement.textContent = newNumResult.textContent;
				}

				const newLoadMoreBtn = doc.getElementById('loadMoreBtn');
				if (newLoadMoreBtn) {
					loadMoreBtn.className = newLoadMoreBtn.className;
					loadMoreBtn.innerHTML = newLoadMoreBtn.innerHTML;
				}
			})
				.catch(err => console.error(err));
		}

		// Listener per il bottone "Carica altri risultati"
		if (loadMoreBtn) {
			loadMoreBtn.addEventListener('click', function () {
				const btn = this;
				const query = document.getElementById('queryInput').value || '';
				let page = parseInt(document.getElementById('pageInput').value, 10);
				const resType = document.getElementById('resTypeInput').value || '';
				const filteredArgument = document.getElementById('filteredArgumentInput').value || '';

				btn.disabled = true;
				btn.querySelector('span').textContent = 'Caricamento...';

				const params = new URLSearchParams({
					query: query,
					page: page + 1,
					resType: resType
				});
				if (filteredArgument) {
					params.append('fq', filteredArgument);
				}

				fetch(window.location.pathname + '?' + params.toString(), {
					headers: { 'X-Requested-With': 'XMLHttpRequest' }
				})
					.then(response => response.text())
					.then(html => {
					const parser = new DOMParser();
					const doc = parser.parseFromString(html, 'text/html');
					const newResults = doc.querySelectorAll('.cmp-card-latest-messages.mb-3.mb-4');

					if (newResults.length > 0) {
						newResults.forEach(item => {
							resultsContainer.appendChild(item);
						});

						page += 1;
						document.getElementById('pageInput').value = page;

						const totalFound = parseInt(numResultElement.textContent, 10);
						if (page * ${rowsPerPage} >= totalFound) {
							btn.classList.add('d-none');
						} else {
							btn.disabled = false;
							btn.querySelector('span').textContent = 'Carica altri risultati';
						}
					} else {
						btn.classList.add('d-none');
					}
				})
					.catch(err => {
					console.error(err);
					btn.disabled = false;
					btn.querySelector('span').textContent = 'Carica altri risultati';
				});
			});
		}
	});
</script>
