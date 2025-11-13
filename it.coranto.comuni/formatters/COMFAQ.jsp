<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">
		<%
	Integer index = (Integer) request.getAttribute("index");
%>

		<div class="accordion-item">
			<div class="accordion-header" id="heading<%= index %>">
				<button class="accordion-button title-snall-semi-bold py-3 collapsed"
						type="button"
						data-bs-toggle="collapse"
						data-bs-target="#collapse<%= index %>"
						aria-expanded="false"
						aria-controls="collapse<%= index %>"
						data-focus-mouse="false">
					<div class="button-wrapper">
						${value.Question}
						<div class="icon-wrapper">
							<svg class="icon icon-xs me-1 icon-primary">
								<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#</cms:link>"></use>
							</svg>
						</div>
					</div>
				</button>
			</div>
			<div id="collapse<%= index %>" class="accordion-collapse p-0 collapse"
				 data-bs-parent="#accordion-faq" role="region"
				 aria-labelledby="heading<%= index %>">
				<div class="accordion-body">
					<p class="mb-3">${value.Answer}</p>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>