const updateUploadBtn = () => {
  const uploadInput = document.getElementById('upload-photo');
  if(uploadInput){
    // const uploadBtn = document.getElementById('upload-btn');
    uploadInput.addEventListener('input', (e) => {
      if(uploadInput.files.length > 0) {
        // uploadBtn.classList.remove('d-none');
        const icon = document.querySelector('label i');
        icon.classList.remove('fa-camera');
        // icon.classList.add('fa-check-circle');
        // icon.classList.add('validation-color');
      }
      else {
        //dealing with corner cases
        const icon = document.querySelector('label i');
        if (!icon.classList.contains('fa-camera')) icon.classList.add('fa-camera');
        // if (icon.classList.contains('fa-check-circle'))icon.classList.remove('fa-check-circle');
        // if (icon.classList.contains('validation-color'))icon.classList.remove('validation-color');
      }
    })

     // we add a listener to know when a new picture is uploaded
    uploadInput.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(uploadInput);
    })
  }

};

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
};


export { updateUploadBtn };
