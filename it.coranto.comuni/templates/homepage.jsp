<%@page
	pageEncoding="UTF-8"
	buffer="none"
	session="false"
	trimDirectiveWhitespaces="true"%>

<%@page import="org.opencms.file.*, 
	org.opencms.jsp.CmsJspLoginBean, 
org.apache.logging.log4j.*"
	%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="it">

	

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<head>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/head.jsp:a5027e3f-3164-11f0-8968-93edeab2e96e)"%>
		</head>
		<body>
			<c:if test="${cms.isEditMode}">
				<div style="margin-top: 60px">
				</div>
			</c:if>
	
		<div class="skiplink">
					<a class="visually-hidden-focusable" href="#main-container">Vai ai contenuti</a>
					<a class="visually-hidden-focusable" href="#footer">Vai al
						footer</a>

				</div><!-- /skiplink -->
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/header.jsp:3aa3d439-315d-11f0-8968-93edeab2e96e)"%>		
					<cms:container name="area" type="area" maxElements="1"/>
				<main>
					<h1 class="visually-hidden" id="main-container"><fmt:message key="label.townname"/></h1>
					<section id="head-section">
						<h2 class="visually-hidden">Contenuti in evidenza</h2>
	

							<cms:container name="newsmainhome" type="newsmainhome" maxElements="1"/>


					</section>
					<section id="calendario">

						<div class="section section-muted pb-90 pb-lg-50 px-lg-5 pt-0">
							<div class="container">

								<cms:container name="newslist" type="newslist" maxElements="1"/>

								<!-- EVENTI -->

								<div class="row row-title pt-5 pt-lg-60 pb-3">
									<div class="col-12 d-lg-flex justify-content-between">
										<h2 class="mb-lg-0"><fmt:message key="label.events"/></h2>
									</div>
								</div>
								<div class="row row-calendar">
									<div class="it-carousel-wrapper it-carousel-landscape-abstract-four-cols it-calendar-wrapper">
										<div class="it-header-block">
											<div class="it-header-block-title">

												<%
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMMM yyyy", new java.util.Locale("it", "IT"));
	String formattedDate = sdf.format(new java.util.Date());

	String capitalizedDate = formattedDate.substring(0, 1).toUpperCase() + formattedDate.substring(1);

	request.setAttribute("capitalizedDate", capitalizedDate);
	%>

												<p class="mb-0 text-center home-carousel-title"><b>${capitalizedDate}</b></p>
											</div>
										</div>
									</div>
									<div class="mt-4"><fmt:message key="label.noevents"/></div>
								</div>

								<!-- EVENTI -->

							</div>
						</div>
					</section>

					<section class="evidence-section">
						<div class="section py-5 pb-lg-80 px-lg-5 position-relative" style="background-image: url(<cms:link>../assets/images/evidenza-header.png)</cms:link>">
							<div class="container">
								<div class="row">
									<h2 class="text-white"><fmt:message key="label.hottopics"/></h2>
								</div>
								<div>

									<cms:container tagClass="card-wrapper card-teaser-wrapper card-teaser-wrapper-equal card-teaser-block-3" 
												   name="argumenthighlighted" type="argumenthighlighted" maxElements="3"/>

									<div class="row pt-30">
										<div class="col-lg-10 col-xl-6 offset-lg-1 offset-xl-2">
											<div class="row d-lg-inline-flex">
												<div class="col-lg-3">
													<h3 class="text-uppercase mb-3 title-xsmall-bold text text-secondary"><fmt:message key="label.othertopics"/></h3>
												</div>

												<cms:container tagClass="col-lg-9" name="argumentlist" type="argumentlist" maxElements="1"/>

											</div>
										</div>
										<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2 text-center">
											<a href="<cms:link>/argomenti/</cms:link>" class="btn btn-primary mt-40"><fmt:message key="label.showall"/></a>
										</div>
									</div>
									<div class="row pt-5">
										<h2><fmt:message key="label.thematicsites"/></h2>
									</div>
									<div class="pt-4 pt-lg-30">

										<cms:container tagClass="card-wrapper card-teaser-wrapper card-teaser-wrapper-equal card-teaser-block-3 pb-0" name="card" type="card"/>

									</div>
								</div>
							</div>
						</div>
					</section>

					<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/usefullinks.jsp:802a61e7-420b-11f0-ae97-1b1fd91899eb)"%>

					<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/prefooter.jsp:31bcb45f-36e0-11f0-82b8-1b1fd91899eb)"%>

					<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/search.jsp:f5ae36a5-3246-11f0-82b8-1b1fd91899eb)"%>

				</main>

				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/footer.jsp:b200b7f4-3163-11f0-8968-93edeab2e96e)"%>
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/javascript.jsp:0f7c935f-70f7-11ef-b55f-93edeab2e96e)"%>

			</body>
		</cms:bundle>
</html>
