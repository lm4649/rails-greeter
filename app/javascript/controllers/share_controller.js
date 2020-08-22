import { Controller } from "stimulus";

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
    event.currentTarget.title = "Link copied";

        /* Alert the copied text */
  // alert("share this link " + copyText.value);

  }

}
