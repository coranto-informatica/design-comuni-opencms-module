<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<div>
		<c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
		<a href="<cms:link>${link.value.Link}</cms:link>"
		   aria-label="Vai alla pagina: ${link.value.LinkTitle}"
		   title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}"
		   target="${link.value.LinkTarget}"
		   data-focus-mouse="false">${link.value.LinkTitle}</a>
		</c:forEach>
	</div>
</cms:formatter>