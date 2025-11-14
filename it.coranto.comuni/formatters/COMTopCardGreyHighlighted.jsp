<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
<div>


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
									<p>${value.Abstract}</p>
								</div>
							</div>
						</section>
					</div>       
				</div>
			</div>
		</div>
	</div>
	<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/greyhighlighted.jsp:2a0ef09e-7683-11ef-b55f-93edeab2e96e)"%>
</div>
</cms:formatter>