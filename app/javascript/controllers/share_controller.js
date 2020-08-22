import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['link'];
  connect() {
    console.log(this.linkTarget.value);
  }

  copy(event) {

  }

}

<!-- TO DO : put it in a js file -->
<script>
  function myFunction() {
    /* Get the text field */
    var copyText = document.getElementById("myInput");

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /*For mobile devices*/

    /* Copy the text inside the text field */
    document.execCommand("copy");

    /* Alert the copied text */
    alert("share this link " + copyText.value);
  }
</script>
