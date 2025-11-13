<%@page
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"
	buffer="none"
	%>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section class="useful-links-section">
	<div class="section section-muted p-0 py-5">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-lg-6">

					<div class="cmp-input-search">
						<form action="<cms:link>/risultati-ricerca/</cms:link>" method="post">
							<div class="form-group autocomplete-wrapper mb-2 mb-lg-4">
								<div class="input-group">
									<label for="autocomplete-autocomplete-three" class="visually-hidden">Cerca una parola chiave</label>
									<input type="search" class="autocomplete form-control"
										   placeholder="Cerca una parola chiave"
										   id="autocomplete-autocomplete-three"
										   name="autocomplete"
										   data-bs-autocomplete="[]">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit" id="button-3">Invio</button>
									</div>
									<span class="autocomplete-icon" aria-hidden="true">
										<svg class="icon icon-sm icon-primary">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
										</svg>
									</span>
								</div>
							</div>
						</form>

					</div>

					<!--usefullinks-->
					<cms:container tagClass="link-list-wrapper" name="usefullinks" type="usefullinks" maxElements="1"/>

				</div>
			</div>
		</div>
	</div>
</section>