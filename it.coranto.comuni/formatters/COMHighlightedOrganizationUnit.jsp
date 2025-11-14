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
					<c:set var="type" value="${value.Type}" />
					<c:set var="basePath" value="" />
					<c:choose>
						<c:when test="${type eq 'area'}">
							<c:set var="basePath" value="/aree-amministrative/area" />
						</c:when>
						<c:when test="${type eq 'ufficio'}">
							<c:set var="basePath" value="/uffici/ufficio" />
						</c:when>
						<c:when test="${type eq 'giuntacomunale' || type eq 'consigliocomunale' || type eq 'commissione'}">
							<c:set var="basePath" value="/organi-di-governo/organo-di-governo" />
						</c:when>
						<c:when test="${type eq 'biblioteca' || type eq 'museo' || type eq 'aziendamunicipalizzata' ||
									  type eq 'ente' || type eq 'fondazione' || type eq 'centroculturale' || type eq 'scuola'}">
							<c:set var="basePath" value="/enti-e-fondazioni/ente-o-fondazione" />
						</c:when>
						<c:otherwise>
							<c:set var="basePath" value="/enti-e-fondazioni/ente-o-fondazione" />
						</c:otherwise>
					</c:choose>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" class="text-decoration-none" data-element="management-category-link">
						<h3 ${rdfa.Title} class="card-title t-primary">${value.Title}</h3>
					</a>
					<p ${rdfa.Competency} class="text-secondary mb-0">${value.Abstract}</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>