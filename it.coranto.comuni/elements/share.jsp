<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="dropdown d-inline">
	<button aria-label="Condividi sui social" class="btn btn-dropdown dropdown-toggle text-decoration-underline d-inline-flex align-items-center fs-0" type="button" id="shareActions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true" data-focus-mouse="false">
		<svg class="icon" aria-hidden="true">
			<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-share</cms:link>"></use>
		</svg>
		<small>Condividi</small>
	</button>
	<div class="dropdown-menu shadow-lg" aria-labelledby="shareActions">
		<div class="link-list-wrapper">
			<ul class="link-list" role="menu">
				<li role="none">
					<a class="list-item" href="#" role="menuitem">
						<svg class="icon" aria-hidden="true">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-facebook</cms:link>"></use>
						</svg>
						<span>Facebook</span>
					</a>
				</li>
				<li role="none">
					<a class="list-item" href="#" role="menuitem">
						<svg class="icon" aria-hidden="true">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-twitter</cms:link>"></use>
						</svg>
						<span>Twitter</span>
					</a>
				</li>
				<li role="none">
					<a class="list-item" href="#" role="menuitem">
						<svg class="icon" aria-hidden="true">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-linkedin</cms:link>"></use>
						</svg>
						<span>Linkedin</span>
					</a>
				</li>
				<li role="none">
					<a class="list-item" href="#" role="menuitem">
						<svg class="icon" aria-hidden="true">
							<use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-whatsapp</cms:link>"></use>
						</svg>
						<span>Whatsapp</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
	const socialLinks = document.querySelectorAll(".dropdown-menu .list-item");

	socialLinks.forEach(link => {
		link.addEventListener("click", function (e) {
			const socialName = this.querySelector("span").textContent.toLowerCase();

			if (["facebook", "twitter", "linkedin", "whatsapp"].includes(socialName)) {
				e.preventDefault();
				shareOnSocialMedia(socialName);
			}
		});
	});

	function shareOnSocialMedia(platform, url = "", title = "") {
		if (url === "") url = document.location.href;
		if (title === "") title = document.title;

		const shareUrls = {
			facebook: "https://www.facebook.com/sharer.php?u=" + encodeURIComponent(url) + "&t=" + encodeURIComponent(title),
			twitter: "https://twitter.com/share?url=" + encodeURIComponent(url) + "&text=" + encodeURIComponent(title),
			linkedin: "https://www.linkedin.com/shareArticle?mini=true&url=" + encodeURIComponent(url) + "&title=" + encodeURIComponent(title),
			whatsapp: "https://api.whatsapp.com/send?text=" + encodeURIComponent(url)
		};

		if (shareUrls[platform]) {
			window.open(shareUrls[platform], "_blank", "width=600,height=400");
		}
	}
});
</script>











