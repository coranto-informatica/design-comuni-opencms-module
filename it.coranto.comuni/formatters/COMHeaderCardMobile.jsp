<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value">

						<a href="<cms:link>${value.Link.value.Link}</cms:link>" class="logo-hamburger" data-focus-mouse="false">
									<svg class="icon" aria-hidden="true">
										<image style="object-fit: contain" xlink:href="<cms:link>${value.Image.value.Image}</cms:link>" width="32" height="32"></image>
									</svg>
									<div class="it-brand-text">
										<div class="it-brand-title">${value.Title}</div>
									</div>
								</a>
	
</cms:formatter>