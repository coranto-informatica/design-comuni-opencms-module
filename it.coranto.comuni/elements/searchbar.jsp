<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form method="post">
  <div class="container">
    <div class="form-group cmp-input-search-button mt-2 mb-4 mb-lg-50">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <svg class="icon icon-md">
              <use href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-search</cms:link>"></use>
            </svg>
          </div>
        </div>
        <label for="input-group-1" class="active">Con Etichetta</label>
        <c:choose>
          <c:when test="${not empty param.autocomplete}">
            <c:set var="query" value="${param.autocomplete}" />
          </c:when>
          <c:when test="${not empty param['autocomplete-two']}">
            <c:set var="query" value="${param['autocomplete-two']}" />
          </c:when>
          <c:otherwise>
            <c:set var="query" value="" />
          </c:otherwise>
        </c:choose>
        <input type="search" 
               class="form-control" 
               id="input-group-1" 
               name="autocomplete" 
               placeholder="${empty query ? 'Cerca una parola chiave' : query}" 
               data-focus-mouse="false" />
      </div>
      <button type="submit" class="btn btn-primary" data-focus-mouse="false">
        Cerca
      </button>
    </div>
  </div>
</form>
