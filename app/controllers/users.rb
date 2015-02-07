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
    content: (erb :header)
  }.to_json
end

get '/users/logout' do
  session.delete(:this_id)
  redirect '/images'
end

# Create and add user to the database
post '/users' do
  @errors = {}
  # Handle bad information
  @errors[:mismatched_passwords] == true if params[:password] != params[:password_confirm]
  redirect "/users/"
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