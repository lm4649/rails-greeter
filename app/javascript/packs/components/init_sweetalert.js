import swal from 'sweetalert';

const simpleTrigger = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { simpleTrigger };
