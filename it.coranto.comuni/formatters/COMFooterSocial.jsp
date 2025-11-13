<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">
		<div>
			<h3 class="footer-heading-title"><fmt:message key="label.followus"/></h3>
			<ul class="list-inline text-start social">
				<c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
					<li class="list-inline-item">
						<a class="p-1 text-white" href="${link.value.Link}" aria-label="${link.value.LinkTitle}" target="${link.value.LinkTarget}" data-focus-mouse="false">
							<svg class="icon icon-sm icon-white align-top">
								<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-${fn:toLowerCase(link.value.LinkTitle)}</cms:link>"></use>
							</svg>
							<span class="visually-hidden">${link.value.LinkTitle}</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</cms:bundle>
</cms:formatter>
