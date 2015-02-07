# Display an image specially selected for user
get '/images' do
  begin
    @image = Image.all.sample # Magically find an image
    erb :'images/view_image'
  rescue
    'there are no images in the database'
  end
end

# Page to upload new image
get '/images/new' do
  erb :'images/new_image'
end

# Add image to the database
post '/images' do
  imagedata = Cloudinary::Uploader.upload(params[:file][:tempfile], cloud_name: 'dtxam53uz', api_key: '652441437488924', api_secret: 'qNuJk5DfocBDd52B0emcCK_EDUo')
  image = Image.create(link: imagedata["url"])
  redirect "/images/#{image.id}"
end

# View a particular image
get '/images/:id' do
  @image = Image.find(params[:id])
  erb :'images/view_image'
end

# Edit page for a particular image
get '/images/:id/edit' do
end

post 'images/:id/like' do

end

post 'images/:id/dislike' do

end

# Update an image
put '/images/:id' do
end

# Delete a image
delete '/images/:id' do
end