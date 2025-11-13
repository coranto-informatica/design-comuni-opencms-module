<%@page
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"
	buffer="none"
	%>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="it" />
<cms:bundle basename="it.coranto.comuni.messages">
	<div>
		<div class="bg-grey-card py-5">
			<div class="container">
				<h2 class="title-xxlarge mb-4"><fmt:message key="label.eventshighlighted"/></h2>
				<div class="row g-4">		
					<div class="mt-4"><fmt:message key="label.noevents"/></div>
				</div>
			</div>
		</div>
		<div class="bg-grey-card py-5">
			<div class="container">
				<h2 class="title-xxlarge mb-4"><fmt:message key="label.placeshighlighted"/></h2>
				<cms:container tagClass="row g-4" name="highlightedelements" type="highlightedelements" maxElements="6"/>
				<div class="d-flex justify-content-end mt-4">
					<a href="/eventi/luoghi/" class="btn btn-outline-primary full-mb" aria-label="aria-label" data-element="live-button-locations" data-focus-mouse="false">
						Tutti i luoghi 
						<svg class="icon icon-primary icon-xs ml-10">
							<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-right</cms:link>"></use>
						</svg>
					</a>
				</div>
			</div>
		</div>
	</div>

</cms:bundle>