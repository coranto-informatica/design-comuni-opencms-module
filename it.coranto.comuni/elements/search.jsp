<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal fade search-modal" id="search-modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content perfect-scrollbar">
			<div class="modal-body">
				<form action="<cms:link>/risultati-ricerca/</cms:link>" method="post">
					<div class="container">
						<div class="row variable-gutters">
							<div class="col">
								<div class="modal-title">
									<button class="search-link d-md-none" type="button" data-bs-toggle="modal" data-bs-target="#search-modal" aria-label="Chiudi e torna alla pagina precedente">
										<svg class="icon icon-md">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-arrow-left</cms:link>"></use>
										</svg>
									</button>
									<h2>Cerca</h2>
									<button class="search-link d-none d-md-block" type="button" data-bs-toggle="modal" data-bs-target="#search-modal" aria-label="Chiudi e torna alla pagina precedente">
										<svg class="icon icon-md">
											<use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-close-big</cms:link>"></use>
										</svg>
									</button>
								</div>
								<div class="form-group autocomplete-wrapper">
									<label for="autocomplete-two" class="visually-hidden">Cerca nel sito</label>
									<input type="search" class="autocomplete ps-5" placeholder="Cerca nel sito" id="autocomplete-two" name="autocomplete-two" data-bs-autocomplete="[]">
									<span class="autocomplete-icon" aria-hidden="true">
										<svg class="icon"><use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use></svg>
									</span>
									<button type="submit" class="btn btn-primary">
										<span class="">Cerca</span>
									</button>
								</div>
							</div> 
						</div>
						<div class="row variable-gutters">
							<div class="col-lg-5">
								<div class="searches-list-wrapper">
									<cms:container tagClass="link-list-wrapper" name="usefullinkssearch" type="usefullinkssearch" maxElements="1"/>
								</div> 
							</div>
						</div> 
					</div> 
				</form>
			</div> 
		</div> 
	</div> 
</div> 
