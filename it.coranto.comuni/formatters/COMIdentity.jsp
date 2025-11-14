<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<p class="footer-info">
		${value.Title}<br>
		${value.Address} - ${value.PostalCode}&nbsp;${value.Town}<br>
		<c:choose>
			<c:when test="${value.FiscalCode eq 'true'}">
				Codice Fiscale / P. IVA: ${value.VATNumber}
			</c:when>
			<c:otherwise>
				P. IVA: ${value.VATNumber}
			</c:otherwise>
		</c:choose>
	</p>

</cms:formatter>