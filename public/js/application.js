function login() {
  $("span.loginerrors").html('')
  parameters = {
    user_name: $("form.login input[name='user_name']").val(),
    password: $("form.login input[name='password']").val()
  }

  $.post("/users/login", parameters, function(response) {
    if(response.successful) {
      $("header").html(response.content);
    } else {
      $("span.loginerrors").html(response.content);
    }
  });
}

function signup() {
  parameters = {
    user_name: $("form.signup input[name='user_name']").val(),
    email: $("form.signup input[name='email']").val(),
    password: $("form.signup input[name='password']").val()
  }

  $.post("/users", parameters, function(response) {
    $("span.signuperrors").html(response.content);
  });
}

function like(id) {
  $.post("/images/"+id+"/like", {},
    function(response) {
      $("#content").html(response);
    });
}

function dislike(id) {
  $.post("/images/"+id+"/dislike", {},
    function(response) {
      $("#content").html(response);
    });
}
