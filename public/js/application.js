$(document).ready(function() {
  $("div.login").click(function() {
  //   $.ajax({
  //     url: "/users/login",
  //     type: "POST",
  //     success: function(response) {
  //       console.log(response.parse);
  //     }
  //   });
    $.post("/users/login", {}, update_header)
  });

  $("div.signup").click(function() {
    parameters = {
      user_name: $("form.signup input[name='user_name']").val(),
      email: $("form.signup input[name='email']").val()
    }
    $.post("/users", parameters, function(response) {
      $("div#content").html(response);
    });
    // console.log('lol');
  });
});

function update_header(header) {
  $("header").html(header)
}
