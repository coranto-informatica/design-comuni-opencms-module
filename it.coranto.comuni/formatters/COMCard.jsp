<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">
	<c:set var="color" value="${cms.element.settings.color}" />
	<c:set var="cardColor" value="card-bg-${color}" />

	<a href="${value.Link.value.Link}" target="${value.Link.value.LinkTarget}" class="card card-teaser ${cardColor} rounded mt-0 p-3" data-focus-mouse="false">
		<div class="avatar size-lg me-3">
			<img src="<cms:link>${value.Image.value.Image}</cms:link>" alt="${fn:escapeXml(value.Image.value.Description)}">
		</div>
		<div class="card-body">
			<h3 class="card-title text-white sito-tematico">${value.Title}</h3>
			<div class="card-text text-sans-serif text-white">${value.Abstract}</div>
		</div>
	</a>

</cms:formatter>