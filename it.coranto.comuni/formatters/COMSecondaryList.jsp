<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<ul class="navbar-nav navbar-secondary">
		<c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
			<li class="nav-item">
				<a class="nav-link" href="<cms:link>${link.value.Link}</cms:link>" title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}" target="${link.value.LinkTarget}" data-focus-mouse="false">${link.value.LinkTitle}</a>
			</li>
		</c:forEach>
	</ul>

</cms:formatter>