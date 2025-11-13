<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<footer class="it-footer" id="footer">

	<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/cookiebar.jsp:ce2242e6-5cab-11f0-9808-1b1fd91899eb)" %>

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<c:if test="${cms.isEditMode}">
			<c:set var="containerStyle" value="style= 'min-width:202px;'" />
		</c:if>

		<a href="#" aria-label="Torna su" data-bs-toggle="backtotop" class="back-to-top shadow">
			<svg class="icon icon-light">
				<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-up</cms:link>"></use>
			</svg>
		</a>

		<div class="it-footer-main">
			<div class="container">
				<div class="row">
					<div class="col-12 footer-items-wrapper logo-wrapper">

						<div ${containerStyle}><cms:container name="footerimage" type="footerimage" maxElements="1"/></div>

						<div ${containerStyle}><cms:container tagClass="it-brand-wrapper" name="footercard" type="footercard" maxElements="1"/></div>

					</div>
				</div>

				<div class="row">				
					<div class="col-md-9 mt-md-4 footer-items-wrapper">
						<h3 class="footer-heading-title"><fmt:message key="label.contacts"/></h3>
						<div class="row">
							<div class="col-md-4">
								<cms:container name="identity" type="identity" maxElements="1"/>
								<cms:container tagClass="footer-info" name="footercontacts" type="footercontacts"/>
							</div>
							<div class="col-md-4">
								<div class="menu-info-1-container">
									<ul id="menu-info-1" class="footer-list">
										<li><a href="<cms:link>/domande-frequenti/</cms:link>" data-element="faq">Leggi le FAQ</a></li>
										<li><a href="<cms:link>/appuntamento/</cms:link>">Prenotazione appuntamento</a></li>
										<li><a href="<cms:link>/servizi/segnalazione-dettaglio/Segnalazione-disservizio/</cms:link>" data-element="report-inefficiency">Segnalazione disservizio</a></li>
										<li><a href="<cms:link>/assistenza/</cms:link>">Richiesta d'assistenza</a></li>
									</ul>
								</div>                       
							</div>
							<cms:container tagClass="col-md-4" name="footerlinklist2" type="footerlinklist" maxElements="1"/>
						</div>
					</div>
					<cms:container tagClass="col-md-3 mt-md-4 footer-items-wrapper" name="footersocial" type="footersocial" maxElements="6"/>
				</div>
				<div class="row">
					<div class="col-12 footer-items-wrapper">

						<cms:container tagClass="footer-bottom" name="footermenu" type="footermenu" maxElements="1"/>

					</div>
				</div>
			</div>
		</div>
	</cms:bundle>
</footer>
