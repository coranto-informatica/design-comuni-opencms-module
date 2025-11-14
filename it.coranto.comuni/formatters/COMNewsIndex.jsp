<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="col-md-6 col-xl-4">
		<div class="card-wrapper border border-light rounded shadow-sm">
			<div class="card no-after rounded">
				<c:if test="${not empty value.Image.value.Image}">
					<div class="img-responsive-wrapper">
						<div class="img-responsive img-responsive-panoramic">
							<figure class="img-wrapper">
								<img class="" src="<cms:link>${value.Image.value.Image}</cms:link>" title="${fn:escapeXml(value.Title)}" alt="${fn:escapeXml(value.Image.value.Description)}">
							</figure>
						</div>
					</div>
				</c:if>
				<div class="card-body">
					<div class="category-top">
						<c:set var="type" value="${value.Type}" />
						<c:set var="basePath" value="" />
						<c:choose>
							<c:when test="${type eq 'notizia'}">
								<a class="category text-decoration-none" href="<cms:link>/novita/notizie/</cms:link>">NOTIZIE</a>
								<c:set var="basePath" value="/novita/notizie/notizia/" />
							</c:when>
							<c:when test="${type eq 'avviso'}">
								<a class="category text-decoration-none" href="<cms:link>/novita/avvisi/</cms:link>">AVVISI</a>
								<c:set var="basePath" value="/novita/avvisi/avviso/" />
							</c:when>
							<c:when test="${type eq 'comunicato'}">
								<a class="category text-decoration-none" href="<cms:link>/novita/comunicati/</cms:link>">COMUNICATI</a>
								<c:set var="basePath" value="/novita/comunicati/comunicato/" />
							</c:when>
							<c:otherwise>Tipo sconosciuto (${value.Type})</c:otherwise>
						</c:choose>
						<span class="data">
							<c:set var="formattedDate">
								<fmt:formatDate 
												value="${cms:convertDate(value.Date)}" 
												pattern="dd MMM yyyy" />
							</c:set>
							${fn:toUpperCase(formattedDate)}
						</span>
					</div>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" title="${fn:escapeXml(value.Title)}" class="text-decoration-none" data-element="news-category-link">
						<h3 class="card-title">${value.Title}</h3>
					</a>
					<p class="card-text text-secondary">${value.Abstract}</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>