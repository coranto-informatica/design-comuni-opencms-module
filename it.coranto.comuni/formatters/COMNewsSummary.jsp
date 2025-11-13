<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${cms.isEditMode}">
	<c:set var="theEditStyle" value="style= 'flex: 0 0 28%;'" />
</c:if>

<cms:formatter var="content" val="value">
	<div class="card card-teaser card-teaser-image card-flex no-after rounded shadow-sm border border-light mb-0" ${theEditStyle}>
		<div class="card-image-wrapper with-read-more">
			<div class="card-body p-3 pb-5">
				<div class="category-top">
					<c:set var="type" value="${value.Type}" />
					<c:set var="basePath" value="" />
					<c:choose>
						<c:when test="${type eq 'notizia'}">
							<span class="title-xsmall-semi-bold fw-semibold">Notizie</span>
							<c:set var="basePath" value="/novita/notizie/notizia/" />
						</c:when>
						<c:when test="${type eq 'avviso'}">
							<span class="title-xsmall-semi-bold fw-semibold">Avvisi</span>
							<c:set var="basePath" value="/novita/avvisi/avviso/" />
						</c:when>
						<c:when test="${type eq 'avviso'}">
							<span class="title-xsmall-semi-bold fw-semibold">Comunicati stampa</span>
							<c:set var="basePath" value="/novita/comunicati/comunicato/" />
						</c:when>
						<c:otherwise>
							<c:otherwise>Tipo sconosciuto (${value.Type})</c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
				<h3 class="card-title text-paragraph-medium u-grey-light">${value.Title}</h3>
				<p class="text-paragraph-card u-grey-light m-0">${value.Abstract}</p>
			</div>
			<c:if test="${not empty value.Image}">
				<div class="card-image card-image-rounded pb-5 me-3">
					<figure class="img-wrapper">
						<img src="<cms:link>${value.Image.value.Image}</cms:link>" title="${fn:escapeXml(value.Title)}" alt="${fn:escapeXml(value.Image.value.Description)}" class="img-fluid">
					</figure>
				</div>
			</c:if>
		</div>
		<a class="read-more ps-3" href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" title="Vai alla pagina: ${fn:escapeXml(value.Title)}" data-focus-mouse="false">
			<span class="text">Vai alla pagina</span>
			<svg class="icon"><use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-right</cms:link>"></use></svg>
		</a>
	</div>
</cms:formatter>