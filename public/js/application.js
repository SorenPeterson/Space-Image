$(document).ready(function() {
  $(".login").click(function() {
  //   $.ajax({
  //     url: "/users/login",
  //     type: "POST",
  //     success: function(response) {
  //       console.log(response.parse);
  //     }
  //   });
    $.post("/users/login", {}, update_header)
  });
});

function update_header(header) {
  $("header").html(header)
}
