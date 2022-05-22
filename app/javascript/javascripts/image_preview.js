document.addEventListener('DOMContentLoaded', () => {
  function previewImage(e) {
      const file = e.target.files[0];
      const reader  = new FileReader();
      reader.onloadend = function () {
          const preview = document.querySelector("#preview")
          if(preview) {
              preview.src = reader.result;
          }
      }
      if (file) {
          reader.readAsDataURL(file);
      }
  }

  const cookingMemoryImage = document.getElementById('js-cooking-memory-image');

  cookingMemoryImage.addEventListener('change', (e) => {
    previewImage(e);
  })
});