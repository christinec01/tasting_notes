class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  has_secure_password
  validates :password, presence: true

  include BCrypt


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_digest = @password
  end

      # e.g., User.authenticate('jess@devbootcamp.com', 'apples123')
   def self.authenticate(input_email, input_password)
     # if email and password correspond to a valid user, return that user
     current_user = self.find_by(email: input_email)
     return current_user if current_user.password == input_password
     # otherwise, return nil
     nil
   end
end
