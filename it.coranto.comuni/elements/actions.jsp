<div class="dropdown d-inline">
  <button aria-label="vedi azioni da compiere sulla pagina" class="btn btn-dropdown dropdown-toggle text-decoration-underline d-inline-flex align-items-center fs-0" type="button" id="viewActions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <svg class="icon" aria-hidden="true">
      <use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-more-items</cms:link>"></use>
    </svg>
    <small>Vedi azioni</small>
  </button>
  <div class="dropdown-menu shadow-lg" aria-labelledby="viewActions">
    <div class="link-list-wrapper">
      <ul class="link-list" role="menu">
        <li role="none">
          <a class="list-item" href="#" onclick="window.print();return false;" title="Stampa" role="menuitem">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-print</cms:link>"></use>
            </svg>
            <span>Stampa</span>
          </a>
        </li>
        <li role="none">
          <a class="list-item" id="sendMail" href="#" title="Invia" role="menuitem">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="<cms:link>../assets/bootstrap-italia/dist/svg/sprites.svg#it-mail</cms:link>"></use>
            </svg>
            <span>Invia</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const sendMail = document.getElementById("sendMail");

    if (sendMail) {
      const url = document.location.href;
      const title = document.title;
      const mailtoLink = "mailto:?subject=" + encodeURIComponent(title) + "&body=" + encodeURIComponent(url);

      sendMail.setAttribute("href", mailtoLink);
    }
  });
</script>

