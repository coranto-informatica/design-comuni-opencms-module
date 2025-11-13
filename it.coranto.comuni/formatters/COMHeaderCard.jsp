<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

						<a href="<cms:link>${value.Link.value.Link}</cms:link>" data-focus-mouse="false">
									<svg width="82px" height="82px" class="icon" aria-hidden="true">
										<image style="object-fit: contain" xlink:href="<cms:link>${value.Image.value.Image}</cms:link>" width="100%" height="100%"/>
									</svg>
									<div class="it-brand-text">
										<div class="it-brand-title">${value.Title}</div>
										<div class="it-brand-tagline d-none d-md-block">${value.Abstract}</div>
									</div>
								</a>
	
</cms:formatter>