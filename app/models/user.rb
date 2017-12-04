class User < ActiveRecord::Base
    
    has_secure_password
    has_one :apply
    before_save { self.email = email.downcase }
    
    validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness:  { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
    validates :password, :presence =>true, :confirmation =>true
    validates_confirmation_of :password
    
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end