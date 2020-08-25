
const polaroidExpand = ()=> {
  const expand = document.querySelectorAll('.polaroid_container');
    if (expand){
      expand.forEach((polaroid) =>{
      polaroid.addEventListener('click', (event) => {
       event.currentTarget.element.classList.toggle(".expand");

        })

      })

    })
  }

// creer une fonction
// export dans le fichier polaroid
// import dans application JS
// call fucntion


// dans la fonction

// query selector - polaroid_container
// addEventListener - click - eleemetn selectionne
// toggle la class expand in polaroid_container pour expand et reduire polaroid_container
export { polaroidExpand };
