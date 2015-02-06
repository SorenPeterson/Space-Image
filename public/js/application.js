$(document).ready(function() {
  $("div.login").click(function() {
    console.log('hello');
  //   $.ajax({
  //     url: "/users/login",
  //     type: "POST",
  //     success: function(response) {
  //       console.log(response.parse);
  //     }
  //   });
    $("span.loginerrors").html('')
    $.post("/users/login", {}, function(response) {
      $("span.loginerrors").html(response)
    });
  });

  $("div.signup").click(function() {
    console.log('hello');
    parameters = {
      user_name: $("form.signup input[name='user_name']").val(),
      email: $("form.signup input[name='email']").val()
    }
    $.post("/users", parameters, function(response) {
      $("div#content").html(response);
    });
  });
});
