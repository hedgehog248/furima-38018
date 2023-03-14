document.addEventListener('DOMContentLoaded', function () {
  const postForm = document.getElementById('new_post');
  const previewList = document.getElementById('previews');
  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  fileField.addEventListener('change', function (e) {
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
  });
});
