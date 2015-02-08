def generate_similarities

end

def get_recommendation
  if logged_in?
    @image = current_user.recommended_images.first || Image.all.sample
  else
    @image = Image.all.sample
  end
end