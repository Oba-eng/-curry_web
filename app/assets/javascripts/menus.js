$(function () {
  console.log('ページが完全に読み込まれました');

  window.previewImage = function(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $("#img_prev").attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  };

  $("#image-select-btn").change(function () {
    previewImage(this);
  });
});
