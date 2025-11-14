<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<p class="footer-info mb-0">
		<c:if test="${not empty value.Type.value.Pec}">
			<span class="d-none d-md-inline d-lg-none">
				<a href="mailto:${value.Type.value.Pec}" aria-label="Invia una PEC a ${value.Type.value.Pec}" title="Invia una PEC a ${value.Type.value.Pec}" target="_blank" data-focus-mouse="false">PEC</a>
			</span>
			<span class="d-md-none d-lg-inline">
				PEC: <a href="mailto:${value.Type.value.Pec}" aria-label="Invia una PEC a ${value.Type.value.Pec}" title="Invia una PEC a ${value.Type.value.Pec}" target="_blank" data-focus-mouse="false">${value.Type.value.Pec}</a>
			</span>
		</c:if>
		<c:if test="${not empty value.Type.value.Email}">
			<span class="d-none d-md-inline d-lg-none">
				<a href="mailto:${value.Type.value.Email}" aria-label="Invia una Email a ${value.Type.value.Email}" title="Invia una Email a ${value.Type.value.Email}" target="_blank" data-focus-mouse="false">Email</a>
			</span>
			<span class="d-md-none d-lg-inline">
				Email: <a href="mailto:${value.Type.value.Email}" aria-label="Invia una Email a ${value.Type.value.Email}" title="Invia una Email a ${value.Type.value.Email}" target="_blank" data-focus-mouse="false">${value.Type.value.Email}</a>
			</span>
		</c:if>
		<c:if test="${not empty value.Type.value.PhoneNumber}">
			Telefono: ${value.Type.value.PhoneNumber}
		</c:if>
		<c:if test="${not empty value.Type.value.Fax}">
			Fax: ${value.Type.value.Fax}
		</c:if>
	</p>
</cms:formatter>