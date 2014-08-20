#encoding: utf-8
class SesionesController < ApplicationController

	def new
	end

	def create	
	  	usuario = Usuario.find_by(email: params[:sesion][:email].downcase)
	  	if usuario && usuario.authenticate(params[:sesion][:password])
	  		inicia_sesion usuario
	  		redirect_to usuario
	  	else
	  		flash.now[:error] = "Revisa que tu email y contraseña sean correctos"
	  		render 'new'
	  	end
	end

	def destroy	
	  cerrar_sesion
	  redirect_to root_url	
	end
end
 