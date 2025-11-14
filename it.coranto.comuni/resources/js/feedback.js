let currentStep = 1;
const totalSteps = 2; 

const goToStep = (step) => {
  currentStep = step;

  document.querySelectorAll('.form-rating > [data-step]').forEach(el => {
    el.classList.add('d-none');
  });

  const currentEl = document.querySelector(`.form-rating > [data-step="${step}"]`);
  if (currentEl) {
    currentEl.classList.remove('d-none');
  }
};

const submitRating = () => {
  const feedbackElement = document.querySelector("#rating-feedback");
  if (!feedbackElement) return;

  feedbackElement.classList.remove("d-none");
  feedbackElement.innerText = "Invio in corso...";

  const star = document.querySelector('input[name="ratingA"]:checked')?.value;

  if (!star) {
    feedbackElement.innerText = "Per favore, valuta la pagina prima di continuare.";
    return;
  }

  const ratingGroup = parseInt(star) > 3 ? "rating1" : "rating2";
  const selectedRadio = document.querySelector(`input[name="${ratingGroup}"]:checked`);
  let radioResponse = "";

  if (selectedRadio) {
    const label = document.querySelector(`label[for="${selectedRadio.id}"]`);
    radioResponse = label ? label.innerText.trim() : "";
  }

  const freeText = document.querySelector("#formGroupExampleInputWithHelp")?.value || "";

  const payload = new URLSearchParams();
  payload.append("rating", star);
  payload.append("feedback", radioResponse);
  payload.append("details", freeText);

  fetch("/system/modules/it.coranto.comuni/elements/email/email.jsp", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: payload.toString(),
  })
    .then((response) => {
      if (!response.ok) throw new Error("Errore nella risposta");
      return response.json();
    })
    .then((data) => {
      if (data.status === "ok") {
        feedbackElement.innerText = "Grazie, il tuo parere ci aiuterà a migliorare il servizio!";
      } else {
        feedbackElement.innerText = "Ops, qualcosa è andato storto.";
      }
    })
    .catch((err) => {
      console.error("Errore nel submit:", err);
      feedbackElement.innerText = "Ops, qualcosa è andato storto.";
    });
};

document.addEventListener("DOMContentLoaded", () => {
  const nextBtn = document.querySelector(".btn-next");
  const backBtn = document.querySelector(".btn-back");

  goToStep(currentStep);

  if (nextBtn) {
    nextBtn.addEventListener("click", (e) => {
      e.preventDefault();
      if (currentStep < totalSteps) {
        goToStep(currentStep + 1);
      } else {
        submitRating();
      }
    });
  }

  if (backBtn) {
    backBtn.addEventListener("click", (e) => {
      e.preventDefault();
      if (currentStep > 1) {
        goToStep(currentStep - 1);
      }
    });
  }

  document.querySelector("#rating")?.addEventListener("submit", e => e.preventDefault());
});
