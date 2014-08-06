module UsuariosHelper

	#Implementación de la imagen de perfil, usando Gravatar
	def gravatar_de(usuario)
		gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: usuario.nombre, class: "gravatar_imagen")
	end
end
