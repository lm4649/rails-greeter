const songSelector = () => {
  const templates = document.querySelectorAll('.template');
  if (templates) {
    templates.forEach((template) => {
      template.addEventListener('click', (event) => {
        const input = document.querySelector('#card_template')
        input.value = event.currentTarget.dataset.name
        templates.forEach((img) => {
          img.classList.remove('template-border')
        })
        event.currentTarget.classList.add('template-border');
        const chosenTemplate = document.querySelector('#chosen-image');
        chosenTemplate.src = event.currentTarget.src
      })
    })
  }
}

export {songSelector};
