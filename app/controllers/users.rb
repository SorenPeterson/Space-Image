# get '/users' do
# end

# Page to create a new user
get '/users/new' do
  erb :'users/new_user'
end

# Authenticate and update the session / Return errors
post '/users/login' do
  # Handle when the user does not exist
  begin
    login
  rescue
    @incorrect_login = true
  end
  erb :header, layout: false
end

# Create and add user to the database
post '/users' do
  # Handle bad information
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