def logged_in?
  session[:session_id] != nil
end