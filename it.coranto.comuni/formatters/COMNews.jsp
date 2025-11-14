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
						<div class="row mt-5 mb-4">
							<div class="col-6">
								<small><fmt:message key="label.date"/>:</small>
								<p class="fw-semibold font-monospace"><fmt:formatDate 
																					  value="${cms:convertDate(value.Date)}" 
																					  pattern="d MMMM yyyy" /></p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/share.jsp:07bfaba1-45ee-11f0-ae97-1b1fd91899eb)"%>				
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/actions.jsp:3b89677b-4694-11f0-ae97-1b1fd91899eb)"%>					
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
					</div>
				</div>
			</div>
			<c:if test="${not empty value.Image.value.Image}">
				<div class="container-fluid my-3">
					<div class="row">
						<figure class="figure px-0 img-full">
							<img src="<cms:link>${value.Image.value.Image}</cms:link>" 
								 title="${fn:escapeXml(value.Title)}" 
								 alt="${fn:escapeXml(value.Image.value.Description)}" 
								 class="figure-img img-fluid" />
							<c:if test="${not empty value.Image.value.Caption}">
								<figcaption class="figure-caption text-center pt-3">${value.Image.value.Caption}</figcaption>
							</c:if>
						</figure>
					</div>
				</div>
			</c:if>
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
																<li class="nav-item">
																	<a class="nav-link" href="#descrizione" data-focus-mouse="false">
																		<span><fmt:message key="label.description"/></span>
																	</a>
																</li>
																<c:if test="${not empty value.Attachment}">
																	<li class="nav-item">
																		<a class="nav-link" href="#allegati" data-focus-mouse="false">
																			<span><fmt:message key="label.attachment"/></span>
																		</a>
																	</li>
																</c:if>
																<li class="nav-item">
																	<a class="nav-link" href="#a-cura-di" data-focus-mouse="false">
																		<span><fmt:message key="label.by"/></span>
																	</a>
																</li>
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
						<article id="descrizione" class="it-page-section anchor-offset" data-audio>
							<div ${rdfa.Text} class="richtext-wrapper lora">${value.Text}</div>					
						</article>
						<c:if test="${not empty value.Attachment}">
							<article id="allegati" class="it-page-section anchor-offset mt-5">
								<h5 class="mb-3"><fmt:message key="label.attachment"/></h5>
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
												<div class="col-md-6 col-xl-6 mb-3">
													<div class="card-wrapper">
														<div class="card card-teaser shadow rounded">
															<svg class="icon icon-primary" aria-hidden="true">
																<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-clip</cms:link>"></use>
															</svg>
															<div class="card-body">
																<h3 class="card-title h5 m-0">
																	<a href="${attachmentHref}" title="${attachmentLabel}" aria-label="Scarica il file: ${attachmentLabel}" target="_blank">${attachmentLabel}</a>
																</h3>
															</div>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</article>
						</c:if>
						<c:if test="${not empty value.By}">
							<article id="ufficio-responsabile" class="it-page-section anchor-offset mt-5" data-audio>
								<h5 class="mb-3"><fmt:message key="label.by"/></h5>
								<div class="row">
									<c:forEach var="organizationId" items="${content.valueList.By}" varStatus="status">
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
														<h5 class="card-title">
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
														</h5>
														<div class="card-text">
															<p>${address}</p>
														</div>
													</div>
												</div>
											</div>
										</div>									
									</c:forEach>
								</div>
							</article>
						</c:if>
						<article id="ultimo-aggiornamento" class="anchor-offset mt-5">
							<h4 class="h6"><fmt:message key="label.lastupdate"/>: <span class="h6 fw-normal">${lastModifiedFormatted}</span></h4>
						</article>
					</section>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>