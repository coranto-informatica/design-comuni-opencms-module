<%@page
	pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"
	buffer="none"
	%>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="it" />
<cms:bundle basename="it.coranto.comuni.messages">


	<div class="bg-primary">
		<div class="container">
			<div class="row d-flex justify-content-center bg-primary">
				<div class="col-12 col-lg-6">
					<div class="cmp-rating pt-lg-80 pb-lg-80" id="rating">
						<div class="card shadow card-wrapper" data-element="feedback">
							<div class="cmp-rating__card-first">
								<div class="card-header border-0">
									<h2 class="title-medium-2-semi-bold mb-0" data-element="feedback-title">
										<fmt:message key="label.rating.question"/>
									</h2>
								</div>
								<div class="card-body">
									<fieldset class="rating">
										<legend class="visually-hidden">
											<fmt:message key="label.rating.legend"/>
										</legend>
										<input type="radio" id="star5a" name="ratingA" value="5">
										<label class="full rating-star active" for="star5a" data-element="feedback-rate-5">
											<svg class="icon icon-sm" role="img" aria-labelledby="first-star" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
												<path d="M12 1.7L9.5 9.2H1.6L8 13.9l-2.4 7.6 6.4-4.7 6.4 4.7-2.4-7.6 6.4-4.7h-7.9L12 1.7z"/>
												<path fill="none" d="M0 0h24v24H0z"/>
											</svg>
											<span class="visually-hidden" id="first-star"><fmt:message key="label.rating.star5"/></span>
										</label>
										<input type="radio" id="star4a" name="ratingA" value="4">
										<label class="full rating-star active" for="star4a" data-element="feedback-rate-4">
											<svg class="icon icon-sm" role="img" aria-labelledby="second-star" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
												<path d="M12 1.7L9.5 9.2H1.6L8 13.9l-2.4 7.6 6.4-4.7 6.4 4.7-2.4-7.6 6.4-4.7h-7.9L12 1.7z"/>
												<path fill="none" d="M0 0h24v24H0z"/>
											</svg>
											<span class="visually-hidden" id="second-star"><fmt:message key="label.rating.star4"/></span>
										</label>
										<input type="radio" id="star3a" name="ratingA" value="3">
										<label class="full rating-star active" for="star3a" data-element="feedback-rate-3">
											<svg class="icon icon-sm" role="img" aria-labelledby="third-star" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
												<path d="M12 1.7L9.5 9.2H1.6L8 13.9l-2.4 7.6 6.4-4.7 6.4 4.7-2.4-7.6 6.4-4.7h-7.9L12 1.7z"/>
												<path fill="none" d="M0 0h24v24H0z"/>
											</svg>
											<span class="visually-hidden" id="third-star"><fmt:message key="label.rating.star3"/></span>
										</label>
										<input type="radio" id="star2a" name="ratingA" value="2">
										<label class="full rating-star active" for="star2a" data-element="feedback-rate-2">
											<svg class="icon icon-sm" role="img" aria-labelledby="fourth-star" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
												<path d="M12 1.7L9.5 9.2H1.6L8 13.9l-2.4 7.6 6.4-4.7 6.4 4.7-2.4-7.6 6.4-4.7h-7.9L12 1.7z"/>
												<path fill="none" d="M0 0h24v24H0z"/>
											</svg>
											<span class="visually-hidden" id="fourth-star"><fmt:message key="label.rating.star2"/></span>
										</label>
										<input type="radio" id="star1a" name="ratingA" value="1">
										<label class="full rating-star active" for="star1a" data-element="feedback-rate-1">
											<svg class="icon icon-sm" role="img" aria-labelledby="fifth-star" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
												<path d="M12 1.7L9.5 9.2H1.6L8 13.9l-2.4 7.6 6.4-4.7 6.4 4.7-2.4-7.6 6.4-4.7h-7.9L12 1.7z"/>
												<path fill="none" d="M0 0h24v24H0z"/>
											</svg>
											<span class="visually-hidden" id="fifth-star"><fmt:message key="label.rating.star1"/></span>
										</label>
									</fieldset>
								</div>
							</div>
							<div class="cmp-rating__card-second d-none" data-step="3">
								<div class="card-header border-0 mb-0">
									<h2 class="title-medium-2-bold mb-0" id="rating-feedback">
										<fmt:message key="label.rating.thanks"/>
									</h2>
								</div>
							</div>
							<div class="form-rating d-none">
								<div class="d-none" data-step="1">
									<div class="cmp-steps-rating">
										<fieldset class="fieldset-rating-one d-none" data-element="feedback-rating-positive">
											<legend class="iscrizioni-header w-100">
												<h3 class="step-title d-flex flex-column flex-lg-row align-items-lg-center justify-content-between drop-shadow">
													<span class="d-block text-wrap" data-element="feedback-rating-question">
														<fmt:message key="label.rating.positive.question"/>
													</span>
													<span class="step"><fmt:message key="label.rating.step1"/></span>
												</h3>
											</legend>
											<div class="cmp-steps-rating__body">
												<div class="cmp-radio-list">
													<div class="card card-teaser shadow-rating">
														<div class="card-body">
															<div class="form-check m-0">
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating1" type="radio" id="radio-1">
																	<label for="radio-1" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.positive.option1"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating1" type="radio" id="radio-2">
																	<label for="radio-2" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.positive.option2"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating1" type="radio" id="radio-3">
																	<label for="radio-3" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.positive.option3"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating1" type="radio" id="radio-4">
																	<label for="radio-4" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.positive.option4"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating1" type="radio" id="radio-5">
																	<label for="radio-4" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.positive.option5"/>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</fieldset>
										<fieldset class="fieldset-rating-two d-none" data-element="feedback-rating-negative">
											<legend class="iscrizioni-header w-100">
												<h3 class="step-title d-flex flex-column flex-lg-row flex-wrap align-items-lg-center justify-content-between drop-shadow">
													<span class="d-block text-wrap" data-element="feedback-rating-question">
														<fmt:message key="label.rating.negative.question"/>
													</span>
													<span class="step"><fmt:message key="label.rating.step1"/></span>
												</h3>
											</legend>
											<div class="cmp-steps-rating__body">
												<div class="cmp-radio-list">
													<div class="card card-teaser shadow-rating">
														<div class="card-body">
															<div class="form-check m-0">
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating2" type="radio" id="radio-6">
																	<label for="radio-6" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.negative.option1"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating2" type="radio" id="radio-7">
																	<label for="radio-7" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.negative.option2"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating2" type="radio" id="radio-8">
																	<label for="radio-8" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.negative.option3"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating2" type="radio" id="radio-9">
																	<label for="radio-9" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.negative.option4"/>
																	</label>
																</div>
																<div class="radio-body border-bottom border-light cmp-radio-list__item">
																	<input name="rating2" type="radio" id="radio-10">
																	<label for="radio-10" class="active" data-element="feedback-rating-answer">
																		<fmt:message key="label.rating.negative.option5"/>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</fieldset>
									</div>
								</div>
								<div class="d-none" data-step="2">
									<div class="cmp-steps-rating">
										<fieldset>
											<legend class="iscrizioni-header w-100">
												<h3 class="step-title d-flex flex-column flex-lg-row flex-wrap align-items-lg-center justify-content-between drop-shadow">
													<span class="d-block text-wrap">
														<fmt:message key="label.rating.details.question"/>
													</span>
													<span class="step"><fmt:message key="label.rating.step2"/></span>
												</h3>
											</legend>
											<div class="cmp-steps-rating__body">
												<div class="form-group">
													<label for="formGroupExampleInputWithHelp" class="">
														<fmt:message key="label.rating.details.label"/>
													</label>
													<input type="text" class="form-control" id="formGroupExampleInputWithHelp" aria-describedby="formGroupExampleInputWithHelpDescription" maxlength="200" data-element="feedback-input-text">
													<small id="formGroupExampleInputWithHelpDescription" class="form-text">
														<fmt:message key="label.rating.details.help"/>
													</small>
												</div>
											</div>
										</fieldset>
									</div>
								</div>
								<div class="d-flex flex-nowrap pt-4 w-100 justify-content-center button-shadow">
									<button class="btn btn-outline-primary fw-bold me-4 btn-back" type="button">
										<fmt:message key="label.button.back"/>
									</button>
									<button class="btn btn-primary fw-bold btn-next" type="button">
										<fmt:message key="label.button.next"/>
									</button>
								</div>
							</div>
						</div>
					</div>        
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="%(link.strong:/system/modules/it.coranto.comuni/elements/useful-link.jsp:2cc4c5ae-5280-11f0-880d-1b1fd91899eb)" %>

</cms:bundle>
