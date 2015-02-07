# get '/users' do
# end

# Page to create a new user
get '/users/new' do
  @errors = {}
  erb :'users/new_user'
end

# Authenticate and update the session / Return errors
post '/users/login' do
  # Handle when the user does not exist
  @incorrect_login = false
  login
  content_type :json
  return {
    successful: false,
    content: (erb :'users/incorrect_login', layout: false)
  }.to_json if @incorrect_login == true
  return {
    successful: true,
    content: (erb :header, layout: false)
  }.to_json
end

get '/users/logout' do
  session.delete(:this_id)
  redirect '/images'
end

# Create and add user to the database
post '/users' do
  # Handle bad information
  mismatched_passwords = params[:password] != params[:password_confirm]
  begin
    create
  rescue
  end
  content_type :json
  if @user.persisted? && !mismatched_passwords
    "Welcome, #{@user.user_name}"
  else
    erb :'users/signup_errors', layout: false
  end
end

# View a particular user
get '/users/:id' do

end

# Edit page for a particular user
get '/users/:id/edit' do

end

# Update a users preferences
put '/users/:id' do

end

# Delete a user
delete '/users/:id' do

end