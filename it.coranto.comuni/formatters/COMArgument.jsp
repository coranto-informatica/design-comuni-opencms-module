<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div>
			<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
			<c:set var="pagesize">3</c:set>						
			<c:set var="argument">\"${value.Title}\"</c:set>
			<c:set var="basePath"></c:set>
			<div class="it-hero-wrapper it-wrapped-container" id="main-container">
				<c:choose>
					<c:when test="${not empty value.Image.value.Image}">
						<div class="img-responsive-wrapper">
							<div class="img-responsive">
								<div class="img-wrapper">
									<img src="<cms:link>${value.Image.value.Image}</cms:link>" alt="${fn:escapeXml(value.Image.value.Description)}" title="${fn:escapeXml(value.Image.value.Title)}">    
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="img-responsive-wrapper">
							<div class="img-responsive">
								<div class="img-wrapper">
									<img src="<cms:link>/system/modules/it.coranto.comuni/assets/images/evidenza-header.png</cms:link>" alt="Immagine di sfondo" title="Immagine di sfondo">    
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="container">
					<div class="row">
						<div class="col-12 px-0 px-lg-2">
							<div class="it-hero-card it-hero-bottom-overlapping rounded hero-p pb-lg-80 drop-shadow ">
								<div class="row justify-content-center">
									<div class="col-12 col-lg-10">
										<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/breadcrumb.jsp:336c29b7-45e1-11f0-ae97-1b1fd91899eb)"%>	             
									</div>
								</div>
								<div class="row sport-wrapper justify-content-between mt-lg-2">
									<div class="col-12 col-lg-5 offset-lg-1">
										<h1 class="mb-3 mb-lg-4 title-xxlarge">${value.Title}</h1>
										<h2 class="visually-hidden" id="news-details">Dettagli dell'argomento</h2>
										<p ${rdfa.Abstract} class="u-main-black text-paragraph-regular-medium mb-60">${value.Abstract}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<section id="novita">
				<div class="bg-grey-card pt-40 pt-md-100 pb-50">
					<div class="container">
						<div class="row row-title">
							<div class="col-12">
								<h3 class="u-grey-light border-bottom border-semi-dark pb-2 pb-lg-3 mt-lg-3 title-large-semi-bold"><fmt:message key="label.news"/></h3>
							</div>
						</div>
						<div class="row pt-4 mt-lg-2 pb-lg-4">							
							<c:set var="searchconfig">
								{
								"ignorequery": true,
								"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMNews&fq=con_locales:${cms.locale}&fq=Argument_${cms.locale}:${argument}&sort=created desc&rows=3&start=0",
								"pagesize": ${pagesize}
								}
							</c:set>	
							<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
							<c:choose>
								<c:when test="${search.numFound > 0}">
									<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
										<c:set var="newsPath">${result.fields['path']}</c:set>
										<c:set var="newsType">${result.fields['Type_it']}</c:set>
										<c:set var="newsDate">${result.fields['Date_it_dt']}</c:set>
										<c:set var="newsTitle">${result.fields['title_it_s']}</c:set>
										<c:set var="newsAbstract">${result.fields['Abstract_it']}</c:set>
										<c:set var="newsImage">${result.fields['Image_it']}</c:set>
										<c:set var="newsImageDescription">${result.fields['ImageDescription_it']}</c:set>
										<c:set var="newsImageTitle">${result.fields['ImageTitle_it']}</c:set>
										<div class="col-12 col-md-6 col-lg-4">
											<div class="card-wrapper">
												<div class="card card-img no-after rounded sm-row">
													<c:if test="${not empty newsImage}">
														<div class="img-responsive-wrapper">
															<div class="img-responsive img-responsive-panoramic">
																<figure class="img-wrapper">
																	<img src="<cms:link>${newsImage}</cms:link>" title="${fn:escapeXml(newsImageTitle)}" alt="${fn:escapeXml(newsImageDescription)}">
																</figure>
															</div>
														</div>
													</c:if>
													<div class="card-body p-4">
														<div class="category-top">
															<c:choose>
																<c:when test="${newsType eq 'notizia'}">
																	<a class="text-decoration-none fw-semibold" href="<cms:link>/novita/notizie/</cms:link>" data-focus-mouse="false">NOTIZIE</a>
																	<c:set var="basePath" value="/novita/notizie/notizia/" />
																</c:when>
																<c:when test="${newsType eq 'avviso'}">
																	<a class="text-decoration-none fw-semibold" href="<cms:link>/novita/avvisi/</cms:link>" data-focus-mouse="false">AVVISI</a>
																	<c:set var="basePath" value="/novita/avvisi/avviso/" />
																</c:when>
																<c:when test="${newsType eq 'comunicato'}">
																	<a class="text-decoration-none fw-semibold" href="<cms:link>/novita/comunicati/</cms:link>" data-focus-mouse="false">COMUNICATI</a>
																	<c:set var="basePath" value="/novita/comunicati/comunicato/" />
																</c:when>
																<c:otherwise>Tipo sconosciuto (${value.Type})</c:otherwise>
															</c:choose>
															<%
	String rawDateStr = (String) pageContext.getAttribute("newsDate");
Date parsedDate = null;

try {
	if (rawDateStr != null && !rawDateStr.isEmpty()) {
		SimpleDateFormat parser = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		parsedDate = parser.parse(rawDateStr);
	}
} catch (Exception e) {
	out.println("Errore nella conversione della data: " + e.getMessage());
}

request.setAttribute("parsedDate", parsedDate);
%>
															<fmt:formatDate value="${parsedDate}" pattern="dd MMM yyyy" var="formattedDate" />
															<span class="data text-secondary">${fn:toUpperCase(formattedDate)}</span>
														</div>
														<h3 class="mb-0">
															<a href="<cms:link detailPage='${basePath}'>${newsPath}</cms:link>" class="text-decoration-none" data-focus-mouse="false">${newsTitle}</a>
														</h3>
														<p class="pt-3 text-secondary">${newsAbstract}</p>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="pt-3 text-secondary">Nessun risultato trovato</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="row mt-lg-2">
							<div class="col-12 col-lg-3 offset-lg-9">
								<button type="button" class="btn btn-primary text-button w-100" onclick="location.href='<cms:link>/novita/</cms:link>'">
									<fmt:message key="label.allnews"/>
								</button>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="amministrazione">
				<div class="pb-40 pt-40 pt-lg-80">
					<div class="container">
						<div class="row row-title">
							<div class="col-12">
								<h3 class="u-grey-light border-bottom border-semi-dark pb-2 pb-lg-3 title-large-semi-bold"><fmt:message key="label.administration"/></h3>
							</div>
						</div>
						<div class="row mx-0">
							<div class="card-wrapper px-0 card-teaser-wrapper card-teaser-wrapper-equal card-teaser-block-3">
								<c:set var="searchconfig">
									{
									"ignorequery": true,
									"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMOrganizationUnit&fq=con_locales:${cms.locale}&fq=Argument_${cms.locale}:${argument}&sort=created desc&rows=3&start=0",
									"pagesize": ${pagesize}
									}
								</c:set>	
								<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
								<c:choose>
									<c:when test="${search.numFound > 0}">
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
											<c:set var="organizationPath">${result.fields['path']}</c:set>
											<c:set var="organizationType">${result.fields['OrganizationType_it']}</c:set>
											<c:set var="organizationTitle">${result.fields['title_it_s']}</c:set>
											<c:set var="organizationPerson">${result.fields['Person_it']}</c:set>
											<c:set var="locale" value="${cms.locale}" />
											<div class="card card-teaser card-teaser-image card-flex no-after rounded shadow-sm border border-light mb-0">
												<div class="card-image-wrapper with-read-more">
													<div class="card-body p-3">
														<div class="category-top">
															<c:choose>
																<c:when test="${organizationType eq 'area'}">
																	<c:set var="basePath" value="/amministrazione/aree-amministrative/area/" />
																	<a href="<cms:link>/amministrazione/aree-amministrative/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Area</a>
																</c:when>
																<c:when test="${organizationType eq 'ufficio'}">
																	<c:set var="basePath" value="/amministrazione/uffici/ufficio/" />
																	<a href="<cms:link>/amministrazione/uffici/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Ufficio</a>
																</c:when>
																<c:when test="${organizationType eq 'giuntacomunale'}">
																	<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
																	<a href="<cms:link>/amministrazione/organi-di-governo/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Giunta comunale</a>
																</c:when>
																<c:when test="${organizationType eq 'consigliocomunale'}">
																	<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
																	<a href="<cms:link>/amministrazione/organi-di-governo/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Consiglio comunale</a>
																</c:when>
																<c:when test="${organizationType eq 'commissione'}">
																	<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
																	<a href="<cms:link>/amministrazione/organi-di-governo/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Commissione</a>
																</c:when>
																<c:when test="${organizationType eq 'biblioteca'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Biblioteca</a>
																</c:when>
																<c:when test="${organizationType eq 'museo'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Museo</a>
																</c:when>
																<c:when test="${organizationType eq 'aziendamunicipalizzata'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Azienda municipalizzata</a>
																</c:when>
																<c:when test="${organizationType eq 'ente'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Ente</a>
																</c:when>
																<c:when test="${organizationType eq 'fondazione'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Fondazione</a>
																</c:when>
																<c:when test="${organizationType eq 'centroculturale'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Centro culturale</a>
																</c:when>
																<c:when test="${organizationType eq 'scuola'}">
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Scuola</a>
																</c:when>
																<c:otherwise>
																	<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
																	<a href="<cms:link>/amministrazione/enti-e-fondazioni/</cms:link>" class="title-xsmall-semi-bold fw-semibold text-decoration-none" data-focus-mouse="false">Ente o fondazione</a>
																</c:otherwise>
															</c:choose>
														</div>
														<h4 class="card-title u-grey-light">
															<a href="<cms:link detailPage='${basePath}'>${organizationPath}</cms:link>" class="text-decoration-none" data-focus-mouse="false">${organizationTitle}</a>
														</h4>
														<%
	String organizationPersonStr = (String) pageContext.getAttribute("organizationPerson");
if (organizationPersonStr != null) {
	String[] uuids = organizationPersonStr.replace("\r", "").split("\\s+");
	for (int i = 0; i < uuids.length; i++) {
		request.setAttribute("currentUuid", uuids[i]);
		%>
														<c:set var="searchconfigOrg">
															{
															"ignorequery": true,
															"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMPublicPerson&fq=con_locales:${locale}&fq=id:${currentUuid}"
															}
														</c:set>
														<cms:search configString="${searchconfigOrg}" var="searchOrg" addContentInfo="true" />
														<c:forEach var="person" items="${searchOrg.searchResults}">
															<p class="text-paragraph-card u-grey-light m-0">${person.fields['title_it_s']}</p>
														</c:forEach>
														<%
		}
}
%>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p class="pt-3 text-secondary">Nessun risultato trovato</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-12 col-lg-3 offset-lg-9">
								<button type="button" class="btn btn-primary text-button w-100" onclick="location.href='<cms:link>/amministrazione/</cms:link>'">
									<fmt:message key="label.alladministration"/>
								</button>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="servizi">
				<div class="pb-40 pt-40 pt-lg-80">
					<div class="container">
						<div class="row row-title">
							<div class="col-12">
								<h3 class="u-grey-light border-bottom border-semi-dark pb-2 pb-lg-3 title-large-semi-bold"><fmt:message key="label.service"/></h3>
							</div>
						</div>
						<div class="row mx-0">
							<div class="card-wrapper px-0 card-teaser-wrapper card-teaser-wrapper-equal card-teaser-block-3">
								<c:set var="searchconfig">
									{
									"ignorequery": true,
									"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMService&fq=con_locales:${cms.locale}&fq=Argument_${cms.locale}:${argument}&sort=created desc&rows=3&start=0",
									"pagesize": ${pagesize}
									}
								</c:set>	
								<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
								<c:choose>
									<c:when test="${search.numFound > 0}">
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
											<c:set var="servicePath">${result.fields['path']}</c:set>
											<c:set var="serviceCategory">${result.fields['Category_it']}</c:set>
											<c:set var="serviceTitle">${result.fields['title_it_s']}</c:set>
											<c:set var="serviceAbstract">${result.fields['Abstract_it']}</c:set>		
											<div class="card card-teaser card-teaser-image card-flex no-after rounded shadow-sm border border-light mb-0">
												<div class="card-image-wrapper with-read-more">
													<div class="card-body p-3">
														<div class="category-top">
															<c:choose>
																<c:when test="${serviceCategory eq 'educazioneeformazione'}">
																	<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/educazione-e-formazione/</cms:link>" data-focus-mouse="false">Educazione e formazione</a>
																</c:when>
																<c:when test="${serviceCategory eq 'salutebenessereeassistenza'}">
																	<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/salute-benessere-e-assistenza/</cms:link>" data-focus-mouse="false">Salute, benessere e assistenza</a>
																</c:when>
																<c:when test="${serviceCategory eq 'vitalavorativa'}">
																	<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/vita-lavorativa</cms:link>" data-focus-mouse="false">Vita lavorativa</a>
																</c:when>
																<c:when test="${serviceCategory eq 'mobilitaetrasporti'}">
																	<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/mobilita-e-trasporti/</cms:link>" data-focus-mouse="false">Mobilità e trasporti</a>
																</c:when>
																<c:when test="${serviceCategory eq 'catastoeurbanistica'}">
																	<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/catasto-e-urbanistica/</cms:link>" data-focus-mouse="false">Catasto e urbanistica</a>
																</c:when>
																<c:when test="${serviceCategory eq 'anagrafestatocivile'}">
																	<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/anagrafe-e-stato-civile/</cms:link>" data-focus-mouse="false">Anagrafe e stato civile</a>
																</c:when>
																<c:when test="${serviceCategory eq 'turismo'}">
																	<c:set var="basePath" value="/servizi/turismo/turismo/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/turismo/</cms:link>" data-focus-mouse="false">Turismo</a>
																</c:when>
																<c:when test="${serviceCategory eq 'giustiziasicurezzapubblica'}">
																	<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/giustizia-e-sicurezza-pubblica/</cms:link>" data-focus-mouse="false">Giustizia e sicurezza pubblica</a>
																</c:when>
																<c:when test="${serviceCategory eq 'tributifinanzecontravvenzioni'}">
																	<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/tributi-finanze-e-contravvenzioni/</cms:link>" data-focus-mouse="false">Tributi, finanze e contravvenzioni</a>
																</c:when>
																<c:when test="${serviceCategory eq 'culturatempolibero'}">
																	<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/cultura-e-tempo-libero/</cms:link>" data-focus-mouse="false">Cultura e tempo libero</a>
																</c:when>
																<c:when test="${serviceCategory eq 'ambiente'}">
																	<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/ambiente/</cms:link>" data-focus-mouse="false">Ambiente</a>
																</c:when>
																<c:when test="${serviceCategory eq 'impreseecommercio'}">
																	<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/imprese-e-commercio/</cms:link>" data-focus-mouse="false">Imprese e commercio</a>
																</c:when>
																<c:when test="${serviceCategory eq 'autorizzazioni'}">
																	<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/autorizzazioni/</cms:link>" data-focus-mouse="false">Autorizzazioni</a>
																</c:when>
																<c:when test="${serviceCategory eq 'appaltipubblici'}">
																	<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/appalti-pubblici/</cms:link>" data-focus-mouse="false">Appalti pubblici</a>
																</c:when>
																<c:when test="${serviceCategory eq 'agricolturapesca'}">
																	<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/servizi/agricoltura-e-pesca/</cms:link>" data-focus-mouse="false">Agricoltura e pesca</a>
																</c:when>
																<c:otherwise>
																	<c:set var="basePath" value="#" />
																	Tipo sconosciuto (${serviceCategory})
																</c:otherwise>
															</c:choose>
														</div>
														<h4 class="card-title u-grey-light">
															<a href="<cms:link detailPage='${basePath}'>${servicePath}</cms:link>" class="text-decoration-none" data-focus-mouse="false">${serviceTitle}</a>
														</h4>
														<p class="text-paragraph-card u-grey-light m-0">${serviceAbstract}</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p class="pt-3 text-secondary">Nessun risultato trovato</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-12 col-lg-3 offset-lg-9">
								<button type="button" class="btn btn-primary text-button w-100" onclick="location.href='<cms:link>/servizi/</cms:link>'">
									<fmt:message key="label.allservices"/>
								</button>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="documenti">
				<div class="pb-40 pt-40 pt-lg-80">
					<div class="container">
						<div class="row row-title">
							<div class="col-12">
								<h3 class="u-grey-light border-bottom border-semi-dark pb-2 pb-lg-3 title-large-semi-bold"><fmt:message key="label.documents"/></h3>
							</div>
						</div>
						<div class="row mx-0">
							<div class="card-wrapper px-0 card-teaser-wrapper card-teaser-wrapper-equal card-teaser-block-3">
								<c:set var="searchconfig">
									{
									"ignorequery": true,
									"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMPublicDocument&fq=con_locales:${cms.locale}&fq=Argument_${cms.locale}:${argument}&sort=created desc&rows=3&start=0",
									"pagesize": ${pagesize}
									}
								</c:set>	
								<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
								<c:choose>
									<c:when test="${search.numFound > 0}">
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
											<c:set var="documentPath">${result.fields['path']}</c:set>
											<c:set var="documentType">${result.fields['Type_it']}</c:set>
											<c:set var="documentTitle">${result.fields['title_it_s']}</c:set>
											<c:set var="documentAbstract">${result.fields['Abstract_it']}</c:set>		
											<div class="card card-teaser card-teaser-image card-flex no-after rounded shadow-sm border border-light mb-0">
												<div class="card-image-wrapper with-read-more">
													<div class="card-body p-3">
														<div class="category-top">
															<c:choose>
																<c:when test="${documentType eq 'documentoalbopretorio'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-albo-pretorio/</cms:link>" data-focus-mouse="false">Documenti albo Pretorio</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-albo-pretorio/documento-albo-pretorio/" />
																</c:when>
																<c:when test="${documentType eq 'modulistica'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/modulistica/</cms:link>" data-focus-mouse="false">Modulistica</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/modulistica/modulistica/" />
																</c:when>
																<c:when test="${documentType eq 'documentofunzionamentointerno'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-funzionamento-interno/</cms:link>" data-focus-mouse="false">Documento funzionamento interno</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-funzionamento-interno/documento-funzionamento-interno/" />
																</c:when>
																<c:when test="${documentType eq 'attonormativo'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/atti-normativi/</cms:link>" data-focus-mouse="false">Atto normativo</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/atti-normativi/atto-normativo/" />
																</c:when>
																<c:when test="${documentType eq 'accordotraenti'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/accordi-tra-enti/</cms:link>" data-focus-mouse="false">Accordo tra enti</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/accordi-tra-enti/accordo-tra-enti/" />
																</c:when>
																<c:when test="${documentType eq 'documentoattivitapolitica'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-attivita-politica/</cms:link>" data-focus-mouse="false">Documento attività politica</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-attivita-politica/documento-attivita-politica/" />
																</c:when>
																<c:when test="${documentType eq 'documentotecnicosupporto'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-di-supporto/</cms:link>" data-focus-mouse="false">Documento tecnico di supporto</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-supporto/documento-di-supporto/" />
																</c:when>
																<c:when test="${documentType eq 'istanza'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/istanze/</cms:link>" data-focus-mouse="false">Istanza</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/istanze/istanza/" />
																</c:when>
																<c:when test="${documentType eq 'documentodiprogrammazionerendicontazione'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/</cms:link>" data-focus-mouse="false">Documento di programmazione e rendicontazione</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/documento-di-programmazione-e-redicontazione/" />
																</c:when>
																<c:when test="${documentType eq 'dataset'}">
																	<a class="title-xsmall-semi-bold fw-semibold text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/dataset/</cms:link>" data-focus-mouse="false">Dataset</a>
																	<c:set var="basePath" value="/amministrazione/documenti-e-dati/dataset/dataset/" />
																</c:when>
																<c:otherwise>
																	Tipo sconosciuto
																</c:otherwise>
															</c:choose>
														</div>
														<h4 class="card-title u-grey-light">
															<a href="<cms:link detailPage='${basePath}'>${documentPath}</cms:link>" class="text-decoration-none" data-focus-mouse="false">${documentTitle}</a>
														</h4>
														<p class="text-paragraph-card u-grey-light m-0">${documentAbstract}</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p class="pt-3 text-secondary">Nessun risultato trovato</p>
									</c:otherwise>
								</c:choose>	
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-12 col-lg-3 offset-lg-9">
								<button type="button" class="btn btn-primary text-button w-100" onclick="location.href='<cms:link>/amministrazione/documenti-e-dati/</cms:link>'" aria-label="vai a tutti i documenti" data-focus-mouse="false">
									<fmt:message key="label.alldocuments"/>
								</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</cms:bundle>

</cms:formatter>