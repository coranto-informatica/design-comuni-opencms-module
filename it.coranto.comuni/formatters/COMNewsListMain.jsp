<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="container">
		<c:choose>
			<c:when test="${empty value.TypesToCollect}">
				<div> Select the resource type </div>
			</c:when>
			<c:otherwise>
				<c:set var="resType">${fn:substringBefore(value.TypesToCollect, ":")}</c:set>
				<c:set var="path">${cms.requestContext.siteRoot}${value.Folder}</c:set>
				<c:set var="pagesize">1</c:set>
				<c:set var="searchconfig">
					{
					"ignorequery" : true,
					"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=con_locales:${cms.locale}&sort=Date_it_dt desc&rows=1",
					}
				</c:set>
				<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
				<c:choose>
					<c:when test="${search.numFound > 0}">
						<c:forEach var="result" items="${search.searchResults}">
							<cms:display
										 value="${result.xmlContent.filename}"
										 displayFormatters="${value.TypesToCollect}"
										 editable="true"
										 create="true"
										 delete="true" />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<cms:edit createType="${resType}" create="true">
							<div>No news found.</div>
						</cms:edit>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>

</cms:formatter>