<%@page
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"
	buffer="none"
	%>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>${cms.title}</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="${cms.vfs.propertySearch[cms.requestContext.uri]['Description']}">

<link rel="stylesheet" href="<cms:link>/system/modules/it.coranto.comuni/assets/bootstrap-italia/dist/css/bootstrap-italia.min.css</cms:link>">
<link href="<cms:link>/system/modules/it.coranto.comuni/assets/css/bootstrap-italia-comuni.css</cms:link>" rel="stylesheet">
<link href="<cms:link>/system/modules/it.coranto.comuni/resources/css/main.css</cms:link>" rel="stylesheet">
<link
	  rel="stylesheet"
	  href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
	  integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
	  crossorigin=""
	  >
<link rel="stylesheet" href="<cms:link>/system/modules/it.coranto.comuni/resources/css/map.css</cms:link>">

<link rel="icon" href="<cms:link>/favicon.ico</cms:link>" type="image/x-icon">
<link rel="icon" type="image/png" sizes="192x192" href="<cms:link>/icons/web-app-manifest-192x192.png</cms:link>">
<link rel="icon" type="image/png" sizes="512x512" href="<cms:link>/icons/web-app-manifest-512x512.png</cms:link>">
<link rel="apple-touch-icon" sizes="180x180" href="<cms:link>/icons/apple-touch-icon.png</cms:link>">
<link rel="manifest" href="<cms:link>/manifest.json</cms:link>">


<cms:enable-ade />