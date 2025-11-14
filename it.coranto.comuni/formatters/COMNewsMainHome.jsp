<%@ page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<fmt:setLocale value="it" />

	<div class="row">
		<div class="col-lg-6 order-2 order-lg-1">
			<div class="card mb-5">
				<div class="card-body pb-5 px-0">
					<div class="category-top">
						<svg class="icon icon-sm" aria-hidden="true" aria-label="${value.Type}">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-calendar</cms:link>"></use>
						</svg>
						<c:set var="type" value="${value.Type}" />
						<c:set var="basePath" value="" />
						<c:choose>
							<c:when test="${type eq 'notizia'}">
								<span class="title-xsmall-semi-bold fw-semibold">Notizie</span>
								<c:set var="basePath" value="/novita/notizie/notizia/" />
							</c:when>
							<c:when test="${type eq 'avviso'}">
								<span class="title-xsmall-semi-bold fw-semibold">Avvisi</span>
								<c:set var="basePath" value="/novita/avvisi/avviso/" />
							</c:when>
							<c:otherwise>
								<span class="title-xsmall-semi-bold fw-semibold">Comunicati stampa</span>
								<c:set var="basePath" value="/novita/comunicati/comunicato/" />
							</c:otherwise>
						</c:choose>
						<span class="data fw-normal">						
							<c:set var="formattedDate">
								<fmt:formatDate 
												value="${cms:convertDate(value.Date)}" 
												pattern="dd MMM yyyy" />
							</c:set>
							${fn:toUpperCase(formattedDate)}
						</span>
					</div>
					<a href="<cms:link detailPage='${basePath}'>${content.filename}</cms:link>" title="${fn:escapeXml(value.Title)}" class="text-decoration-none">
						<h3 ${rdfa.Title} class="card-title">${value.Title}</h3>
					</a>
					<p ${rdfa.Abstract} class="mb-4 pt-3 lora">
						${value.Abstract}
					</p>
					<c:set var="argumentFolderPath">/argomenti/argomento/</c:set>
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
						<a class="chip chip-simple" href="<cms:link detailPage='${argumentFolderPath}'>${argumentPath}</cms:link>" title="Vai all'argomento: ${fn:escapeXml(argument)}" data-element="news-topic" data-focus-mouse="false">
							<span class="chip-label">${argument}</span>
						</a>
					</c:forEach>
					<a class="read-more pb-3" href="<cms:link>/novita/</cms:link>" title="Vai alla pagina: Tutte le novità">
						<span class="text">Tutte le novità</span>
						<svg class="icon" aria-label="Tutte le novità">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-right</cms:link>"></use>
						</svg>
					</a>
				</div> <!-- .card-body -->
			</div>
		</div><!-- .card -->

		<c:if test="${not empty value.Image}">
			<div class="col-lg-6 order-1 order-lg-2 px-0 px-lg-3">
				<img src="<cms:link>${value.Image.value.Image}</cms:link>" 
					 title="${fn:escapeXml(value.Title)}" 
					 alt="${fn:escapeXml(value.Image.value.Description)}" 
					 class="img-fluid">
			</div>
		</c:if>
	</div>
</cms:formatter>
