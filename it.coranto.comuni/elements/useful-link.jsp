<%@page
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"
	buffer="none"
	%>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="it" />
<cms:bundle basename="it.coranto.comuni.messages">

	<div class="bg-grey-card shadow-contacts">
		<div class="container">
			<div class="row d-flex justify-content-center p-contacts">
				<div class="col-12 col-lg-6">
					<div class="cmp-contacts">
						<div class="card w-100">

							<div class="card-body">
								<h2 class="title-medium-2-semi-bold"><fmt:message key="label.contact"/></h2>
								<ul class="contact-list p-0">
									<li><a class="list-item" href="<cms:link>/domande-frequenti/</cms:link>" data-element="faq" data-focus-mouse="false">
										<svg class="icon icon-primary icon-sm" aria-hidden="true" aria-label="<fmt:message key='label.faq'/>">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-help-circle</cms:link>"></use>
										</svg><span><fmt:message key="label.faq"/></span></a></li>
									<li>		
										<a class="list-item" href="<cms:link>/assistenza/</cms:link>" data-element="contacts" data-focus-mouse="false">
											<svg class="icon icon-primary icon-sm" aria-hidden="true" aria-label="<fmt:message key='label.askassistance'/>">
												<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-mail</cms:link>"></use>
											</svg><span><fmt:message key="label.askassistance"/></span></a>							
									</li>
									<li>
										<fmt:message key="label.number" var="number"/>
										<c:set var="cleanNumber" value="${fn:replace(number, ' ', '')}" />
										<a class="list-item" href="callto:${cleanNumber}" data-focus-mouse="false">
											<svg class="icon icon-primary icon-sm" aria-hidden="true" aria-label="<fmt:message key='label.callto'/>&nbsp;<fmt:message key='label.number'/>">
												<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-hearing</cms:link>"></use>
											</svg><span><fmt:message key='label.callto'/>&nbsp;<fmt:message key='label.number'/></span></a>
									</li>
									<li><a class="list-item" href="<cms:link>/appuntamento/</cms:link>" data-element="appointment-booking" data-focus-mouse="false">
										<svg class="icon icon-primary icon-sm" aria-hidden="true" aria-label="<fmt:message key='label.appointmentbooking'/>">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-calendar</cms:link>"></use>
										</svg><span><fmt:message key="label.appointmentbooking"/></span></a></li>
								</ul>
								<h2 class="title-medium-2-semi-bold mt-4"><fmt:message key="label.problemsintown"/></h2>
								<ul class="contact-list p-0">
									<li><a class="list-item" href="<cms:link>/servizi/segnalazione-dettaglio/Segnalazione-disservizio/</cms:link>" data-focus-mouse="false">
										<svg class="icon icon-primary icon-sm" aria-hidden="true" aria-label="<fmt:message key='label.complaint'/>">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-map-marker-circle</cms:link>"></use>
										</svg><span><fmt:message key="label.complaint"/></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</cms:bundle>

<script src="<cms:link>/system/modules/it.coranto.comuni/resources/js/feedback.js</cms:link>" defer></script>
