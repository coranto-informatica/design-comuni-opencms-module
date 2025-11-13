<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="cmp-breadcrumbs" role="navigation">
	<nav class="breadcrumb-container" aria-label="breadcrumb">
		<cms:navigation type="breadCrumb" var="breadcrumb" startLevel="1" />
		<ol class="breadcrumb p-0" data-element="breadcrumb">	
			<li class="breadcrumb-item"><a href="/" title="Vai alla pagina: Home">Home</a><span class="separator">/</span></li>
			<c:forEach items="${breadcrumb.items}" var="item" varStatus="status">
				<li class="breadcrumb-item">
					<a href="<cms:link>${item.resourceName}</cms:link>" title= "Vai alla pagina: ${item.navText}">${item.navText}</a><span class="separator">/</span>
				</li>
			</c:forEach>
			<c:choose>

				<c:when test = "${not empty value.Title}">
					<li class="breadcrumb-item active" aria-current="page">${value.Title}</li>
				</c:when>
				<c:when test = "${not empty value.Fullname}">
					<li class="breadcrumb-item active" aria-current="page">${value.Fullname}</li>
				</c:when>
				<c:when test = "${not empty value.Name}">
					<li class="breadcrumb-item active" aria-current="page">${value.Name}</li>
				</c:when>  
				<c:otherwise>
					<li class="breadcrumb-item active" aria-current="page">${cms.vfs.propertySearch[cms.requestContext.uri]['NavText']}</li>
				</c:otherwise>
			</c:choose>
		</ol>
	</nav>
</div>










