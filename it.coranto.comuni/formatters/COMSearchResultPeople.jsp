<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">


	<div class="col-md-6 col-xl-4">
		<div class="card-wrapper border border-light rounded shadow-sm pb-0">
			<div class="card no-after rounded">
				<div class="card-body">
					<div class="category-top">
					</div>
					<c:choose>
						<c:when test="${value.Assignment.value.Type eq 'politico'}">
							<c:set var="basePath" value="/amministrazione/politici/politico/" />
						</c:when>
						<c:otherwise>
							<c:set var="basePath" value="/amministrazione/personale-amministrativo/personale-amministrativo/" />
						</c:otherwise>
					</c:choose>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" class="text-decoration-none" data-element="news-category-link">
						<h3 class="card-title">${value.Fullname}</h3>
					</a>
					<p class="card-text text-secondary">${value.Assignment.value.Title}</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>