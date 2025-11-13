<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header class="it-header-wrapper" data-bs-target="#header-nav-wrapper">
	<c:if test="${cms.isEditMode}">
		<c:set var="containerStyle" value="style= 'min-width:202px;'" />
	</c:if>

	<fmt:setLocale value="it" />
	<cms:bundle basename="it.coranto.comuni.messages">

		<div class="it-header-slim-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="it-header-slim-wrapper-content">
							<div ${containerStyle}>
								<cms:container name="linkheader" type="linkheader" maxElements="1"/>
							</div>
							<div class="it-header-slim-right-zone" role="navigation">		
								<div ${containerStyle}>
									<cms:container name="rightzone" type="rightzone" maxElements="1"/>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="it-nav-wrapper">
			<div class="it-header-center-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="it-header-center-content-wrapper">

								<div ${containerStyle}><cms:container tagClass="it-brand-wrapper" name="headercard" type="headercard" maxElements="1"/></div>

								<div class="it-right-zone">
									<div ${containerStyle}><cms:container name="social" type="social" maxElements="1"/></div>

									<div class="it-search-wrapper">
										<span class="d-none d-md-block"><fmt:message key="label.search"/></span>
										<button class="search-link rounded-icon" type="button" data-bs-toggle="modal" data-bs-target="#search-modal" aria-label="Cerca nel sito">
											<svg class="icon">
												<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
											</svg>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="it-header-navbar-wrapper" id="header-nav-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="navbar navbar-expand-lg has-megamenu">
								<button class="custom-navbar-toggler" type="button" aria-controls="nav4" aria-expanded="false"
										aria-label="Mostra/Nascondi la navigazione" data-bs-target="#nav4" data-bs-toggle="navbarcollapsible">
									<svg class="icon">
										<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-burger</cms:link>"></use>
									</svg>
								</button>
								<div class="navbar-collapsable" id="nav4">
									<div class="overlay" style="display: none;"></div>
									<div class="close-div">
										<button class="btn close-menu" type="button">
											<span class="visually-hidden">Nascondi la navigazione</span>
											<svg class="icon">
												<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-close-big</cms:link>"></use>
											</svg>
										</button>
									</div>
									<div class="menu-wrapper">
										<cms:container tagClass="d-lg-none" name="headercardmobile" type="headercardmobile" maxElements="1"/>
										<nav aria-label="Principale">
											<c:set var="navStartLevel" value="0" />
											<cms:navigation type="treeForFolder" startLevel="${navStartLevel}" endLevel="0" var="nav" />

											<ul class="navbar-nav" data-element="main-navigation">
												<c:forEach items="${nav.items}" var="elem">
													<c:set var="elemName" value="${elem.resourceName}" />
													<c:set var="exactActive" value="${nav.isActive[elem.resourceName]}" />
													<li class="nav-item">
														<a class="nav-link ${exactActive ? 'active' : ''}"
														   href="<cms:link>${elem.resourceName}</cms:link>"
														   title="Vai alla pagina: ${fn:escapeXml(elem.navText)}"
														   data-focus-mouse="false">
															${elem.navText}
														</a>
													</li>
												</c:forEach>
											</ul>
										</nav>


										<nav aria-label="Secondaria">
											<div ${containerStyle}>
												<cms:container name="secondarylist" type="secondarylist" maxElements="1"/>
											</div>										
										</nav>
										<cms:container tagClass="it-socials" name="socialmobile" type="socialmobile" maxElements="1"/>
									</div> <!-- fine menu-wrapper -->
								</div> <!-- fine navbar-collapsable -->
							</div> <!-- fine navbar -->
						</div>
					</div>
				</div>
			</div>
		</div>

	</cms:bundle>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			let currentPath = window.location.pathname;
			if (!currentPath.endsWith('/')) currentPath += '/';

			const navLinks = document.querySelectorAll('nav[aria-label="Principale"] ul.navbar-nav a.nav-link');

			navLinks.forEach(link => {
				let href = link.getAttribute('href');
				let url;

				try {
					url = new URL(href, window.location.origin);
				} catch (e) {
					url = null;
				}

				if (url) {
					let linkPath = url.pathname;
					if (!linkPath.endsWith('/')) linkPath += '/';


					if (currentPath.startsWith(linkPath)) {
						link.classList.add('active');
					} else {

						if (!link.classList.contains('active')) {
							link.classList.remove('active');
						}
					}
				}
			});
		});
	</script>
</header>
