
const photoSelect = () => {
  const buttons = document.querySelectorAll('.slider-btn')
  if(buttons) {
    buttons.forEach ((btn) => {
      btn.addEventListener('click', (e) => {
        setTimeout(function () {
        const activeSlide = document.querySelector('.glide__slide--active > img');
        if (activeSlide) {
          const input = document.querySelector('#card_template');
          input.value = activeSlide.dataset.name;
        }
    }, 500);
      })
    })
  }
}

export {photoSelect};


