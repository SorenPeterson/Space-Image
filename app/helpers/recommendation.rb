def generate_similarities
  User.all.each do |other_user|
    calculated_similarity = current_user.liked_images.count - (current_user.liked_images - other_user.liked_images).count
    calculated_similarity += current_user.disliked_images.count - (current_user.disliked_images - other_user.disliked_images).count
    calculated_similarity -= current_user.liked_images.count - (current_user.liked_images - other_user.disliked_images).count
    calculated_similarity -= current_user.disliked_images.count - (current_user.liked_images - other_user.disliked_images).count

    new_sim = Similarity.create(first_user_id: current_user.id, second_user_id: other_user.id, calculated_similarity: calculated_similarity)

    # unless new_sim.persisted?
    #   Similarity.where(<<-SQL
    #   (first_user_id = #{self.first_user_id}
    #       AND second_user_id = #{self.second_user_id})
    #   OR (first_user_id = #{self.second_user_id}
    #       AND second_user_id = #{self.first_user_id})
    #   SQL
    #   ).first.update_attributes(calculated_similarity: calculated_similarity)
    # end
  end
end

def get_recommendation
  possible_images = []
  if logged_in?
    possible_images = current_user.recommended_images
    possible_images = ((possible_images) - (current_user.images.to_a))
    possible_images = Image.all.shuffle if possible_images.empty?
    possible_images = ((possible_images) - (current_user.images.to_a))
    @image = possible_images.first
  else
    possible_images = Image.all.shuffle
    @image = possible_images.first
  end
end

def get_random_recommendation
  possible_images = []
  if logged_in?
    possible_images = Image.all.shuffle
    @image = ((possible_images) - (current_user.images.to_a)).first
  else
    possible_images = Image.all.shuffle
    @image = possible_images.first
  end
end
