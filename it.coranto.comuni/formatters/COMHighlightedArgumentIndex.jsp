<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="col-sm-6 col-lg-4">
		<div class="it-grid-item-wrapper it-grid-item-overlay">
			<a href="<cms:link detailPage='/argomenti/argomento/'>${content.filename}</cms:link>" data-focus-mouse="false">
				<c:if test="${not empty value.Image.value.Image}">
					<div class="img-responsive-wrapper">
						<div class="img-responsive">
							<div class="img-wrapper">
								<img src="${value.Image.value.Image}" alt="$fn:escapeXml({value.Image.value.Description)}" title="${fn:escapeXml(value.Image.value.Title)}">                                                           
							</div>
						</div>
					</div>
				</c:if>
				<div class="it-griditem-text-wrapper">
					<h3>${value.Title}</h3>
				</div>
			</a>
		</div>
	</div>

</cms:formatter>