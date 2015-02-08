def generate_similarities

end

def get_recommendation
  possible_images = []
  if logged_in?
    possible_images = current_user.recommended_images
    possible_images = Image.all.shuffle if possible_images.empty?
  else
    possible_images = Image.all.shuffle
  end
  @image = ((possible_images) - (current_user.images.to_a)).first
end