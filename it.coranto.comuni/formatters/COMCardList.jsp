<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="container py-5">
		<h2 class="title-xxlarge mb-4">${value.Title}</h2>
		<div class="row g-4">
			<c:forEach var="card" items="${content.valueList.Card}" varStatus="status">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="cmp-card-simple card-wrapper pb-0 rounded border border-light">
						<div class="card shadow-sm rounded">
							<div class="card-body">
								<a href="<cms:link>${card.value.Link.value.Link}</cms:link>" title="Vai alla pagina: ${fn:escapeXml(card.value.Title)}" class="text-decoration-none" data-element="management-category-link" data-focus-mouse="false">
									<h3 class="card-title t-primary">${card.value.Title}</h3>
								</a>
								<p class="text-secondary mb-0">${card.value.Abstract}</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</cms:formatter>