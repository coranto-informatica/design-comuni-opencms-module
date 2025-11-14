<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">

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
							<div class="it-hero-text-wrapper pt-0 ps-0 pb-4 pb-lg-60">
								<h1 class="text-black" data-element="page-name">${value.Title}</h1>
								<div class="hero-text">
									<p ${rdfa.Abstract}>${value.Abstract}</p>
								</div>
							</div>
						</section>
					</div>       
				</div>
			</div>
		</div>
		<section class="hero-img mb-20 mb-lg-50">
			<section class="it-hero-wrapper it-hero-small-size cmp-hero-img-small">
				<div class="img-responsive-wrapper">
					<div class="img-responsive">
						<div class="img-wrapper">
							<img src="<cms:link>${value.Image.value.Image}</cms:link>" alt="{fn:escapeXml(value.Image.value.Description)}" title="{fn:escapeXml(value.Image.value.Title)}">
						</div>
					</div>
				</div>
			</section>
			<c:if test="${not empty value.Image.value.Caption}">
				<p ${value.Image.rdfa.Caption} class="title-xsmall cmp-hero-img-small__description">${value.Image.value.Caption}</p>
			</c:if>
		</section>
		<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/eventshighlighted.jsp:843e3047-5027-11f0-ae97-1b1fd91899eb)"%>
	</div>

</cms:formatter>