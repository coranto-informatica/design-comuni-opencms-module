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

				<div class="container" id="main-container">
					<div class="row">
						<div class="col-12 col-lg-10 offset-lg-1">
							<div class="cmp-breadcrumbs" role="navigation">
								<nav class="breadcrumb-container" aria-label="breadcrumb">
									<ol class="breadcrumb p-0" data-element="breadcrumb">
										<li class="breadcrumb-item"><a href="homepage.html">Home</a><span class="separator">/</span></li>
										<li class="breadcrumb-item active" aria-current="page">Accedi</li>
									</ol>
								</nav>
							</div>       
							<div class="cmp-heading pb-3 pb-lg-4">
							<h1 class="title-xxxlarge">Accedi</h1>
							<p class="subtitle-small">Per accedere al sito e ai suoi servizi, utilizza una delle seguenti modalità.</p>
							</div>
						</div>
					</div>
					<hr class="d-none d-lg-block mt-0 mb-4">
					<div class="row">
						<div class="col-12 col-lg-8 offset-lg-2">
							<div class="cmp-text-button mt-3">
								<h2 class="title-xxlarge mb-0">SPID</h2>
								<div class="text-wrapper">
									<p class="subtitle-small mb-3">Accedi con SPID, il sistema Pubblico di Identità Digitale.</p>
								</div>
								<div class="button-wrapper mb-2">
									<button type="button" class="btn btn-icon btn-re square" data-focus-mouse="false">
										<img src="<cms:link>../assets/images/spid.svg</cms:link>" alt="Entra con SPID" class="me-2">
										<span class="">Entra con SPID</span>
									</button>
								</div>
								<a class="simple-link" href="https://www.spid.gov.it/" target="_blank">Come attivare SPID <span class="visually-hidden">Come attivare SPID</span></a>
							</div>
							<div class="cmp-text-button">
								<h2 class="title-xxlarge mb-0">CIE</h2>
								<div class="text-wrapper">
									<p class="subtitle-small mb-3">Accedi con la tua Carta d’Identità Elettronica.</p>
								</div>
								<div class="button-wrapper mb-2">
									<button type="button" class="btn btn-icon btn-re square">
										<img src="<cms:link>../assets/images/cie.svg</cms:link>" alt="Entra con CIE" class="me-2">
										<span class="">Entra con CIE</span>
									</button>
								</div>
								<a class="simple-link" href="https://www.cartaidentita.interno.gov.it/richiedi/" target="_blank">Come richiedere CIE <span class="visually-hidden">Come richiedere CIE</span></a>
							</div>
						</div>
					</div>
				</div>

				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/useful-link.jsp:2cc4c5ae-5280-11f0-880d-1b1fd91899eb)" %>
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/search.jsp:f5ae36a5-3246-11f0-82b8-1b1fd91899eb)" %>
			</main>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/footer.jsp:b200b7f4-3163-11f0-8968-93edeab2e96e)" %>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/javascript.jsp:0f7c935f-70f7-11ef-b55f-93edeab2e96e)" %>

		</body>
	</cms:bundle>
</html>
