class Mensaje < ActiveRecord::Base
	belongs_to :usuario
	default_scope -> { order('created_at DESC') }
	validates :contenido, presence: true, length: { maximum:250 }
	validates :usuario_id, presence: true
end





