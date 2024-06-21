document.addEventListener('turbo:load', () => {
  setTimeout(() => {
    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach(flashMessage => {
      flashMessage.classList.remove('show');
      flashMessage.classList.add('fade');
    });
  }, 5000);
});
