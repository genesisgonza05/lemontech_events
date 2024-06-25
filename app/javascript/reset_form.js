document.addEventListener("DOMContentLoaded", () => {
  const resetButton = document.querySelector(".btn-reset");
  if (resetButton) {
    resetButton.addEventListener("click", (event) => {
      event.preventDefault();
      const form = document.querySelector(".search-box");
      form.reset();
      form.submit();
    });
  }
});
