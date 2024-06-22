document.addEventListener('DOMContentLoaded', function() {
  const dateFields = document.querySelectorAll('[type="datetime-local"][readonly]');

  dateFields.forEach(field => {
    field.addEventListener('click', function() {
      this.removeAttribute('readonly');
      this.showPicker();
    });

    field.addEventListener('blur', function() {
      this.setAttribute('readonly', true);
    });
  });
});