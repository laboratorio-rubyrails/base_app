class PaginasEstaticasController < ApplicationController
  
  def inicio
    if inicio_sesion?
      @mensaje = usuario_actual.mensajes.build
      @items_muro = usuario_actual.muro.paginate(page: params[:page])
    end
  end

  def ayuda
  end

  def acercade
  end

  def prueba
  end

  def contacto
  end
end
