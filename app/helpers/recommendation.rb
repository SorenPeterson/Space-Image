def generate_similarities
  User.all.each do |other_user|
    calculated_similarity =

    new_sim = Similarity.create(first_user_id: current_user.id, second_user_id: other_user.id, calculated_similarity: 10)

    unless new_sim.persisted?
      Similarity.where(<<-SQL
      (first_user_id = #{self.first_user_id}
          AND second_user_id = #{self.second_user_id})
      OR (first_user_id = #{self.second_user_id}
          AND second_user_id = #{self.first_user_id})
      SQL
      ).first.update_attributes(calculated_similarity: calculated_similarity)
    end
  end
end

def get_recommendation
  possible_images = []
  if logged_in?
    possible_images = current_user.recommended_images
    possible_images = Image.all.shuffle if possible_images.empty?
    @image = ((possible_images) - (current_user.images.to_a)).first
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
