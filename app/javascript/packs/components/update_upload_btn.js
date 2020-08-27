const updateUploadBtn = () => {
  const uploadInput = document.getElementById('upload-photo');
  if(uploadInput){
    // const uploadBtn = document.getElementById('upload-btn');
    uploadInput.addEventListener('input', (e) => {
      if(uploadInput.files.length > 0) {
        // uploadBtn.classList.remove('d-none');
        const icon = document.querySelector('label i');
        icon.classList.remove('fa-camera');
        icon.classList.add('fa-check-circle');
        icon.classList.add('validation-color');
      }
      else {
        //dealing with corner cases
        const icon = document.querySelector('label i');
        if (!icon.classList.contains('fa-camera')) icon.classList.add('fa-camera');
        if (icon.classList.contains('fa-check-circle'))icon.classList.remove('fa-check-circle');
        if (icon.classList.contains('validation-color'))icon.classList.remove('validation-color');
      }
    })
  }

};


export { updateUploadBtn };
