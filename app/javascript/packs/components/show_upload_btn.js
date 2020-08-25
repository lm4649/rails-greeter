const showUploadBtn = () => {
  const uploadInput = document.getElementById('upload-photo');
  if(uploadInput){
    const uploadBtn = document.getElementById('upload-btn');
    uploadInput.addEventListener('input', (e) => {
      if(uploadInput.files.length > 0) uploadBtn.classList.remove('d-none');
    })
  }

};


export { showUploadBtn };
