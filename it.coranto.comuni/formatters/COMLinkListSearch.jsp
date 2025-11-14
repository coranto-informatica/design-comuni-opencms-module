<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div class="link-list-wrapper">
			<div class="other-link-title">
				<fmt:message key="label.lookingfor"/>
			</div>
			<ul class="link-list">
				<c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
					<c:choose>
						<c:when test="${fn:contains(link.value.Link, '/.content/')}">
							<cms:contentload collector="singleFile" param="${link.value.Link}" preload="true">
								<cms:contentload>
									<cms:contentaccess var="detail"/>
									<c:set var="category" value="${detail.value.Category}" />
									<c:set var="type" value="${detail.value.Type}" />
								</cms:contentload>
							</cms:contentload>

							<!-- Gestione category -->
							<c:choose>
								<c:when test="${category eq 'educazioneeformazione'}">
									<c:set var="basePath" value="/servizi/educazione-e-formazione/educazione-e-formazione/" />
								</c:when>
								<c:when test="${category eq 'salutebenessereeassistenza'}">
									<c:set var="basePath" value="/servizi/salute-benessere-e-assistenza/salute-benessere-e-assistenza/" />
								</c:when>
								<c:when test="${category eq 'vitalavorativa'}">
									<c:set var="basePath" value="/servizi/vita-lavorativa/vita-lavorativa/" />
								</c:when>
								<c:when test="${category eq 'mobilitaetrasporti'}">
									<c:set var="basePath" value="/servizi/mobilita-e-trasporti/mobilita-e-trasporti/" />
								</c:when>
								<c:when test="${category eq 'catastoeurbanistica'}">
									<c:set var="basePath" value="/servizi/catasto-e-urbanistica/catasto-e-urbanistica/" />
								</c:when>
								<c:when test="${category eq 'anagrafestatocivile'}">
									<c:set var="basePath" value="/servizi/anagrafe-e-stato-civile/anagrafe-e-stato-civile/" />
								</c:when>
								<c:when test="${category eq 'turismo'}">
									<c:set var="basePath" value="/servizi/turismo/turismo/" />
								</c:when>
								<c:when test="${category eq 'giustiziasicurezzapubblica'}">
									<c:set var="basePath" value="/servizi/giustizia-e-sicurezza-pubblica/giustizia-e-sicurezza-pubblica/" />
								</c:when>
								<c:when test="${category eq 'tributifinanzecontravvenzioni'}">
									<c:set var="basePath" value="/servizi/tributi-finanze-e-contravvenzioni/tributi-finanze-e-contravvenzioni/" />
								</c:when>
								<c:when test="${category eq 'culturatempolibero'}">
									<c:set var="basePath" value="/servizi/cultura-e-tempo-libero/cultura-e-tempo-libero/" />
								</c:when>
								<c:when test="${category eq 'ambiente'}">
									<c:set var="basePath" value="/servizi/ambiente/ambiente/" />
								</c:when>
								<c:when test="${category eq 'impreseecommercio'}">
									<c:set var="basePath" value="/servizi/imprese-e-commercio/imprese-e-commercio/" />
								</c:when>
								<c:when test="${category eq 'autorizzazioni'}">
									<c:set var="basePath" value="/servizi/autorizzazioni/autorizzazione/" />
								</c:when>
								<c:when test="${category eq 'appaltipubblici'}">
									<c:set var="basePath" value="/servizi/appalti-pubblici/appalto-pubblico/" />
								</c:when>
								<c:when test="${category eq 'agricolturapesca'}">
									<c:set var="basePath" value="/servizi/agricoltura-e-pesca/agricoltura-e-pesca/" />
								</c:when>
							</c:choose>

							<!-- Gestione type -->
							<c:choose>
								<c:when test="${type eq 'documentoalbopretorio'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-albo-pretorio/documento-albo-pretorio/" />
								</c:when>
								<c:when test="${type eq 'modulistica'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/modulistica/modulistica/" />
								</c:when>
								<c:when test="${type eq 'documentofunzionamentointerno'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-funzionamento-interno/documento-funzionamento-interno/" />
								</c:when>
								<c:when test="${type eq 'attonormativo'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/atti-normativi/atto-normativo/" />
								</c:when>
								<c:when test="${type eq 'accordotraenti'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/accordi-tra-enti/accordo-tra-enti/" />
								</c:when>
								<c:when test="${type eq 'documentoattivitapolitica'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-attivita-politica/documento-attivita-politica/" />
								</c:when>
								<c:when test="${type eq 'documentotecnicosupporto'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-supporto/documento-di-supporto/" />
								</c:when>
								<c:when test="${type eq 'istanza'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/istanze/istanza/" />
								</c:when>
								<c:when test="${type eq 'documentodiprogrammazionerendicontazione'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/documenti-di-programmazione-e-rendicontazione/documento-di-programmazione-e-redicontazione/" />
								</c:when>
								<c:when test="${type eq 'dataset'}">
									<c:set var="basePath" value="/amministrazione/documenti-e-dati/dataset/dataset/" />
								</c:when>
							</c:choose>


							<li>
								<a class="list-item mb-3 active ps-0"
								   href="<cms:link detailPage='${basePath}'>${link.value.Link}</cms:link>"
								   title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}"
								   target="${link.value.LinkTarget}"
								   data-focus-mouse="false">
									<span class="text-button-normal">${link.value.LinkTitle}</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a class="list-item mb-3 active ps-0"
								   href="<cms:link>${link.value.Link}</cms:link>"
								   title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}"
								   target="${link.value.LinkTarget}"
								   data-focus-mouse="false">
									<span class="text-button-normal">${link.value.LinkTitle}</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>

	</cms:bundle>
</cms:formatter>
