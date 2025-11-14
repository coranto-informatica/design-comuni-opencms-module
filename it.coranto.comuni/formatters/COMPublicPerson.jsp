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
						<h1 ${rdfa.Fullname} data-audio data-element="news-title">${value.Fullname}</h1>
						<h2 class="visually-hidden">Dettagli della notizia</h2>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/share.jsp:07bfaba1-45ee-11f0-ae97-1b1fd91899eb)"%>				
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/actions.jsp:3b89677b-4694-11f0-ae97-1b1fd91899eb)"%>	
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
																<c:if test="${not empty value.Assignment.value.Title}">
																	<li class="nav-item">
																		<a class="nav-link" href="#incarico" data-focus-mouse="false">
																			<span><fmt:message key="label.assignment"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Assignment.value.Type}">
																	<li class="nav-item">
																		<a class="nav-link" href="#tipo-di-incarico" data-focus-mouse="false">
																			<span><fmt:message key="label.assignmenttype"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Assignment.value.StartOfAssignment}">
																	<li class="nav-item">
																		<a class="nav-link" href="#data-di-insediamento" data-focus-mouse="false">
																			<span><fmt:message key="label.startofassignment"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Organization}">
																	<li class="nav-item">
																		<a class="nav-link" href="#organizzazione" data-focus-mouse="false">
																			<span><fmt:message key="label.organization"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Competency}">
																	<li class="nav-item">
																		<a class="nav-link" href="#competenze" data-focus-mouse="false">
																			<span><fmt:message key="label.competency"/></span>
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
																<c:if test="${not empty value.TaxReturn}">
																	<li class="nav-item">
																		<a class="nav-link" href="#allegati" data-focus-mouse="false">
																			<span><fmt:message key="label.taxreturn"/></span>
																		</a>
																	</li>
																</c:if>														
																<c:if test="${not empty value.ElectoralExpenses}">
																	<li class="nav-item">
																		<a class="nav-link" href="#allegati" data-focus-mouse="false">
																			<span><fmt:message key="label.electoralexpenses"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.ChangesInEquity}">
																	<li class="nav-item">
																		<a class="nav-link" href="#allegati" data-focus-mouse="false">
																			<span><fmt:message key="label.changesinequity"/></span>
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
						<c:if test="${not empty value.Assignment.value.Title}">
							<article id="incarico" class="it-page-section anchor-offset" data-audio>
								<h4 class="mb-3"><fmt:message key="label.assignment"/></h4>
								<c:forEach var="assignment" items="${content.valueList.Assignment}">
									<p ${assignment.rdfa.Title} class="font-serif">${assignment.value.Title}</p>		
								</c:forEach>
							</article>
						</c:if>
						<c:if test="${not empty value.Assignment.value.Type}">
							<article id="tipo-di-incarico" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.assignmenttype"/></h4>
								<c:set var="assignmentType" value = ""/>
								<c:choose>
									<c:when test = "${value.Assignment.value.Type eq 'politico'}">
										<c:set var="assignmentType" value = "Politico"/>
									</c:when>
									<c:when test = "${value.Assignment.value.Type eq 'amministrativo'}">
										<c:set var="assignmentType" value = "Amministrativo"/>
									</c:when>
									<c:otherwise>
										<c:set var="assignmentType" value = "Altro"/>
									</c:otherwise>
								</c:choose>
								<p class="font-serif">${assignmentType}</p>					
							</article>
						</c:if>
						<c:if test="${not empty value.Assignment.value.StartOfAssignment}">
							<article id="data-di-insediamento" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.startofassignment"/></h4>

								<p class="font-serif"><fmt:formatDate 
																	  value="${cms:convertDate(value.Assignment.value.StartOfAssignment)}" 
																	  pattern="d MMMM yyyy" /></p>					
							</article>
						</c:if>
						<c:if test="${not empty value.Organization}">
							<article id="organizzazione" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.organization"/></h4>
								<div class="row">
									<c:forEach var="organizationId" items="${content.valueList.Organization}" varStatus="status">
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
							</article>
						</c:if>
						<c:if test="${not empty value.Competency}">
							<article id="descrizione" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.competency"/></h4>
								<div ${rdfa.Competency} class="richtext-wrapper lora">${value.Competency}</div>					
							</article>
						</c:if>
						<c:if test="${not empty value.ContactPoint}">
							<article id="contatti" class="it-page-section anchor-offset mt-5" data-audio>
								<h4 class="mb-3"><fmt:message key="label.contacts"/></h4>
								<div class="col-12">
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
																		<a href="${link}" aria-label="Avvia una conversazione su Skype" title="Avvia una conversazione su Skype" target="_blank"><span class="text fw-semibold">Skype</span>}</a>
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
															<p><span class="text fw-semibold">Sito web:</span> <a href="${url}" aria-label="Vai alla pagina: ${fn:escapeXml(url)}" title="Vai alla pagina: ${fn:escapeXml(url)}" target="_blank" class="link-dark">${url}</a></p>
														</c:if>		
													</c:forEach>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</article>
						</c:if>
						<c:if test="${not empty value.TaxReturn}">
							<article id="tax-return" class="it-page-section anchor-offset mt-5">
								<h4 class="mb-3"><fmt:message key="label.taxreturn"/></h4>
								<div class="row g-4">
									<ul>
										<c:forEach var="attachmentWrapper" items="${content.valueList.TaxReturn}">
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
						<c:if test="${not empty value.ElectoralExpenses}">
							<article id="electoral-expenses" class="it-page-section anchor-offset mt-5">
								<h4 class="mb-3"><fmt:message key="label.electoralexpenses"/></h4>
								<div class="row g-4">
									<ul>
										<c:forEach var="attachmentWrapper" items="${content.valueList.ElectoralExpenses}">
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
%>st.setAttribute("attachmentLabel", readableLabel);
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
						<c:if test="${not empty value.ChangesInEquity}">
							<article id="changes-in-equity" class="it-page-section anchor-offset mt-5">
								<h4 class="mb-3"><fmt:message key="label.changesinequity"/></h4>
								<div class="row g-4">
									<ul>
										<c:forEach var="attachmentWrapper" items="${content.valueList.ChangesInEquity}">
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

						<article id="ultimo-aggiornamento" class="anchor-offset mt-5">
							<h4 class="h6"><fmt:message key="label.lastupdate"/>: <span class="h6 fw-normal">${lastModifiedFormatted}</span></h4>
						</article>
					</section>
				</div>
			</div>
		</div>
	</cms:bundle>

</cms:formatter>