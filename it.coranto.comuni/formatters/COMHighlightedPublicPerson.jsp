<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<div class="col-md-6 col-lg-4">
		<div class="cmp-card-simple card-wrapper pb-0 rounded border border-light">
			<div class="card shadow-sm rounded">
				<div class="card-body">
					<c:set var="type" value="${value.Assignment.value.Type}" />
					<c:set var="basePath" value="" />
					<c:set var="basePath" value="" />
					<c:choose>
						<c:when test="${type eq 'politico'}">
							<c:set var="basePath" value="/politici/persona" />
						</c:when>
						<c:when test="${type eq 'amministrativo'}">
							<c:set var="basePath" value="/personale-amministrativo/persona" />
						</c:when>
						<c:otherwise>
							<c:set var="basePath" value="/personale-amministrativo/persona" />
						</c:otherwise>
					</c:choose>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" class="text-decoration-none" data-element="management-category-link">
						<h3 ${value.Assignment.rdfa.Title} class="card-title t-primary">
							${value.Assignment.value.Title}
						</h3>
					</a>
					<p ${value.Assignment.rdfa.Abstract} class="text-secondary mb-0">
						${value.Assignment.value.Abstract}
					</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>