def create
  @user = User.new(params[:user_name])
  @user.password = params[:password]
  @user.save!
end

def login
  @user = User.find_by(user_name: params[:user_name])
  if !@user.is_a?(User)
    @incorrect_login = true
  elsif @user.password == params[:password]
    session[:session_id] = Session.create(user_id: @user.id).id
  else
    @incorrect_login = true
  end
end

def forgot_password
  @user = User.find_by_email(params[:email])
  random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  @user.password = random_password
  @user.save!
  Mailer.create_and_deliver_password_change(@user, random_password)
end

def logged_in?
  false
end