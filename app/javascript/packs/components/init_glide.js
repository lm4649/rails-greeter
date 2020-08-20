import Glide from '@glidejs/glide'

const initGlide = () => {
  const canGlide = document.querySelectorAll('.glide');

  if (canGlide) {
    const config = {
      type: 'carousel',
      startAt: 0,
      perView: 4,
      focusAt: 'center'
    }
    new Glide('.glide', config).mount();
  }
}

export { initGlide };
