<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content" val="value" rdfa="rdfa">


	<div class="container" id="main-container">
		<div class="row">
			<div class="col px-lg-4">
				<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/breadcrumb.jsp:336c29b7-45e1-11f0-ae97-1b1fd91899eb)"%>	
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 px-lg-4 py-lg-2">
				<h1 ${rdfa.Title}>${value.Title}</h1>
				<p ${rdfa.Abstract} data-audio>${value.Abstract}</p>
			</div>
		</div>
	</div>

</cms:formatter>