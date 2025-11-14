<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<c:set var="argumentFolderPath">/argomenti/argomento/</c:set>
	<ul class="d-flex flex-wrap gap-1">
		<c:forEach 
				   var="argument" 
				   items="${fn:split(fn:replace(fn:replace(content.valueList.Argument, '[', ''), ']', ''), ',')}" 
				   varStatus="status">
			<c:set var="argumentSearch">\"${argument}\"</c:set>
			<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
			<c:set var="pagesize">4</c:set>
			<c:set var="searchconfig">
				{
				"ignorequery": true,
				"extrasolrparams": "fq=parent-folders:\"${path}\"&fq=type:COMArgument&fq=con_locales:${cms.locale}&fq=title_${cms.locale}_s=${argumentSearch}",
				"pagesize": ${pagesize}
				}
			</c:set>							
			<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
			<c:forEach var="result" items="${search.searchResults}" varStatus="status">
				<c:set var="argumentPath">${result.fields['path']}</c:set>
			</c:forEach>
			<li>
				<a class="chip chip-simple" aria-label="Vai all'argomento: ${fn:escapeXml(argument)}" title="Vai all'argomento: ${fn:escapeXml(argument)}" href="<cms:link detailPage='${argumentFolderPath}'>${argumentPath}</cms:link>" data-focus-mouse="false">
					<span class="chip-label">${argument}</span>
				</a>
			</li>
		</c:forEach>
	</ul>

</cms:formatter>