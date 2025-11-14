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
						<h1 ${rdfa.Title} data-audio>${value.Name}</h1>
						<h2 class="visually-hidden">Dettagli del luogo</h2>
						<p ${rdfa.Abstract} data-audio>${value.Abstract}</p>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/share.jsp:07bfaba1-45ee-11f0-ae97-1b1fd91899eb)"%>				
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/actions.jsp:3b89677b-4694-11f0-ae97-1b1fd91899eb)"%>					
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
																<c:if test="${not empty value.Description}">
																	<li class="nav-item">
																		<a class="nav-link" href="#descrizione" data-focus-mouse="false">
																			<span><fmt:message key="label.description"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Video}">
																	<li class="nav-item">
																		<a class="nav-link" href="#video" data-focus-mouse="false">
																			<span><fmt:message key="label.video"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Service}">
																	<li class="nav-item">
																		<a class="nav-link" href="#servizi" data-focus-mouse="false">
																			<span><fmt:message key="label.venueservices"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.AccessMode}">
																	<li class="nav-item">
																		<a class="nav-link" href="#modalita-di-accesso" data-focus-mouse="false">
																			<span><fmt:message key="label.accessmode"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${((not empty value.Latitude and not empty value.Longitude) or (not empty value.Address and not empty value.PostalCode))}">
																	<li class="nav-item">
																		<a class="nav-link" href="#indirizzo" data-focus-mouse="false">
																			<span><fmt:message key="label.address"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.OpeningHour}">
																	<li class="nav-item">
																		<a class="nav-link" href="#orario-pubblico" data-focus-mouse="false">
																			<span><fmt:message key="label.openinghour"/></span>
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
																<c:if test="${not empty value.FurtherInformation}">
																	<li class="nav-item">
																		<a class="nav-link" href="#ulteriori-informazioni" data-focus-mouse="false">
																			<span><fmt:message key="label.furtherinformations"/></span>
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
						<c:if test="${not empty value.Description}">
							<article id="descrizione" class="it-page-section anchor-offset" data-audio>
								<h4 class="mb-3"><fmt:message key="label.description"/></h4>
								<div ${rdfa.Description} class="richtext-wrapper lora">${value.Description}</div>
							</article>
						</c:if>
						<c:if test="${not empty value.Video}">
							<article id="servizi" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.video"/></h4>
								<div class="ratio ratio-16x9 my-4">
									<iframe title="${fn:escapeXml(value.Video.value.Title)}" width="500" height="281" src="${value.Video.value.Link}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen=""></iframe>
								</div>
							</article>
						</c:if>
						<c:if test="${not empty value.Service}">
							<article id="servizi" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.venueservices"/></h4>
								<div ${rdfa.Service} class="richtext-wrapper lora">${value.Service}</div>
							</article>
						</c:if>
						<c:if test="${((not empty value.Latitude and not empty value.Longitude) or (not empty value.Address and not empty value.PostalCode))}">
							<article id="indirizzo" class="it-page-section anchor-offset mt-5">
								<h4 class="mb-3"><fmt:message key="label.address"/></h4>
								<c:if test="${not empty value.Latitude and not empty value.Longitude}">
									<div id="map" data-coords="${value.Latitude}, ${value.Longitude}" class="mb-3"></div>
								</c:if>
								<c:if test="${not empty value.Address and not empty value.PostalCode}">
									<div class="richtext-wrapper font-serif mt-3">${value.Address}, ${value.PostalCode}</div>
								</c:if>
							</article>
						</c:if>
						<c:if test="${not empty value.OpeningHour}">
							<article id="orario-pubblico" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.openinghour"/></h4>
								<div ${rdfa.OpeningHoure} class="richtext-wrapper lora">${value.OpeningHour}</div>
							</article>
						</c:if>
						<c:if test="${not empty value.ContactPoint}">
							<article id="contatti" class="it-page-section anchor-offset mt-5" data-audio>
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
															<p><span class="text fw-semibold">Sito web:</span> <a href="${url}" aria-label="Vai alla pagina: ${fn:escapeXml(url)}" title="Vai alla pagina: ${fn:escapeXml(Url)}" target="_blank" class="link-dark">${url}</a></p>
														</c:if>		
													</c:forEach>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</article>
						</c:if>
						<c:if test="${not empty value.FurtherInformation}">
							<article id="ulteriori-informazioni" class="it-page-section anchor-offset mt-5">
								<h4 class="mb-3"><fmt:message key="label.furtherinformations"/></h4>
								<div class="row g-4">
									<ul>		
										<c:forEach var="attachmentWrapper" items="${content.valueList.FurtherInformation}">
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
							</article>
						</c:if>
						<article id="ultimo-aggiornamento" class="anchor-offset mt-5">
							<h4 class="h6"><fmt:message key="label.lastupdate"/>: <span class="h6 fw-normal">${lastModifiedFormatted}</span></h4>
						</article>
					</section>
				</div>
			</div>		
			<script
					src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
					integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
					crossorigin=""></script>
			<script src="<cms:link>/system/modules/it.coranto.comuni/resources/js/map.js</cms:link>"></script>
		</div>

	</cms:bundle>

</cms:formatter>