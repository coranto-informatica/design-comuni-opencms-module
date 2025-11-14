<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
	<c:set var="pagesize">5</c:set>						
	<c:set var="argument">\"${value.Title}\"</c:set>
	<c:set var="basePath"></c:set>

	<div class="card card-teaser no-after rounded shadow-sm border border-light">
		<div class="card-body pb-5">
			<h3 class="card-title">${value.Title}</h3>
			<p ${rdfa.Abstract} class="card-text">${value.Abstract}</p>
			<div class="link-list-wrapper mt-4">
				<ul class="link-list">
					<c:set var="searchconfig">
						{
						"ignorequery": true,
						"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=con_locales:${cms.locale}&fq=Argument_${cms.locale}:${argument}&sort=created desc&rows=5&start=0",
						"pagesize": ${pagesize}
						}
					</c:set>	
					<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
					<c:choose>
						<c:when test="${search.numFound > 0}">
							<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
								<c:set var="path">${result.fields['path']}</c:set>	
								<c:set var="type">${result.fields['type']}</c:set>	
								<c:set var="title">${result.fields['title_it_s']}</c:set>	
								<c:set var="elementType">${result.fields['Type_it']}</c:set>	
								<c:set var="organizationType">${result.fields['OrganizationType_it']}</c:set>
								<c:set var="category">${result.fields['Category_it']}</c:set>	

								<c:choose>
									<c:when test="${type eq 'COMNews'}">
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

									<c:when test="${type eq 'COMOrganizationUnit'}">
										<c:choose>
											<c:when test="${organizationType eq 'area'}">
												<c:set var="basePath" value="/amministrazione/aree-amministrative/area/" />
											</c:when>
											<c:when test="${organizationType eq 'ufficio'}">
												<c:set var="basePath" value="/amministrazione/uffici/ufficio/" />
											</c:when>
											<c:when test="${organizationType eq 'giuntacomunale' || organizationType eq 'consigliocomunale' || organizationType eq 'commissione'}">
												<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
											</c:when>
											<c:when test="${organizationType eq 'biblioteca' || organizationType eq 'museo' || organizationType eq 'aziendamunicipalizzata' ||
														  organizationType eq 'ente' || organizationType eq 'fondazione' || organizationType eq 'centroculturale' || organizationType eq 'scuola'}">
												<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
											</c:when>
											<c:otherwise>
												<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
											</c:otherwise>
										</c:choose>
									</c:when>

									<c:when test="${type eq 'COMService'}">
										<c:choose>
											<c:when test="${category eq 'educazioneeformazione'}">
												<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
											</c:when>
											<c:when test="${category eq 'salutebenessereeassistenza'}">
												<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
											</c:when>
											<c:when test="${category eq 'vitalavorativa'}">
												<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
											</c:when>
											<c:when test="${category eq 'mobilitaetrasporti'}">
												<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
											</c:when>
											<c:when test="${category eq 'catastoeurbanistica'}">
												<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
											</c:when>
											<c:when test="${category eq 'anagrafestatocivile'}">
												<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
											</c:when>
											<c:when test="${category eq 'turismo'}">
												<c:set var="basePath" value="/servizi/turismo/turismo/" />
											</c:when>
											<c:when test="${category eq 'giustiziasicurezzapubblica'}">
												<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
											</c:when>
											<c:when test="${category eq 'tributifinanzecontravvenzioni'}">
												<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
											</c:when>
											<c:when test="${category eq 'culturatempolibero'}">
												<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
											</c:when>
											<c:when test="${category eq 'ambiente'}">
												<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
											</c:when>
											<c:when test="${category eq 'impreseecommercio'}">
												<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
											</c:when>
											<c:when test="${category eq 'autorizzazioni'}">
												<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
											</c:when>
											<c:when test="${category eq 'appaltipubblici'}">
												<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
											</c:when>
											<c:when test="${category eq 'agricolturapesca'}">
												<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
											</c:when>
										</c:choose>
									</c:when>

									<c:when test="${type eq 'COMPublicDocument'}">
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
											<c:otherwise>
												Tipo sconosciuto
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>

								<li>
									<a class="list-item active icon-left mb-2" href="<cms:link detailPage='${basePath}'>${path}</cms:link>" data-focus-mouse="false">
										<span class="list-item-title-icon-wrapper">                 
											<span class="text-underline text-success">${title}</span>
										</span>
									</a>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>
								<span class="list-item-title-icon-wrapper">
									<span>Nessun risultato trovato</span>
								</span>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<a class="read-more pt-0" href="<cms:link detailPage='/argomenti/argomento/'>${content.filename}</cms:link>" data-focus-mouse="false">
			<span class="text">Esplora argomento</span>
			<svg class="icon ms-0">
				<use xlink:href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-right</cms:link>"></use>
			</svg>
		</a>
	</div>

</cms:formatter>