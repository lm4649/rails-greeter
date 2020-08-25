

const updateTitlePreview = ()=> {
  const titleInput = document.getElementById('card_title');
  if (titleInput){
    titleInput.addEventListener('input', (e) => {
      const titlePreview = document.getElementById('card-title-preview');
      titlePreview.innerText = titleInput.value;
    })
  }
}


export { updateTitlePreview };
