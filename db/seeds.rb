require 'ap'
ap resources = Cloudinary::Api.resources(cloud_name: 'dtxam53uz', api_key: '652441437488924', api_secret: 'qNuJk5DfocBDd52B0emcCK_EDUo')
resources["resources"].each do |image_info|
  Image.create(link: image_info["url"])
end
ap resources = Cloudinary::Api.resources(cloud_name: 'dtxam53uz', api_key: '652441437488924', api_secret: 'qNuJk5DfocBDd52B0emcCK_EDUo', cursor: resources["next_cursor"])
resources["resources"].each do |image_info|
  Image.create(link: image_info["url"])
end