<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">
		<div>

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
						<div class="cmp-hero">
							<section class="it-hero-wrapper bg-white align-items-start">
								<div class="it-hero-text-wrapper pt-0 ps-0">
									<h1 class="text-black hero-title" data-element="page-name">${value.Title}</h1>
								</div>
							</section>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10">
						<div class="it-hero-text-wrapper pt-0 ps-0">
							<h3 class="fw-bold mb-3"><fmt:message key="label.designandplanning"/></h3>
						</div>
					</div>
				</div>
				<div class="row justify-content-center mb-4">
					<div class="col-12 col-lg-10">
						<div class="it-hero-text-wrapper pt-0 ps-0">
							<h4 class="fw-normal me-3 d-inline"><fmt:message key="label.by"/></h4>
							<img src="<cms:link>/system/modules/it.coranto.comuni/resources/images/LogoCoranto.jpg</cms:link>" class="img-fluid" alt="Coranto informatica">
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10">
						<div class="it-hero-text-wrapper pt-0 ps-0">
							<h3 class="fw-bold mb-3"><fmt:message key="label.developing"/></h3>
						</div>
					</div>
				</div>
				<div class="row justify-content-center mb-4">
					<div class="col-12 col-lg-10">
						<div class="it-hero-text-wrapper pt-0 ps-0">
							<h4 class="fw-normal me-3 d-inline"><fmt:message key="label.developedwith"/></h4>
							<img src="<cms:link>/system/modules/it.coranto.comuni/resources/images/opencms.svg</cms:link>" class="img-fluid" alt="OpenCMS" width="200px">
						</div>
					</div>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>