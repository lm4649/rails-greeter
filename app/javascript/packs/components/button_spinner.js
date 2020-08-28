
const buttonSpinner = () => {
  const buttons = document.querySelectorAll('.heavy-upload')
  if(buttons) {
    buttons.forEach ((btn) => {
      btn.addEventListener('click', (e) => {
       const classes = e.currentTarget.classList
       const iterator = classes.values();
       let string = ""
       for(let value of iterator) {
         string += value + ' ';
       }
        // e.currentTarget.innerHTML = "<i class='fas fa-spinner fa-pulse'></i>"
        e.currentTarget.insertAdjacentHTML("afterEnd", `<button class='${string}' disabled> <i class='fas fa-spinner fa-pulse'></i></button>`)
        e.currentTarget.classList.add("d-none");
      })
    })
  }
}

export {buttonSpinner};
// <i class="fas fa-spinner fa-pulse"></i>
