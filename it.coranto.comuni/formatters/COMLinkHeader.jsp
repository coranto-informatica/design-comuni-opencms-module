<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<a class="d-lg-block navbar-brand" target="${value.LinkTarget}" href="<cms:link>${value.Link}</cms:link>"
	   aria-label="Vai al portale ${fn:escapeXml(value.LinkTitle)} - link esterno - apertura nuova scheda"
	   title="Vai al portale ${fn:escapeXml(value.LinkTitle)}">${value.LinkTitle}</a>	

	<div style="${containerStyle} margin-left:20px; margin-right:20px"><cms:container name="rightzone" type="rightzone" maxElements="1"/></div>		

</cms:formatter>