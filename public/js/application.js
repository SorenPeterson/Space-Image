$(document).ready(function() {
  $("div.login").click(function() {
    $("span.loginerrors").html('')
    parameters = {
      user_name: $("form.login input[name='user_name']").val(),
      password: $("form.login input[name='password']").val()
    }

    $.post("/users/login", parameters, function(response) {
      $("span.loginerrors").html(response);
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
