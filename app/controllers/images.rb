# Display an image specially selected for user
get '/images' do
  image_id = Image.all.first.sample # Magically find an image
  redirect 'images/#{image_id}'
end

# Page to upload new image
get '/images/new' do
end

# Add image to the database
post '/images' do
  # redirect to new image
end

# View a particular image
get '/images/:id' do
end

# Edit page for a particular image
get '/images/:id/edit' do
end

# Update a image
put '/images/:id' do
end

# Delete a image
delete '/images/:id' do
end