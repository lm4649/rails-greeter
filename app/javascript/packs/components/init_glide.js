import Glide from '@glidejs/glide'

const initGlide = () => {
  const canGlide = document.querySelectorAll('.glide');

  if (canGlide) {
    new Glide('.glide').mount();
  }
}

export { initGlide };
