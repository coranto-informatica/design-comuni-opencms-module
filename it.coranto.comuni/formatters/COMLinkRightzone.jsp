<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

	<div class="it-header-slim-right-zone" role="navigation">
		<a class="btn btn-primary btn-icon btn-full" href="<cms:link>${value.Link}</cms:link>" title="Vai alla pagina: Area personale" data-element="personal-area-login" target="${value.LinkTarget}">
			<span class="rounded-icon" aria-hidden="true">
				<svg class="icon icon-primary">
					<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-user</cms:link>"></use>
				</svg>
			</span>
			<span class="d-none d-lg-block">${value.LinkTitle}</span>
		</a>
	</div>

</cms:formatter>