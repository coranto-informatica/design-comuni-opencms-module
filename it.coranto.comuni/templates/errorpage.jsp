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



			<div class="skiplink">
				<a class="visually-hidden-focusable" href="#main-container">Vai ai contenuti</a>
				<a class="visually-hidden-focusable" href="#footer">Vai al footer</a>
			</div>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/header.jsp:3aa3d439-315d-11f0-8968-93edeab2e96e)" %>

			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-12 col-lg-10">

							<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/breadcrumb.jsp:336c29b7-45e1-11f0-ae97-1b1fd91899eb)"%>	  

							<div class="cmp-hero">
								<section class="it-hero-wrapper bg-white align-items-start">
									<div class="it-hero-text-wrapper pt-0 ps-0 pb-4 pb-lg-60">

										<!-- Titolo 404 -->
										<h1 class="text-black title-xxxlarge mb-2">404</h1>

										<!-- Sottotitolo -->
										<h2>Pagina non trovata</h2>

										<!-- Testo paragrafo -->
										<p class="text-black titillium text-paragraph">
											Oops! La pagina che cerchi non è stata trovata,<br>
											<a href="javascript:history.back();" title="Torna alla pagina precedente">torna indietro</a>
											o utilizza il menu per continuare la navigazione.
										</p>

									</div>
								</section>
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
