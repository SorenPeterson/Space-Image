class Similarity < ActiveRecord::Base
  validates :calculated_similarity, presence: true

  belongs_to :users, class_name: 'User'
end
