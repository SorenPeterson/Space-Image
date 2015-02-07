class User < ActiveRecord::Base
  include BCrypt

  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
