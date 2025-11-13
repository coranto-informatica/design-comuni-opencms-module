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

java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("d/MM/yyyy", java.util.Locale.ITALIAN);
String lastModifiedFormatted = fmt.format(new java.util.Date(lastModified));
request.setAttribute("lastModifiedFormatted", lastModifiedFormatted);
%>

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div>
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
					<c:set var="postalCode">${result.fields['PostalCode_it']}</c:set>
				</c:forEach>
			</c:forEach>

			<div class="container" id="main-container">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10">
						<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/breadcrumb.jsp:336c29b7-45e1-11f0-ae97-1b1fd91899eb)"%>	
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10">
						<div class="cmp-heading pb-3 pb-lg-4">
							<div class="row">
								<div class="col-lg-8">
									<h1 ${rdfa.Title} class="title-xxxlarge" data-element="service-title">${value.Title}</h1>
									<ul class="d-flex flex-wrap gap-1 my-3">
										<c:if test="${value.ServiceState eq 'true'}">
											<li>
												<div class="chip chip-simple chip-success text-button" data-element="service-status">
													<span class="chip-label">Servizio attivo</span>
												</div>
											</li>
										</c:if>
										<c:if test="${value.ServiceState eq 'false'}">
											<li>
												<div class="chip chip-simple chip-danger text-button" data-element="service-status">
													<span class="chip-label">Servizio non attivo</span>
												</div>
											</li>
										</c:if>
									</ul>
									<c:if test="${value.ServiceState eq 'false'}">
										<p ${rdfa.ServiceStateMotivation} data-audio>${value.ServiceStateMotivation}</p>
									</c:if>
									<p  ${rdfa.Abstract}class="subtitle-small mb-3" data-element="service-description">${value.Abstract}</p>
									<c:if test="${not empty value.SubmitRequestOnline.value.RequestLink.value.Link}">
										<button type="button" class="btn btn-primary fw-bold" onclick="window.open('${value.SubmitRequestOnline.value.RequestLink.value.Link}', '${value.SubmitRequestOnline.value.RequestLink.value.LinkTarget}');" data-focus-mouse="false">
											<span>${value.SubmitRequestOnline.value.RequestLink.value.LinkTitle}</span>
										</button>
									</c:if>
								</div>
								<div class="col-lg-3 offset-lg-1 mt-5 mt-lg-0">
									<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/share.jsp:07bfaba1-45ee-11f0-ae97-1b1fd91899eb)"%>				
									<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/actions.jsp:3b89677b-4694-11f0-ae97-1b1fd91899eb)"%>			
								</div>
							</div>
						</div>
					</div>
					<hr class="d-none d-lg-block mt-2">
				</div>
			</div>
			<div class="container">
				<div class="row row-column-menu-left mt-4 mt-lg-80 pb-lg-80 pb-40">
					<div class="col-12 col-lg-3 mb-4 border-col">
						<div class="cmp-navscroll sticky-top" aria-labelledby="accordion-title-one">
							<nav class="navbar it-navscroll-wrapper navbar-expand-lg" aria-label="Indice della pagina" data-bs-navscroll="">
								<div class="navbar-custom" id="navbarNavProgress">
									<div class="menu-wrapper">
										<div class="link-list-wrapper">
											<div class="accordion">
												<div class="accordion-item">
													<span class="accordion-header" id="accordion-title-one">
														<button class="accordion-button pb-10 px-3 text-uppercase" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-one" aria-expanded="true" aria-controls="collapse-one">
															<fmt:message key="label.index"/>
															<svg class="icon icon-xs right">
																<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-expand</cms:link>"></use>
															</svg>
														</button>
													</span>
													<div class="progress">
														<div class="progress-bar it-navscroll-progressbar" role="progressbar" aria-valuenow="90.60564349621473" aria-valuemin="0" aria-valuemax="100" style="width: 90.6056%;"></div>
													</div>
													<div id="collapse-one" class="accordion-collapse collapse show" role="region" aria-labelledby="accordion-title-one">
														<div class="accordion-body">
															<ul class="link-list" data-element="page-index">											
																<c:if test="${not empty value.WhoNeeds}">
																	<li class="nav-item">
																		<a class="nav-link" href="#who-needs" data-focus-mouse="false">
																			<span><fmt:message key="label.whoneeds"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Description}">
																	<li class="nav-item">
																		<a class="nav-link" href="#description" data-focus-mouse="false">
																			<span><fmt:message key="label.description"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.HowTo}">
																	<li class="nav-item">
																		<a class="nav-link" href="#how-to" data-focus-mouse="false">
																			<span><fmt:message key="label.howto"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Needed}">
																	<li class="nav-item">
																		<a class="nav-link" href="#needed" data-focus-mouse="false">
																			<span><fmt:message key="label.needed"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Obtain}">
																	<li class="nav-item">
																		<a class="nav-link" href="#obtain" data-focus-mouse="false">
																			<span><fmt:message key="label.obtain"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Deadline}">
																	<li class="nav-item">
																		<a class="nav-link" href="#deadlines" data-focus-mouse="false">
																			<span><fmt:message key="label.deadline"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Cost}">
																	<li class="nav-item">
																		<a class="nav-link" href="#costs" data-focus-mouse="false">
																			<span><fmt:message key="label.cost"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.SubmitRequest}">
																	<li class="nav-item">
																		<a class="nav-link" href="#submit-request" data-focus-mouse="false">
																			<span><fmt:message key="label.ùareport"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Condition}">
																	<li class="nav-item">
																		<a class="nav-link" href="#conditions" data-focus-mouse="false">
																			<span><fmt:message key="label.condition"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.Otherdoc}">
																	<li class="nav-item">
																		<a class="nav-link" href="#documents" data-focus-mouse="false">
																			<span><fmt:message key="label.documents"/></span>
																		</a>
																	</li>
																</c:if>
																<c:if test="${not empty value.ContactPoint or not empty value.OrganizationUnitParent}">
																	<li class="nav-item">
																		<a class="nav-link" href="#contacts" data-focus-mouse="false">
																			<span><fmt:message key="label.contacts"/></span>
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
					</div>
					<div class="col-12 col-lg-8 offset-lg-1">
						<div class="it-page-sections-container">
							<c:if test="${not empty value.WhoNeeds}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="who-needs"><fmt:message key="label.whoneeds"/></h2>
									<div ${rdfa.WhoNeeds} class="richtext-wrapper lora" data-element="service-addressed">
										${value.WhoNeeds}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.Description}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="description"><fmt:message key="label.description"/></h2>
									<div ${rdfa.Description} class="richtext-wrapper lora" data-element="service-extended-description">
										${value.Description}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.HowTo}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="how-to"><fmt:message key="label.howto"/></h2>
									<div ${rdfa.HowTo} class="richtext-wrapper lora" data-element="service-how-to">
										${value.HowTo}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.Needed}">
								<section class="it-page-section mb-30 has-bg-grey p-3">
									<h2 class="title-xxlarge mb-3" id="needed"><fmt:message key="label.needed"/></h2>
									<div ${rdfa.Needed} class="richtext-wrapper lora" data-element="service-needed">
										${value.Needed}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.Obtain}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="obtain"><fmt:message key="label.obtain"/></h2>
									<div ${rdfa.Obtain} class="richtext-wrapper lora" data-element="service-achieved">
										${value.Obtain}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.Deadline}">
								<section class="it-page-section mb-30">
									<div class="cmp-timeline">
										<h2 class="title-xxlarge mb-3" id="deadlines"><fmt:message key="label.deadline"/></h2>
										<div ${rdfa.Deadline} class="richtext-wrapper lora" data-element="service-calendar-text">
											${value.Deadline}
										</div>
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.Cost}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="costs"><fmt:message key="label.cost"/></h2>
									<div ${rdfa.Cost} class="richtext-wrapper lora" data-element="service-cost">
										${value.Cost}
									</div>
								</section>
							</c:if>
							<c:if test="${not empty value.SubmitRequestOnline}">
								<section class="it-page-section mb-30 has-bg-grey p-4">
									<h2 class="mb-3" id="submit-request"><fmt:message key="label.makeareport"/></h2>
									<c:if test="${not empty value.SubmitRequestOnline}">
										<p ${value.SubmitRequestOnline.rdfa.Information} class="text-paragraph lora mb-4" data-element="service-generic-access">${value.SubmitRequestOnline.value.Information}</p>
										<button type="button" class="btn btn-primary mobile-full" onclick="window.open('${value.SubmitRequestOnline.value.RequestLink.value.Link}', '${value.SubmitRequestOnline.value.RequestLink.value.LinkTarget}');" data-element="service-online-access" data-focus-mouse="false">
											<span>${value.SubmitRequestOnline.value.RequestLink.value.LinkTitle}</span>
										</button>
									</c:if>						
									<c:if test="${not empty value.SubmitRequest.value.OfficeRequest.value.AppointmentLink}">
										<p ${value.SubmitRequest.value.OfficeRequest.rdfa.Information} class="text-paragraph lora mb-4" data-element="service-generic-access">${value.SubmitRequest.value.OfficeRequest.value.Information}</p>
										<button type="button" class="btn btn-outline-primary t-primary bg-white mobile-full" onclick="window.open('${value.SubmitRequest.value.OfficeRequest.value.AppointmentLink.value.Link}', '${value.SubmitRequest.value.OfficeRequest.value.AppointmentLink.value.LinkTarget}');" data-element="service-booking-access" data-focus-mouse="false">
											<span>${value.SubmitRequest.value.OfficeRequest.value.AppointmentLink.value.LinkTitle}</span>
										</button>
									</c:if>
								</section>
							</c:if>
							<c:if test="${not empty value.Condition}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="conditions"><fmt:message key="label.condition"/></h2>
									<div class="richtext-wrapper lora"><fmt:message key="label.termsofserviceinfo"/></div>
									<c:forEach var="attachmentWrapper" items="${content.valueList.Condition}">
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
										<div class="cmp-icon-link">
											<a class="list-item icon-left d-inline-block" href="${attachmentHref}" aria-label="Scarica ${attachmentLabel}" data-element="service-file" download>
												<span class="list-item-title-icon-wrapper">
													<svg class="icon icon-primary icon-sm me-1" aria-hidden="true">
														<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-clip</cms:link>"></use>
													</svg>
													<span class="list-item t-primary">${attachmentLabel}</span>
												</span>
											</a>
										</div>
									</c:forEach>
								</section>
							</c:if>
							<c:if test="${not empty value.Otherdoc}">
								<section class="it-page-section mb-30">
									<h2 class="title-xxlarge mb-3" id="conditions"><fmt:message key="label.documents"/></h2>
									<c:forEach var="attachmentWrapper" items="${content.valueList.Otherdoc}">
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
										<div class="cmp-icon-link">
											<a class="list-item icon-left d-inline-block" href="${attachmentHref}" aria-label="Scarica ${attachmentLabel}" data-element="service-file" download>
												<span class="list-item-title-icon-wrapper">
													<svg class="icon icon-primary icon-sm me-1" aria-hidden="true">
														<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-clip</cms:link>"></use>
													</svg>
													<span class="list-item t-primary">${attachmentLabel}</span>
												</span>
											</a>
										</div>
									</c:forEach>
								</section>
							</c:if>
							<section class="it-page-section">
								<c:if test="${not empty value.ContactPoint or not empty value.OrganizationUnitParent}">
									<h2 class="mb-3" id="contacts"><fmt:message key="label.contacts" /></h2>
									<div class="row">

										<div class="col-12 col-md-8 col-lg-6 mb-30">
											<div class="card-wrapper rounded h-auto mt-10">
												<div class="card card-teaser card-teaser-info rounded shadow-sm p-3">
													<div class="card-body pe-3">
														<p class="card-title text-paragraph-regular-medium-semi mb-3">
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
															<a class="text-decoration-none" href="<cms:link detailPage='${basePath}'>${organizationFilename}</cms:link>" data-element="service-area">${name}</a>
														</p>
														<c:if test="${not empty value.ContactPoint}">
															<div class="card-text">
																<p class="u-main-black">${address}</p>
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
																		<p class="u-main-black">												
																			<c:if test="${not empty phonenumber}">
																				Telefono: ${phonenumber}
																			</c:if>
																			<c:if test="${not empty email}">
																				Email: <a href="<cms:link>mailto:${email}</cms:link>" aria-label="Invia una Email a ${email}" title="Invia una Email a ${email}" target="_blank" data-focus-mouse="false">${email}</a>
																			</c:if>
																			<c:if test="${not empty fax}">
																				Fax: ${fax}
																			</c:if>
																			<c:if test="${not empty pec}">
																				PEC: <a href="<cms:link>mailto:${pec}</cms:link>" aria-label="Invia una PEC a ${pec}" title="Invia una PEC a ${pec}" target="_blank" data-focus-mouse="false">${pec}</a>
																			</c:if>
																			<c:if test="${not empty accountType and not empty link}">
																				<c:choose>
																					<c:when test="${accountType eq 'whatsapp'}">
																						<a href="${link}" aria-label="Invia un messaggio su WhatsApp" title="Invia un messaggio su WhatsApp" target="_blank" data-focus-mouse="false">WhatsApp</a>
																					</c:when>
																					<c:when test="${accountType eq 'telegram'}">
																						<a href="${link}" aria-label="Invia un messaggio su Telegram" title="Invia un messaggio su Telegram" target="_blank" data-focus-mouse="false">Telegram</a>
																					</c:when>
																					<c:when test="${accountType eq 'skype'}">
																						<a href="${link}" aria-label="Avvia una conversazione su Skype" title="Avvia una conversazione su Skype" target="_blank" data-focus-mouse="false">Skype</a>
																					</c:when>
																					<c:when test="${accountType eq 'linkedin'}">
																						<a href="${link}" aria-label="Visita il profilo LinkedIn" title="Visita il profilo LinkedIn" target="_blank" data-focus-mouse="false">Linkedin</a>
																					</c:when>
																					<c:when test="${accountType eq 'twitter'}">
																						<a href="${link}" aria-label="Visita il profilo Twitter" title="Visita il profilo Twitter" target="_blank" data-focus-mouse="false">Twitter</a>
																					</c:when>
																					<c:otherwise>
																						${accountType}:
																						<a href="${link}" aria-label="Vai a ${accountType}" title="Vai a ${accountType}" target="_blank" data-focus-mouse="false"> ${link}</a>
																					</c:otherwise>
																				</c:choose>
																			</c:if>
																			<c:if test="${not empty url}">
																				Sito web: <a href="${url}" aria-label="Vai alla pagina: ${fn:escapeXml(url)}" title="Vai alla pagina: ${fn:escapeXml(Url)}" target="_blank" data-focus-mouse="false">${url}</a>
																			</c:if>	
																		</p>
																	</c:forEach>															
																</c:forEach>	
															</div>			
														</c:if>
													</div>
												</div>
											</div>
										</div>									
									</div>
								</c:if>
								<div class="col-12 mb-30">
									<span class="text-paragraph-small"><fmt:message key="label.arguments" />:</span>
									<c:set var="argumentFolderPath">/argomenti/argomento/</c:set>
									<ul class="d-flex flex-wrap gap-2 mt-10 mb-30">
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
												<a href="<cms:link detailPage='${argumentFolderPath}'>${argumentPath}</cms:link>" class="chip chip-simple" data-element="service-topic">
													<span class="chip-label">${argument}</span>
												</a>
											</li>
										</c:forEach>
									</ul>
									<p class="text-paragraph-small mb-0"><fmt:message key="label.lastupdateservice" />&nbsp;${lastModifiedFormatted}</p>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>