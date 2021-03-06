// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('packs/social-share-button.js.erb')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers"


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initBanner} from './components/banner';
import { initGlide } from './components/init_glide';
import { simpleTrigger } from './components/init_sweetalert';
import { photoSelect } from './components/template';
import { songSelector } from './components/song_selector';
import { updateTitlePreview } from './components/title_preview';
import { polaroidExpand } from './components/polaroid_expand';
import { updateUploadBtn } from './components/update_upload_btn';
import { buttonSpinner } from './components/button_spinner';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const swalContrib = document.getElementById('sweet-alert-contribution');
  if (swalContrib){
    simpleTrigger('#sweet-alert-contribution', {
  title: 'Thanks for contributing',
  text: 'You will be redirected to the card preview',
  icon: 'success'
});
  }

// sweet alert for successful share link copy
  simpleTrigger('#sweet-share', {
      title: "Link copied",
      text: "share it with your relatives so as they contribute to the card",
      icon: "success"
    });

  // sweet alert : send email successful
  simpleTrigger('#sweet-mail', {
      title: "Someone has been greeted!",
      text: "Your card has been sent to your friend and the contributors who left an e-mail",
      icon: "success"
    });

  photoSelect();
  initGlide();
  updateTitlePreview();
  polaroidExpand();
  updateUploadBtn();
  songSelector();
  initBanner();
  buttonSpinner();

});

