class Usuario < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :nombre, presence: true, length: { maximum: 50 }
	VALIDA_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/
	validates :email, presence: true, format: { with: VALIDA_EMAIL },
					  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }
end