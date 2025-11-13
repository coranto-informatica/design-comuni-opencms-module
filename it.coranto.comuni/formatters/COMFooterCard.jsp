<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<a href="<cms:link>${value.Link.value.Link}</cms:link>" data-focus-mouse="false">
		<svg class="icon" aria-hidden="true">
			<image xlink:href="<cms:link>${value.Image.value.Image}</cms:link>" height="100%" width="48px"></image>
		</svg>
		<div class="it-brand-text">
			<h2 class="no_toc">${value.Title}</h2>
		</div>
	</a>

</cms:formatter>