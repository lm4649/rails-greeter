
// const photoSelect = () => {
//   const templates = document.querySelectorAll('.template');
//   if (templates) {
//     templates.forEach((template) => {
//       template.addEventListener('click', (event) => {
//         const input = document.querySelector('#card_template')
//         input.value = event.currentTarget.dataset.name
//         templates.forEach((img) => {
//           img.classList.remove('template-border')
//         })
//         event.currentTarget.classList.add('template-border');
//         const chosenTemplate = document.querySelector('#chosen-image');
//         chosenTemplate.src = event.currentTarget.src
//       })
//     })
//   }
// }

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
          // console.log(activeSlide.dataset.name);
          // const chosenTemplate = document.querySelector('#chosen-image');
          // chosenTemplate.src = activeSlide.src
        }
    }, 500);
      })
    })
  }
}

export {photoSelect};


