<%@ page pageEncoding="UTF-8" buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ page import="org.opencms.file.*, 
	org.opencms.jsp.CmsJspLoginBean, 
org.opencms.jsp.util.CmsJspStandardContextBean, 
org.apache.logging.log4j.*" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="it">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<head>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/head.jsp:a5027e3f-3164-11f0-8968-93edeab2e96e)" %>
		</head>

		<body>

			<c:if test="${cms.isEditMode}">
				<div style="margin-top: 52px"></div>
			</c:if>

			<div class="skiplink">
				<a class="visually-hidden-focusable" href="#main-container">Vai ai contenuti</a>
				<a class="visually-hidden-focusable" href="#footer">Vai al footer</a>
			</div>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/header.jsp:3aa3d439-315d-11f0-8968-93edeab2e96e)" %>

			<main>
				<%
	CmsJspStandardContextBean contextBean = CmsJspStandardContextBean.getInstance(request);
if (contextBean.isDetailRequest()) {
	%>
				<cms:container name="detail" type="detail" detailview="true" maxElements="1" />
				<%
	} else {
	%>
				<cms:container name="topcard" type="topcard" maxElements="1" />
				<cms:container name="plaintext" type="plaintext" maxElements="1" />
				<cms:container name="search" type="search" maxElements="1" />
				<cms:container name="explore" type="explore" maxElements="1" />
				<%
	}
%>

				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/prefooter.jsp:31bcb45f-36e0-11f0-82b8-1b1fd91899eb)" %>
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/search.jsp:f5ae36a5-3246-11f0-82b8-1b1fd91899eb)" %>
			</main>

			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/footer.jsp:b200b7f4-3163-11f0-8968-93edeab2e96e)" %>
			<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/javascript.jsp:0f7c935f-70f7-11ef-b55f-93edeab2e96e)" %>

		</body>
	</cms:bundle>
</html>
