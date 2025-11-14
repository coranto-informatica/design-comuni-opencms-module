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

	<div class="bg-grey-card py-5">
		<div class="container">
			<h2 class="title-xxlarge mb-4"><fmt:message key="label.highlighted"/></h2>
			<cms:container tagClass="row g-4" name="highlightedelements" type="highlightedelements" maxElements="3"/>
		</div>
	</div>

</cms:bundle>