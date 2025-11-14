<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div class="col-lg-6 col-xl-4">
			<div class="card-wrapper shadow-sm rounded border border-light">
				<div class="card no-after rounded">
					<div class="img-responsive-wrapper">
						<c:if test="${not empty value.Image.value.Image}">
							<div class="img-responsive img-responsive-panoramic">
								<figure class="img-wrapper">
									<img src="<cms:link>${value.Image.value.Image}</cms:link>" class="rounded-top img-fluid" alt="${fn:escapeXml(value.Image.value.Description)}" title="${fn:escapeXml(value.Image.value.Title)}">                  
								</figure>
							</div>
						</c:if>
					</div>
					<div class="card-body">
						<h3 class="card-title">
							<a class="text-decoration-none" href="<cms:link detailPage='/eventi/luighi/luogo'>${content.filename}</cms:link>" data-element="live-category-link">${value.Name}</a>
						</h3>
						<p ${rdfa.Abstract} class="card-text text-secondary pb-3">${value.Abstract}</p>
						<a class="read-more t-primary text-uppercase" href="<cms:link detailPage='/eventi/luoghi/luogo'>${content.filename}</cms:link>" aria-label="Leggi di più sulla pagina di ${value.Name}" data-focus-mouse="false">
							<span class="text"><fmt:message key="label.readmore"/></span>
							<span class="visually-hidden"></span>
							<svg class="icon icon-primary icon-xs ml-10">
								<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-right</cms:link>"></use>
							</svg>
						</a>
					</div>
				</div>
			</div>
		</div>

	</cms:bundle>

</cms:formatter>