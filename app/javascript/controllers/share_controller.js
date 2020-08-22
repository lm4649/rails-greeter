import { Controller } from "stimulus";
import { simpleTrigger } from '../packs/components/init_sweetalert';

export default class extends Controller {
  static targets = ['link'];
  connect() {
    console.log(this.linkTarget.value); // debug
  }

  // copy the url in the clipboard
  copy(event) {
     /* Get the text field */
    var copyText = this.linkTarget;

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /*For mobile devices*/

    /* Copy the text inside the text field */
    document.execCommand("copy");

    /* Alert the copied text */
    // alert("share this link " + copyText.value);
      simpleTrigger('#sweet-share', {
  title: "Link copied",
  text: "share it with your relatives so as they contribute to the card",
  icon: "success"
});
  }

}
