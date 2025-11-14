<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">
			<span><fmt:message key="label.followus"/></span>
			<ul>
				<c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
					<li>
						<a href="${link.value.Link}" aria-label="${link.value.LinkTitle}" target="${link.value.LinkTarget}" data-focus-mouse="false">
							<svg class="icon icon-sm icon-white align-top">
								<use xlink:href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-${fn:toLowerCase(link.value.LinkTitle)}</cms:link>"></use>
							</svg>
							<span class="visually-hidden">${link.value.LinkTitle}</span>
						</a>
					</li>
				</c:forEach>
			</ul>
	</cms:bundle>
</cms:formatter>
