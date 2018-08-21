class User < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    before_save { self.email = email.downcase }
    
    validates :username, presence: true, uniqueness: {case_sensitive: false}, 
               length: {minimum:3, maximum:25 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 50 },
               format: { with: VALID_EMAIL_REGEX }

has_secure_password
    validates :password, length: { minimum: 8, maximum: 15 }, allow_nil: true
end 