<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<article class="it-card rounded shadow-sm border">
		<h3 class="it-card-title">
			<p>${value.Title}</p>
		</h3>
		<div class="it-card-body">
			<p class="it-card-text">
				${value.Type.value.Email}
				${value.Type.value.PhoneNumber}
				${value.Type.value.Fax}
				${value.Type.value.Url}
				${value.Type.value.Pec}
				${value.Type.value.Account}
			</p>
		</div>
	</article>
</cms:formatter>