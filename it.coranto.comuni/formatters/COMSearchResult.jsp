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
						<p class="category text-decoration-none">
							<c:choose>
								<c:when test="${value.OrganizationType eq 'area'}">Area</c:when>
								<c:when test="${value.OrganizationType eq 'ufficio'}">Ufficio</c:when>
								<c:when test="${value.OrganizationType eq 'giuntacomunale'}">Giunta comunale</c:when>
								<c:when test="${value.OrganizationType eq 'consigliocomunale'}">Consiglio comunale</c:when>
								<c:when test="${value.OrganizationType eq 'commissione'}">Commissione</c:when>
								<c:when test="${value.OrganizationType eq 'biblioteca'}">Biblioteca</c:when>
								<c:when test="${value.OrganizationType eq 'museo'}">Museo</c:when>
								<c:when test="${value.OrganizationType eq 'aziendamunicipalizzata'}">Azienda municipalizzata</c:when>
								<c:when test="${value.OrganizationType eq 'ente'}">Ente</c:when>
								<c:when test="${value.OrganizationType eq 'fondazione'}">Fondazione</c:when>
								<c:when test="${value.OrganizationType eq 'centroculturale'}">Centro culturale</c:when>
								<c:when test="${value.OrganizationType eq 'scuola'}">Scuola</c:when>
								<c:otherwise>Tipo sconosciuto</c:otherwise>
							</c:choose>
						</p>
					</div>
					<c:set var="basePath" value=""/>	
					<c:choose>
						<c:when test="${value.OrganizationType eq 'area'}">
							<c:set var="basePath" value="/amministrazione/aree-amministrative/area/" />
						</c:when>
						<c:when test="${value.OrganizationType eq 'ufficio'}">
							<c:set var="basePath" value="/amministrazione/uffici/ufficio/" />
						</c:when>
						<c:when test="${value.OrganizationType eq 'giuntacomunale' || value.OrganizationType eq 'consigliocomunale' || value.OrganizationType eq 'commissione'}">
							<c:set var="basePath" value="/amministrazione/organi-di-governo/organo-di-governo/" />
						</c:when>
						<c:when test="${value.OrganizationType eq 'biblioteca' || value.OrganizationType eq 'museo' || value.OrganizationType eq 'aziendamunicipalizzata' ||
									  value.OrganizationType eq 'ente' || value.OrganizationType eq 'fondazione' || value.OrganizationType eq 'centroculturale' || value.OrganizationType eq 'scuola'}">
							<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
						</c:when>
						<c:otherwise>
							<c:set var="basePath" value="/amministrazione/enti-e-fondazioni/ente-o-fondazione/" />
						</c:otherwise>
					</c:choose>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" class="text-decoration-none" data-element="news-category-link">
						<h3 class="card-title">${value.Title}</h3>
					</a>
					<p class="card-text text-secondary">${value.Abstract}</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>