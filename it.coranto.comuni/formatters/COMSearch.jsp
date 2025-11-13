<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">
	<c:set var="rowsPerPage" value="9" />
	<c:set var="paramPage" value="${param.page}" />
	<c:set var="currentPage" value="${empty paramPage ? 1 : paramPage}" />
	<c:if test="${currentPage < 1}">
		<c:set var="currentPage" value="1" />
	</c:if>

	<c:set var="startIndex" value="${(currentPage - 1) * rowsPerPage}" />

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">
		<div class="bg-grey-card py-5">
			<div class="container">
				<h2 class="text-secondary mb-4">${value.Title}</h2>

				<c:set var="resType" value="${fn:substringBefore(value.TypesToCollect, ':')}" />
				<c:choose>
					<c:when test="${not empty resType}">
						<c:set var="resTypeFilter" value="&fq=type:${resType}" />
					</c:when>
					<c:otherwise>
						<c:set var="resTypeFilter" value="" />
					</c:otherwise>
				</c:choose>
				<c:set var="path" value="${cms.requestContext.siteRoot}${value.Folder}" />
				<c:choose>
					<c:when test="${not empty value.Category}">
						<c:choose>
							<c:when test="${resType eq 'COMNews'}">
								<c:set var="resCategory" value="&fq=Type_${cms.locale}:${value.Category}" />
							</c:when>
							<c:when test="${resType eq 'COMOrganizationUnit'}">
								<c:set var="resCategory" value="&fq=OrganizationType_${cms.locale}:${value.Category}" />
							</c:when>
							<c:when test="${resType eq 'COMPublicPerson'}">
								<c:set var="resCategory" value="&fq=AssignmentType_${cms.locale}:${value.Category}" />
							</c:when>
							<c:when test="${resType eq 'COMPublicDocument'}">
								<c:set var="resCategory" value="&fq=Type_${cms.locale}:${value.Category}" />
							</c:when>
							<c:otherwise>
								<c:set var="resCategory" value="" />
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:set var="resCategory" value="" />
					</c:otherwise>
				</c:choose>
				<c:set var="queryParam" value="${not empty param.query ? fn:escapeXml(param.query) : '*:*'}" />
				<c:set var="query" value="${fn:toLowerCase(queryParam)}" />
				<c:choose>
					<c:when test="${resType eq 'COMNews'}">
						<c:set var="searchconfig">
							{
							"ignorequery" : true,
							"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}&fq=con_locales:${cms.locale}${resCategory}&sort=Date_it_dt desc&rows=9&start=${startIndex}&q=${query}"
							}
						</c:set>
					</c:when>
					<c:otherwise>
						<c:set var="searchconfig">
							{
							"ignorequery" : true,
							"extrasolrparams" : "fq=parent-folders:\"${path}\"${resTypeFilter}&fq=con_locales:${cms.locale}${resCategory}&sort=title_${cms.locale}_s asc&rows=9&start=${startIndex}&q=${query}"
							}
						</c:set>
					</c:otherwise>
				</c:choose>
				<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />
				<c:set var="totalPages" value="${(search.numFound / rowsPerPage) + (search.numFound % rowsPerPage > 0 ? 1 : 0)}" />
				<c:if test="${currentPage > totalPages}">
					<c:set var="currentPage" value="${totalPages}" />
				</c:if>

				<form method="post" action="#search">
					<div id="search" class="cmp-input-search">
						<div class="form-group autocomplete-wrapper">
							<div class="input-group">
								<label for="autocomplete-autocomplete-three" class="visually-hidden">cerca</label>
								<input type="search" class="autocomplete form-control" placeholder="Cerca per parola chiave" id="autocomplete-autocomplete-three" name="query" value="${param.query}">
								<div class="input-group-append">
									<button class="btn btn-primary" type="submit" id="button-3">Invio</button>
								</div>
								<span class="autocomplete-icon" aria-hidden="true">
									<svg class="icon icon-sm icon-primary">
										<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
									</svg>
								</span>
							</div>

							<c:if test="${not empty value.ResourceObject}">
								<p id="autocomplete-label" class="text-paragraph-card mt-2 mb-30 mt-lg-3 mb-lg-40">
									${search.numFound}&nbsp;${value.ResourceObject}
								</p>
							</c:if>
						</div>
					</div>
				</form>

				<!-- Aggiunto id="risultati" -->
				<div id="risultati" class="row g-4">
					<c:choose>
						<c:when test="${empty value.TypesToCollect}">
							<div> Select the resource type </div>
						</c:when>
						<c:otherwise>
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
										<div>Nessun altro risultato</div>
									</cms:edit>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

					<c:if test="${search.numFound > 9}">
						<nav class="pagination-wrapper justify-content-center" aria-label="Navigazione centrata">
							<ul class="pagination">

								<!-- Freccia pagina precedente -->
								<c:choose>
									<c:when test="${currentPage > 1}">
										<li class="page-item">
											<a class="page-link" href="?page=${currentPage - 1}#risultati">
												<svg class="icon icon-primary">
													<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-chevron-left</cms:link>"></use>
												</svg>
												<span class="visually-hidden">Pagina precedente</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<span class="page-link">
												<svg class="icon icon-primary">
													<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-chevron-left</cms:link>"></use>
												</svg>
												<span class="visually-hidden">Pagina precedente</span>
											</span>
										</li>
									</c:otherwise>
								</c:choose>

								<!-- Pagine numeriche -->
								<c:forEach var="i" begin="1" end="${totalPages}">
									<c:choose>
										<c:when test="${i == currentPage}">
											<li class="page-item active">
												<span class="page-link" aria-current="page">${i}</span>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="?page=${i}#risultati">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- Freccia pagina successiva -->
								<c:choose>
									<c:when test="${currentPage + 1 <= totalPages}">
										<li class="page-item">
											<a class="page-link" href="?page=${currentPage + 1}#risultati">
												<svg class="icon icon-primary">
													<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-chevron-right</cms:link>"></use>
												</svg>
												<span class="visually-hidden">Pagina successiva</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<span class="page-link">
												<svg class="icon icon-primary">
													<use href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/svg/sprites.svg#it-chevron-right</cms:link>"></use>
												</svg>
												<span class="visually-hidden">Pagina successiva</span>
											</span>
										</li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav>
					</c:if>
				</div>
			</div>
		</div>
	</cms:bundle>
</cms:formatter>
