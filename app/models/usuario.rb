class Usuario < ActiveRecord::Base
	has_many :mensajes, dependent: :destroy
	before_save { self.email = email.downcase }
	validates :nombre, presence: true, length: { maximum: 50 }
	VALIDA_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/
	validates :email, presence: true, format: { with: VALIDA_EMAIL },
					  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }

	def Usuario.new_token_recuerdo
      SecureRandom.urlsafe_base64
  	end

  	def Usuario.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
  	end

  	def muro
  		Mensaje.where("usuario_id = ?", id)
    end

private

    def create_token_recuerdo
      self.token_recuerdo = Usuario.digest(Usuario.new_token_recuerdo)
    end
end

