#encoding: UTF-8

class MensajesController < ApplicationController
	before_action :usuario_logueado, only: [ :create, :destroy]
	before_action :usuario_mensajes,   only: :destroy

	def create
		@mensaje = usuario_actual.mensajes.build(mensaje_params)
		if @mensaje.save
			flash[:success] = "¡Mensaje creado!"
			redirect_to root_url
		else
			@items_muro = []
			render 'paginas_estaticas/inicio'
		end
	end
	
	def destroy
		@mensaje.destroy
		redirect_to root_url
	end


	private

	def mensaje_params
		params.require(:mensaje).permit(:contenido)
	end

	def usuario_mensajes
		@mensaje = usuario_actual.mensajes.find_by(id: params[:id])
		redirect_to root_url if @mensaje.nil?
	end
end
