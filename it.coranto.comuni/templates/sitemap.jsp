<%@ page pageEncoding="UTF-8" buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ page import="org.opencms.file.*, 
	org.opencms.jsp.CmsJspLoginBean, 
org.opencms.jsp.util.CmsJspStandardContextBean, 
org.apache.logging.log4j.*" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="it">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<head>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/head.jsp:a5027e3f-3164-11f0-8968-93edeab2e96e)" %>
		</head>

		<body>

			<c:if test="${cms.isEditMode}">
				<div style="margin-top: 52px"></div>
			</c:if>

			<div class="skiplink">
				<a class="visually-hidden-focusable" href="#main-container">Vai ai contenuti</a>
				<a class="visually-hidden-focusable" href="#footer">Vai al footer</a>
			</div>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/header.jsp:3aa3d439-315d-11f0-8968-93edeab2e96e)" %>

			<main>
				<div class="container my-4">
					<div class="row">
						<div class="col-12">
							<h1><fmt:message key="label.sitemap"/></h1>
							<div class="link-list-wrapper">
								<cms:navigation type="forFolder" resource="/" startLevel="0" endLevel="0" var="nav"/>
								<ul class="link-sublist">	
									<li>
										<a class="list-item large medium" href="<cms:link>/</cms:link>" title= "Vai alla pagina: Homepage"><span class="list-item-title">Homepage</span></a>
										<ul class="link-sublist">
											<li>
												<a class="list-item" href="<cms:link>/informativa-privacy/</cms:link>" data-focus-mouse="false"><span>Informativa privacy</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/note-legali/</cms:link>" data-focus-mouse="false"><span>Note legali</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/domande-frequenti/</cms:link>" data-focus-mouse="false"><span>Domande frequenti (FAQ)</span></a>
											</li>
											<li>				
												<a class="list-item" href="<cms:link>/assistenza/</cms:link>" data-focus-mouse="false"><span>Richiesta di assistenza</span></a>		
											</li>
											<li>
												<a class="list-item" href="<cms:link>/appuntamento/</cms:link>" data-focus-mouse="false"><span>Prenotazione appuntamento</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/servizi/segnalazione-dettaglio/Segnalazione-disservizio/</cms:link>" data-focus-mouse="false"><span>Segnalazione disservizio</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/crediti/</cms:link>" data-focus-mouse="false"><span>Credits</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/fatturazione-elettronica/</cms:link>" data-focus-mouse="false"><span>Fatturazione elettronica</span></a>
											</li>
											<li>
												<a class="list-item" href="<cms:link>/mappa-sito/</cms:link>" data-focus-mouse="false"><span>Mappa del sito</span></a>
											</li>
										</ul>
									</li>
									<c:forEach items="${nav.items}" var="elem" varStatus="status">										
										<li>
											<a class="list-item large medium" href="<cms:link>${elem.resourceName}</cms:link>" title= "Vai alla pagina: ${elem.navText}"><span class="list-item-title">${elem.navText}</span></a>
											<cms:navigation type="forFolder" resource="${elem.resourceName}" startLevel="1" endLevel="1" var="subNav"/>
											<c:if test="${not empty subNav.items}">
												<ul class="link-sublist">
													<c:forEach items="${subNav.items}" var="subItem">
														<li>
															<a class="list-item" href="<cms:link>${subItem.resourceName}</cms:link>" data-focus-mouse="false"><span class="fw-semibold">/ ${subItem.title}</span></a>
															<cms:navigation type="forFolder" resource="${subItem.resourceName}" startLevel="2" endLevel="2" var="subSubNav"/>
															<c:if test="${not empty subSubNav.items}">
																<ul class="link-sublist">
																	<c:forEach items="${subSubNav.items}" var="subSubItem">
																		<li>
																			<a class="list-item" href="<cms:link>${subSubItem.resourceName}</cms:link>"><span>${subSubItem.title}</span></a>
																		</li>
																	</c:forEach>															
																</ul>
															</c:if>
														</li>
													</c:forEach>
												</ul>
											</c:if>
										</li>
									</c:forEach>
									<li>
										<a class="list-item large medium" href="<cms:link>/argomenti/</cms:link>" title= "Vai alla pagina: Homepage"><span class="list-item-title">Argomenti</span></a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/search.jsp:f5ae36a5-3246-11f0-82b8-1b1fd91899eb)" %>
			</main>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/footer.jsp:b200b7f4-3163-11f0-8968-93edeab2e96e)" %>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/javascript.jsp:0f7c935f-70f7-11ef-b55f-93edeab2e96e)" %>

		</body>
	</cms:bundle>
</html>
