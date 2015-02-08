class User < ActiveRecord::Base
  include BCrypt

  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :likes
  has_many :images, through: :likes

  has_many :first_similarities, class_name: 'Similarity', foreign_key: :first_user_id
  has_many :second_similarities, class_name: 'Similarity', foreign_key: :second_user_id

  def similar_users
    ordered_simils = self.first_similarities + self.second_similarities
    ordered_simils.sort! { |first_simil, second_simil|
      first_simil.calculated_similarity <=> second_simil.calculated_similarity
    }
    simil_users = ordered_simils.map { |similarity|
      first_user = User.find(similarity.first_user_id)
      second_user = User.find(similarity.second_user_id)
      first_user.id == self.id ? second_user : first_user
    }
  end

  def recommended_images
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
