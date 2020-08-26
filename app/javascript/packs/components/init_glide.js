import Glide from '@glidejs/glide'

const initGlide = () => {
  const canGlide = document.querySelector('.glide');

  if (canGlide) {
    const startPt  = document.querySelectorAll('.glide__slide').length < 2 ? 0 : -1;
    const config = {
      type: 'carousel',
      startAt: startPt,
      focusAt: 'center',
      SlidesToShow: 1,
      SlidesToScroll: 1,
      draggable: true,
    }
    new Glide('.glide', config).mount();
  }
}

export { initGlide };
