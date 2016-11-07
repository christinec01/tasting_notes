// $(document).on('click', ".submit-button", function(event) {
//   event.preventDefault();
//   console.log("success!");
//   var data = $('.picture-data').val();
//   var name = $('.picture-data').attr('name'); //q
//   $.ajax({
//     url: '/search',
//     method:'get',
//     data: {[name]: data},
//   })
//   .done(function(response){
//     console.log(response)
//   })
// });

$(document).on("ajax:success", function(e, data, status, xhr){
  console.log(data);
  // var imageURLs = (data.images.map(function(image) {
  //   return image.url;
  // }));
});
