<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="col-md-6 col-xl-4">
		<div class="card-wrapper border border-light rounded shadow-sm pb-0">
			<div class="card no-after rounded">
				<div class="card-body rounded-top">
					<div class="categoryicon-top">
						<svg class="icon icon-sm" aria-hidden="true">
							<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-file</cms:link>"></use>
						</svg>
						<span class="text fw-semibold">
							<c:choose>
								<c:when test="${value.Type eq 'documentoalbopretorio'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-albo-pretorio/</cms:link>">Documenti albo Pretorio</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-albo-pretorio/documento-albo-pretorio/" />
								</c:when>
								<c:when test="${value.Type eq 'modulistica'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/modulistica/</cms:link>">Modulistica</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/modulistica/modulistica/" />
								</c:when>
								<c:when test="${value.Type eq 'documentofunzionamentointerno'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-funzionamento-interno/</cms:link>">Documento funzionamento interno</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-funzionamento-interno/documento-funzionamento-interno/" />
								</c:when>
								<c:when test="${value.Type eq 'attonormativo'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/atti-normativi/</cms:link>">Atto normativo</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/atti-normativi/atto-normativo/" />
								</c:when>
								<c:when test="${value.Type eq 'accordotraenti'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/accordi-tra-enti/</cms:link>">Accordo tra enti</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/accordi-tra-enti/accordo-tra-enti/" />
								</c:when>
								<c:when test="${value.Type eq 'documentoattivitapolitica'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-attivita-politica/</cms:link>">Documento attività politica</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-attivita-politica/documento-attivita-politica/" />
								</c:when>
								<c:when test="${value.Type eq 'documentotecnicosupporto'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-di-supporto/</cms:link>">Documento tecnico di supporto</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-supporto/documento-di-supporto/" />
								</c:when>
								<c:when test="${value.Type eq 'istanza'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/istanze/</cms:link>">Istanza</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/istanze/istanza/" />
								</c:when>
								<c:when test="${value.Type eq 'documentodiprogrammazionerendicontazione'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/</cms:link>">Documento di programmazione e rendicontazione</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/documento-di-programmazione-e-redicontazione/" />
								</c:when>
								<c:when test="${value.Type eq 'dataset'}">
									<a class="category text-decoration-none" href="<cms:link>/amministrazione/documenti-e-dati/dataset/</cms:link>">Dataset</a>
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/dataset/dataset/" />
								</c:when>
								<c:otherwise>
									Tipo sconosciuto
								</c:otherwise>
							</c:choose>
						</span>
					</div>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" class="text-decoration-none" data-element="news-category-link">
						<h3 class="card-title h4">${value.Title}</h3>
					</a>
					<p class="text-secondary mb-0">${value.Abstract}</p>
				</div>
			</div>
		</div>
	</div>

</cms:formatter>
