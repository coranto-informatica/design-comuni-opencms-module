<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
    <fmt:setLocale value="it" />
    <cms:bundle basename="it.coranto.comuni.messages">

        <div class="link-list-wrap">
            <h2 class="title-xsmall-semi-bold mb-3">
                <span ${rdfa.Title}>${value.Title}</span>
            </h2>
            <ul class="link-list t-primary">
                <c:forEach var="link" items="${content.valueList.Link}" varStatus="status">
                    <c:choose>
                        <c:when test="${fn:contains(link.value.Link, '/.content/')}">
                            <cms:contentload collector="singleFile" param="${link.value.Link}" preload="true">
                                <cms:contentload>
                                    <cms:contentaccess var="detail"/>
                                    <c:set var="category">${detail.value.Category}</c:set>
                                </cms:contentload>
                            </cms:contentload>
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
                                <c:otherwise>
                                    <c:set var="basePath" value="#" />
                                    Tipo sconosciuto (${category})
                                </c:otherwise>
                            </c:choose>
                            <li class="mb-3">
                                <a class="list-item ps-0 title-medium"
                                   href="<cms:link detailPage='${basePath}'>${link.value.Link}</cms:link>"
                                   title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}"
                                   target="${link.value.LinkTarget}"
                                   data-focus-mouse="false">
                                    <span>${link.value.LinkTitle}</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="mb-3">
                                <a class="list-item ps-0 title-medium"
                                   href="<cms:link>${link.value.Link}</cms:link>"
                                   title="Vai alla pagina: ${fn:escapeXml(link.value.LinkTitle)}"
                                   target="${link.value.LinkTarget}"
                                   data-focus-mouse="false">
                                    <span>${link.value.LinkTitle}</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>

    </cms:bundle>
</cms:formatter>
