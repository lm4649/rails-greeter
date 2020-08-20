import Glide from '@glidejs/glide'

const initGlide = () => {
  const canGlide = document.querySelectorAll('.glide');

  if (canGlide) {
    const config = {
      type: 'carousel',
      // focusAt: 'center'
      startAt: 0,
      perView: 4,
    }
    new Glide('.glide', config).mount();
  }
}

export { initGlide };
