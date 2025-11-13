<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<cms:formatter var="content" val="value">
	<c:set var="category" value="${value.Category}" />
	<c:set var="basePath" value="#" />
	<c:set var="categoryHref" value="#" />
	<c:set var="categoryLabel" value="Tipo sconosciuto" />

	<!-- Mappatura category -> basePath, categoryHref e label -->
	<c:choose>
		<c:when test="${category eq 'educazioneeformazione'}">
			<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
			<c:set var="categoryHref" value="/servizi/educazione-e-formazione/" />
			<c:set var="categoryLabel" value="Educazione e formazione" />
		</c:when>
		<c:when test="${category eq 'salutebenessereeassistenza'}">
			<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
			<c:set var="categoryHref" value="/servizi/salute-benessere-e-assistenza/" />
			<c:set var="categoryLabel" value="Salute, benessere e assistenza" />
		</c:when>
		<c:when test="${category eq 'vitalavorativa'}">
			<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
			<c:set var="categoryHref" value="/servizi/vita-lavorativa/" />
			<c:set var="categoryLabel" value="Vita lavorativa" />
		</c:when>
		<c:when test="${category eq 'mobilitaetrasporti'}">
			<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
			<c:set var="categoryHref" value="/servizi/mobilita-e-trasporti/" />
			<c:set var="categoryLabel" value="Mobilità e trasporti" />
		</c:when>
		<c:when test="${category eq 'catastoeurbanistica'}">
			<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
			<c:set var="categoryHref" value="/servizi/catasto-e-urbanistica/" />
			<c:set var="categoryLabel" value="Catasto e urbanistica" />
		</c:when>
		<c:when test="${category eq 'anagrafestatocivile'}">
			<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
			<c:set var="categoryHref" value="/servizi/anagrafe-e-stato-civile/" />
			<c:set var="categoryLabel" value="Anagrafe e stato civile" />
		</c:when>
		<c:when test="${category eq 'turismo'}">
			<c:set var="basePath" value="/servizi/turismo/turismo/" />
			<c:set var="categoryHref" value="/servizi/turismo/" />
			<c:set var="categoryLabel" value="Turismo" />
		</c:when>
		<c:when test="${category eq 'giustiziasicurezzapubblica'}">
			<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
			<c:set var="categoryHref" value="/servizi/giustizia-e-sicurezza-pubblica/" />
			<c:set var="categoryLabel" value="Giustizia e sicurezza pubblica" />
		</c:when>
		<c:when test="${category eq 'tributifinanzecontravvenzioni'}">
			<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
			<c:set var="categoryHref" value="/servizi/tributi-finanze-e-contravvenzioni/" />
			<c:set var="categoryLabel" value="Tributi, finanze e contravvenzioni" />
		</c:when>
		<c:when test="${category eq 'culturatempolibero'}">
			<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
			<c:set var="categoryHref" value="/servizi/cultura-e-tempo-libero/" />
			<c:set var="categoryLabel" value="Cultura e tempo libero" />
		</c:when>
		<c:when test="${category eq 'ambiente'}">
			<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
			<c:set var="categoryHref" value="/servizi/ambiente/" />
			<c:set var="categoryLabel" value="Ambiente" />
		</c:when>
		<c:when test="${category eq 'impreseecommercio'}">
			<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
			<c:set var="categoryHref" value="/servizi/imprese-e-commercio/" />
			<c:set var="categoryLabel" value="Imprese e commercio" />
		</c:when>
		<c:when test="${category eq 'autorizzazioni'}">
			<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
			<c:set var="categoryHref" value="/servizi/autorizzazioni/" />
			<c:set var="categoryLabel" value="Autorizzazioni" />
		</c:when>
		<c:when test="${category eq 'appaltipubblici'}">
			<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
			<c:set var="categoryHref" value="/servizi/appalti-pubblici/" />
			<c:set var="categoryLabel" value="Appalti pubblici" />
		</c:when>
		<c:when test="${category eq 'agricolturapesca'}">
			<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
			<c:set var="categoryHref" value="/servizi/agricoltura-e-pesca/" />
			<c:set var="categoryLabel" value="Agricoltura e pesca" />
		</c:when>
	</c:choose>

	<div class="cmp-card-latest-messages mb-3 mb-30" data-bs-toggle="modal" data-bs-target="#">
		<div class="card shadow-sm px-4 pt-4 pb-4 rounded">

			<!-- SOLO per /servizi/index.html -->
			<c:if test="${cms.requestContext.uri eq '/servizi/index.html'}">
				<span class="visually-hidden">Categoria:</span>
				<div class="card-header border-0 p-0">
					<a class="text-decoration-none title-xsmall-bold mb-2 category text-uppercase"
					   href="<cms:link>${categoryHref}</cms:link>" data-focus-mouse="false">
						${categoryLabel}
					</a>
				</div>
			</c:if>

			<!-- SEMPRE visibile -->
			<div class="card-body p-0 my-2">
				<h3 class="green-title-big t-primary mb-8">
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>"
					   class="text-decoration-none" data-element="service-link" data-focus-mouse="false">
						${value.Title}
					</a>
				</h3>
				<p class="text-paragraph">${value.Abstract}</p>
			</div>

		</div>
	</div>
</cms:formatter>

