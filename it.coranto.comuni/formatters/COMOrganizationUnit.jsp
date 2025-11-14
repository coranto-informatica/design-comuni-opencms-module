<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="org.opencms.file.CmsObject, org.opencms.file.CmsResource" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Locale" %>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<%
	CmsJspActionElement cmsElem = new CmsJspActionElement(pageContext, request, response);
CmsObject cmsObject = cmsElem.getCmsObject();

CmsResource res = content.getFile();
long lastModified = res.getDateLastModified();

java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("d/MM/yyyy, HH:mm", java.util.Locale.ITALIAN);
String lastModifiedFormatted = fmt.format(new java.util.Date(lastModified));
request.setAttribute("lastModifiedFormatted", lastModifiedFormatted);
%>

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div>
			<div class="container" id="main-container">
				<div class="row">
					<div class="col px-lg-4">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/breadcrumb.jsp:336c29b7-45e1-11f0-ae97-1b1fd91899eb)"%>	
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 px-lg-4 py-lg-2">
						<h1 ${rdfa.Title} data-audio data-element="news-title">${value.Title}</h1>
						<h2 class="visually-hidden">Dettagli della notizia</h2>
						<p ${rdfa.Abstract} data-audio>${value.Abstract}</p>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/share.jsp:07bfaba1-45ee-11f0-ae97-1b1fd91899eb)"%>				
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/actions.jsp:3b89677b-4694-11f0-ae97-1b1fd91899eb)"%>	
						<c:if test="${not empty value.Argument}">
							<div class="mt-4 mb-4">
								<div class="row">
									<span class="mb-2 small"><fmt:message key="label.arguments"/></span>
								</div>
								<c:set var="argumentFolderPath">/argomenti/argomento/</c:set>
								<ul class="d-flex flex-wrap gap-1">
									<c:forEach 
											   var="argument" 
											   items="${fn:split(fn:replace(fn:replace(content.valueList.Argument, '[', ''), ']', ''), ',')}" 
											   varStatus="status">
										<c:set var="argumentSearch">\"${argument}\"</c:set>
										<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
										<c:set var="pagesize">4</c:set>
										<c:set var="searchconfig">
											{
											"ignorequery": true,
											"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMArgument&fq=con_locales:${cms.locale}&fq=title_${cms.locale}_s=${argumentSearch}",
											"pagesize": ${pagesize}
											}
										</c:set>							
										<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">
											<c:set var="argumentPath">${result.fields['path']}</c:set>
										</c:forEach>
										<li>
											<a class="chip chip-simple" href="<cms:link detailPage='${argumentFolderPath}'>${argumentPath}</cms:link>" title="Vai all'argomento: ${argument}" data-element="news-topic" data-focus-mouse="false">
												<span class="chip-label">${argument}</span>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row border-top border-light row-column-border row-column-menu-left">
					<aside class="col-lg-3">
						<div class="cmp-navscroll sticky-top" aria-labelledby="accordion-title-one">
							<nav class="navbar it-navscroll-wrapper navbar-expand-lg" aria-label="INDICE DELLA PAGINA" data-bs-navscroll>
								<div class="navbar-custom" id="navbarNavProgress">
									<div class="menu-wrapper">
										<div class="link-list-wrapper">
											<div class="accordion">
												<div class="accordion-item">
													<span class="accordion-header" id="accordion-title-one">
														<button class="accordion-button pb-10 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-one" aria-expanded="true" aria-controls="collapse-one">
															<fmt:message key="label.index"/>
															<svg class="icon icon-xs right">
																<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-expand</cms:link>"></use>
															</svg>
														</button>
													</span>
													<div class="progress">
														<div class="progress-bar it-navscroll-progressbar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
													<div id="collapse-one" class="accordion-collapse collapse show" role="region" aria-labelledby="accordion-title-one">
														<div class="accordion-body">
															<ul class="link-list" data-element="page-index">
																<c:if test="${not empty value.Competency}">
																	<li class="nav-item">
																		<a class="nav-link" href="#competenze" data-focus-mouse="false">
																			<span><fmt:message key="label.competency"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.OrganizationUnitParent}">
																	<li class="nav-item">
																		<a class="nav-link"href="#area-di-riferimento" data-focus-mouse="false">
																			<span><fmt:message key="label.organizationunitparent"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Person}">
																	<li class="nav-item">
																		<a class="nav-link" href="#persone" data-focus-mouse="false">
																			<span><fmt:message key="label.people"/></span>
																		</a>
																	</li>
																</c:if>															
																<c:if test="${not empty value.Service}">
																	<li class="nav-item">
																		<a class="nav-link" href="#servizi-collegati" data-focus-mouse="false">
																			<span><fmt:message key="label.services"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Venue}">
																	<li class="nav-item">
																		<a class="nav-link" href="#sede-principale" data-focus-mouse="false">
																			<span><fmt:message key="label.mainvenue"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.ContactPoint}">
																	<li class="nav-item">
																		<a class="nav-link" href="#contatti" data-focus-mouse="false">
																			<span><fmt:message key="label.contacts"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Attachment}">
																	<li class="nav-item">
																		<a class="nav-link" href="#allegati" data-focus-mouse="false">
																			<span><fmt:message key="label.attachment"/></span>
																		</a>
																	</li>
																</c:if>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</nav>
						</div>
					</aside>
					<section class="col-lg-9 it-page-sections-container border-light">
						<c:if test="${not empty value.Competency}">
							<section id="competenze" class="it-page-section anchor-offset" data-audio>
								<div ${rdfa.Competency} class="richtext-wrapper lora">${value.Competency}</div>					
							</section>
						</c:if>
						<c:if test="${not empty value.OrganizationType}">
							<section class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.organizationtype"/></h4>
								<p class="font-serif">
									<c:choose>
										<c:when test="${value.OrganizationType eq 'area'}">Area</c:when>
										<c:when test="${value.OrganizationType eq 'ufficio'}">Ufficio</c:when>
										<c:when test="${value.OrganizationType eq 'giuntacomunale'}">Giunta comunale</c:when>
										<c:when test="${value.OrganizationType eq 'consigliocomunale'}">Consiglio comunale</c:when>
										<c:when test="${value.OrganizationType eq 'commissione'}">Commissione</c:when>
										<c:when test="${value.OrganizationType eq 'biblioteca'}">Biblioteca</c:when>
										<c:when test="${value.OrganizationType eq 'museo'}">Museo</c:when>
										<c:when test="${value.OrganizationType eq 'aziendamunicipalizzata'}">Azienda municipalizzata</c:when>
										<c:when test="${value.OrganizationType eq 'ente'}">Ente</c:when>
										<c:when test="${value.OrganizationType eq 'fondazione'}">Fondazione</c:when>
										<c:when test="${value.OrganizationType eq 'centroculturale'}">Centro culturale</c:when>
										<c:when test="${value.OrganizationType eq 'scuola'}">Scuola</c:when>
										<c:otherwise>Tipo sconosciuto (${value.OrganizationType})</c:otherwise>
									</c:choose>
								</p>
							</section>
						</c:if>
						<c:if test="${not empty value.OrganizationUnitParent}">
							<section id="area-di-riferimento" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.organizationunitparent"/></h4>
								<div class="row">
									<c:forEach var="organizationId" items="${content.valueList.OrganizationUnitParent}" varStatus="status">
										<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
										<c:set var="pagesize">4</c:set>
										<c:set var="searchconfig">
											{
											"ignorequery": true,
											"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMOrganizationUnit&fq=con_locales:${cms.locale}&fq=id:${organizationId}",
											"pagesize": ${pagesize}
											}
										</c:set>							
										<c:set var="venue" value=""/>
										<c:set var="name" value=""/>
										<c:set var="OrganizationType" value=""/>
										<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
											<c:set var="venue">${result.fields['Venue_it']}</c:set>
											<c:set var="name">${result.fields['title_it_s']}</c:set>
											<c:set var="organizationType">${result.fields['OrganizationType_it']}</c:set>
											<c:set var="organizationFilename">${result.fields['path']}</c:set>
										</c:forEach>
										<c:set var="searchconfig2">
											{
											"ignorequery": true,
											"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMVenue&fq=con_locales:${cms.locale}&fq=title_${cms.locale}_s:%22${venue}%22",
											"pagesize": ${pagesize}
											}
										</c:set>	
										<c:set var="address" value=""/>
										<c:set var="postalcode" value=""/>															
										<cms:search configString="${searchconfig2}" var="search" addContentInfo="true" />							
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
											<c:set var="address">${result.fields['Address_it']}</c:set>
										</c:forEach>
										<div class="col-12 col-sm-8 col-xl-6">
											<div class="card-wrapper rounded shadow-sm h-auto">
												<div class="card card-teaser card-teaser-info rounded shadow-sm p-4">
													<div class="card-body pe-3">
														<h4 class="card-title">
															<c:set var="basePath" value=""/>	
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
															<a class="text-decoration-none" href="<cms:link detailPage='${basePath}'>${organizationFilename}</cms:link>">${name}</a>
														</h4>
														<div class="card-text">
															<p>${address}</p>
														</div>
													</div>
												</div>
											</div>
										</div>									
									</c:forEach>
								</div>
							</section>
						</c:if>
						<c:if test="${not empty value.Person}">
							<section id="persone" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.people"/></h4>
								<div class="row">
									<c:set var="path" value="${cms.requestContext.siteRoot}/" />
									<c:forEach var="person" items="${content.valueList.Person}" varStatus="status">
										<c:set var="searchconfig">
											{
											"ignorequery": true,
											"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMPublicPerson&fq=con_locales:${cms.locale}&fq=id:${person}"
											}
										</c:set>
										<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
										<c:forEach var="result" items="${search.searchResults}" varStatus="innerStatus">
											<c:set var="fullname" value="${result.fields['title_it_s']}" />
											<c:set var="assignment" value="${result.fields['Assignment_it']}" />
											<c:set var="assignmentType" value="${result.fields['AssignmentType_it']}" />
											<c:set var="personFilename">${result.fields['path']}</c:set>
											<div class="col-12 col-sm-8 col-xl-6 mb-3">
												<div class="card-wrapper rounded shadow-sm h-auto">
													<div class="card card-teaser card-teaser-info rounded shadow-sm p-4">
														<div class="card-body pe-3">
															<h4 class="card-title">
																<c:choose>
																	<c:when test="${assignmentType eq 'politico'}">
																		<c:set var="basePath" value="/amministrazione/politici/politico/" />
																	</c:when>
																	<c:otherwise>
																		<c:set var="basePath" value="/amministrazione/personale-amministrativo/personale-amministrativo/" />
																	</c:otherwise>
																</c:choose>
																<a class="text-decoration-none" href="<cms:link detailPage='${basePath}'>${personFilename}</cms:link>">${fullname}</a>
															</h4>
															<div class="card-text">
																<p>${assignment}</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:forEach>
								</div>
							</section>
						</c:if>
						<c:if test="${not empty value.Service}">
							<section id="servizi-collegati" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.services"/></h4>
								<div class="row">
									<c:set var="path" value="${cms.requestContext.siteRoot}/" />
									<c:forEach var="serviceRaw" items="${fn:split(value.Service, ',')}" varStatus="status">
										<c:set var="service" value="${fn:trim(serviceRaw)}" />
										<c:set var="searchconfig">
											{
											"ignorequery": true,
											"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMService&fq=con_locales:${cms.locale}&fq=title_${cms.locale}_s:%22${service}%22"
											}
										</c:set>
										<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
										<c:forEach var="result" items="${search.searchResults}" varStatus="innerStatus">
											<c:set var="title" value="${result.fields['title_it_s']}" />
											<c:set var="servicePath" value="${result.fields['path']}" />
											<c:set var="category" value="${result.fields['Category_it']}" />
											<c:set var="description" value="${result.fields['Abstract_it']}" />
											<div class="col-12 col-sm-8 col-xl-6 mb-3">
												<div class="card-wrapper border border-light rounded shadow-sm pb-0">
													<div class="card no-after rounded">
														<div class="card-body rounded-top">
															<div class="category-top">
																<span class="text fw-semibold">
																	<c:choose>
																		<c:when test="${category eq 'educazioneeformazione'}">
																			<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/educazione-e-formazione/</cms:link>">Educazione e formazione</a>
																		</c:when>
																		<c:when test="${category eq 'salutebenessereeassistenza'}">
																			<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/salute-benessere-e-assistenza/</cms:link>">Salute, benessere e assistenza</a>
																		</c:when>
																		<c:when test="${category eq 'vitalavorativa'}">
																			<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/vita-lavorativa</cms:link>">Vita lavorativa</a>
																		</c:when>
																		<c:when test="${category eq 'mobilitaetrasporti'}">
																			<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/mobilita-e-trasporti/</cms:link>">Mobilità e trasporti</a>
																		</c:when>
																		<c:when test="${category eq 'catastoeurbanistica'}">
																			<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/catasto-e-urbanistica/</cms:link>">Catasto e urbanistica</a>
																		</c:when>
																		<c:when test="${category eq 'anagrafestatocivile'}">
																			<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/anagrafe-e-stato-civile/</cms:link>">Anagrafe e stato civile</a>
																		</c:when>
																		<c:when test="${category eq 'turismo'}">
																			<c:set var="basePath" value="/servizi/turismo/turismo/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/turismo/</cms:link>">Turismo</a>
																		</c:when>
																		<c:when test="${category eq 'giustiziasicurezzapubblica'}">
																			<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/giustizia-e-sicurezza-pubblica/</cms:link>">Giustizia e sicurezza pubblica</a>
																		</c:when>
																		<c:when test="${category eq 'tributifinanzecontravvenzioni'}">
																			<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/tributi-finanze-e-contravvenzioni/</cms:link>">Tributi, finanze e contravvenzioni</a>
																		</c:when>
																		<c:when test="${category eq 'culturatempolibero'}">
																			<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/cultura-e-tempo-libero/</cms:link>">Cultura e tempo libero</a>
																		</c:when>
																		<c:when test="${category eq 'ambiente'}">
																			<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/ambiente/</cms:link>">Ambiente</a>
																		</c:when>
																		<c:when test="${category eq 'impreseecommercio'}">
																			<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/imprese-e-commercio/</cms:link>">Imprese e commercio</a>
																		</c:when>
																		<c:when test="${category eq 'autorizzazioni'}">
																			<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/autorizzazioni/</cms:link>">Autorizzazioni</a>
																		</c:when>
																		<c:when test="${category eq 'appaltipubblici'}">
																			<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/appalti-pubblici/</cms:link>">Appalti pubblici</a>
																		</c:when>
																		<c:when test="${category eq 'agricolturapesca'}">
																			<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
																			<a class="category text-decoration-none" href="<cms:link>/servizi/agricoltura-e-pesca/</cms:link>">Agricoltura e pesca</a>
																		</c:when>
																		<c:otherwise>
																			<c:set var="basePath" value="#" />
																			Tipo sconosciuto (${category})
																		</c:otherwise>
																	</c:choose>
																</span>
															</div>
															<a href="<cms:link detailPage='${basePath}'>${servicePath}</cms:link>" class="text-decoration-none" data-element="news-category-link">
																<h3 class="card-title h4">${title}</h3>
															</a>
															<p class="text-secondary mb-0">${description}</p>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:forEach>
								</div>
							</section>
						</c:if>
						<c:if test="${not empty value.Venue}">
							<section id="sede-principale" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.mainvenue"/></h4>
								<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
								<c:set var="pagesize">4</c:set>						
								<c:set var="venue">${value.Venue}</c:set>
								<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
								<c:set var="searchconfig">
									{
									"ignorequery": true,
									"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMVenue&fq=con_locales:${cms.locale}&fq=title_${cms.locale}_s:%22${venue}%22",
									"pagesize": ${pagesize}
									}
								</c:set>													
								<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />							
								<c:forEach var="result" items="${search.searchResults}" varStatus="status">	
									<c:set var="venuePath">${result.fields['path']}</c:set>
									<c:set var="address">${result.fields['Address_it']}</c:set>
									<c:set var="postalcode">${result.fields['PostalCode_it']}</c:set>
									<c:set var="openingHour">${result.fields['OpeningHour_it']}</c:set>
								</c:forEach>
								<div class="row">
									<div class="col-12">
										<div class="card-wrapper rounded shadow-sm h-auto">
											<div class="card card-teaser card-teaser-info rounded shadow-sm p-4">
												<div class="card-body pe-3">
													<h4 class="card-title">
														<a class="text-decoration-none" href="<cms:link detailPage='/eventi/luoghi/luogo/'>${venuePath}</cms:link>">${venue}</a>
													</h4>
													<div class="card-text">
														<p>${address}, ${postalcode}</p>
													</div>
													<c:if test="${not empty openingHour}">
														<div class="card-text">
															<p>${openingHour}</p>
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</c:if>
						<c:if test="${not empty value.ContactPoint}">
							<section id="contatti" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.contacts"/></h4>
								<div class="col-md-6 col-xl-6 mb-3">
									<div class="card-wrapper">
										<div class="card card-teaser shadow rounded">
											<div class="card-body">
												<c:set var="path" value="${cms.requestContext.siteRoot}/" />
												<c:forEach var="contact" items="${content.valueList.ContactPoint}" varStatus="status">
													<c:set var="searchconfig">
														{
														"ignorequery": true,
														"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMContactPoint&fq=con_locales:${cms.locale}&fq=id:${contact}"
														}
													</c:set>
													<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
													<c:forEach var="result" items="${search.searchResults}" varStatus="innerStatus">
														<c:set var="phonenumber" value="${result.fields['PhoneNumber_it']}" />
														<c:set var="email" value="${result.fields['Email_it']}" />
														<c:set var="fax" value="${result.fields['Fax_it']}" />
														<c:set var="url" value="${result.fields['Url_it']}" />
														<c:set var="pec" value="${result.fields['Pec_it']}" />
														<c:set var="accountType" value="${result.fields['AccountType_it']}" />
														<c:set var="link" value="${result.fields['Link_it']}" />
														<c:if test="${not empty phonenumber}">
															<p><span class="text fw-semibold">Telefono: </span>${phonenumber}</p>
														</c:if>
														<c:if test="${not empty email}">
															<p><span class="text fw-semibold">Email: </span><a href="<cms:link>mailto:${email}</cms:link>" aria-label="Invia una Email a ${email}" title="Invia una Email a ${email}" target="_blank" class="link-dark"> ${email}</a></p>
														</c:if>
														<c:if test="${not empty fax}">
															<p><span class="text fw-semibold">Fax: </span>${fax}</p>
														</c:if>
														<c:if test="${not empty pec}">
															<p><span class="text fw-semibold">PEC: </span><a href="<cms:link>mailto:${pec}</cms:link>" aria-label="Invia una PEC a ${pec}" title="Invia una PEC a ${pec}" target="_blank" class="link-dark"> ${pec}</a></p>
														</c:if>
														<c:if test="${not empty accountType and not empty link}">
															<p>
																<c:choose>
																	<c:when test="${accountType eq 'whatsapp'}">
																		<a href="${link}" aria-label="Invia un messaggio su WhatsApp" title="Invia un messaggio su WhatsApp" target="_blank"><span class="text fw-semibold">WhatsApp</span></a>
																	</c:when>
																	<c:when test="${accountType eq 'telegram'}">
																		<a href="${link}" aria-label="Invia un messaggio su Telegram" title="Invia un messaggio su Telegram" target="_blank"><span class="text fw-semibold">Telegram</span></a>
																	</c:when>
																	<c:when test="${accountType eq 'skype'}">
																		<a href="${link}" aria-label="Avvia una conversazione su Skype" title="Avvia una conversazione su Skype" target="_blank"><span class="text fw-semibold">Skype</span></a>
																	</c:when>
																	<c:when test="${accountType eq 'linkedin'}">
																		<a href="${link}" aria-label="Visita il profilo LinkedIn" title="Visita il profilo LinkedIn" target="_blank" class="link-dark"><span class="text fw-semibold">Linkedin</span></a>
																	</c:when>
																	<c:when test="${accountType eq 'twitter'}">
																		<a href="${link}" aria-label="Visita il profilo Twitter" title="Visita il profilo Twitter" target="_blank" class="link-dark"><span class="text fw-semibold">Twitter</span></a>
																	</c:when>
																	<c:otherwise>
																		<span class="text fw-semibold">${accountType}:</span>
																		<a href="${link}" aria-label="Vai a ${accountType}" title="Vai a ${accountType}" target="_blank" class="link-dark"> ${link}</a>
																	</c:otherwise>
																</c:choose>
															</p>
														</c:if>
														<c:if test="${not empty url}">
															<p><span class="text fw-semibold">Sito web:</span> <a href="${url}" aria-label="Vai alla pagina: ${url}" title="Vai alla pagina: ${fn:escapeXml(Url)}" target="_blank" class="link-dark">${url}</a></p>
														</c:if>		
													</c:forEach>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</section>
						</c:if>
						<c:if test="${not empty value.Attachment}">
							<section id="allegati" class="it-page-section anchor-offset mt-5" data-audio>
								<h4><fmt:message key="label.attachment"/></h4>
								<div class="row g-4">
									<ul>		
										<c:forEach var="attachmentWrapper" items="${content.valueList.Attachment}">
											<%
	String attachmentPath = ((org.opencms.jsp.util.CmsJspContentAccessValueWrapper) pageContext.findAttribute("attachmentWrapper")).getStringValue();
CmsResource attachmentRes = cmsObject.readResource(attachmentPath);
String fileName = CmsResource.getName(attachmentPath);

int lastDotIndex = fileName.lastIndexOf('.');
String fileNameWithoutExtension = (lastDotIndex > 0) ? fileName.substring(0, lastDotIndex) : fileName;

String extension = org.opencms.util.CmsFileUtil.getExtension(fileName).replace(".", "").toUpperCase();
long fileSizeBytes = attachmentRes.getLength();
String sizeStr;
String unit;

if (fileSizeBytes >= 1024 * 1024) {
	long sizeMB = Math.round(fileSizeBytes / (1024.0 * 1024.0));
	sizeStr = Long.toString(sizeMB);
	unit = "MB";
} else {
	long sizeKB = Math.round(fileSizeBytes / 1024.0);
	if (sizeKB < 1) {
		sizeKB = 1;
	}
	sizeStr = Long.toString(sizeKB);
	unit = "KB";
}

String readableLabel = fileNameWithoutExtension.replace("-", " ").replace("_", " ") + " (" + extension + " " + sizeStr + " " + unit + ")";
request.setAttribute("attachmentHref", attachmentPath);
request.setAttribute("attachmentLabel", readableLabel);
%>
											<li>
												<div class="col-12">
													<div class="card-wrapper">
														<div class="card card-teaser shadow rounded">
															<svg class="icon icon-primary" aria-hidden="true">
																<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-clip</cms:link>"></use>
															</svg>
															<div class="card-body">
																<h3 class="card-title h4 m-0">
																	<a href="${attachmentHref}" title="${fn:escapeXml(attachmentLabel)}" aria-label="Scarica il file: ${fn:escapeXml(attachmentLabel)}" target="_blank">${attachmentLabel}</a>
																</h3>
															</div>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</section>
						</c:if>
						<section id="ultimo-aggiornamento" class="anchor-offset mt-5">
							<h4 class="h6"><fmt:message key="label.lastupdate"/>: <span class="h6 fw-normal">${lastModifiedFormatted}</span></h4>
						</section>
					</section>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>