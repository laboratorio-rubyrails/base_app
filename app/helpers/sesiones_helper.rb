#encoding: UTF-8
module SesionesHelper

  def inicia_sesion(usuario)
    token_recuerdo = Usuario.new_token_recuerdo
    cookies.permanent[:token_recuerdo] = token_recuerdo
    usuario.update_attribute(:token_recuerdo, Usuario.digest(token_recuerdo))
    self.usuario_actual = usuario
  end

  def inicio_sesion?
  	!usuario_actual.nil?
  end

  def usuario_actual=(usuario)
    @usuario_actual = usuario
  end

  def usuario_actual
  	token_recuerdo = Usuario.digest(cookies[:token_recuerdo])
    @usuario_actual ||= Usuario.find_by(token_recuerdo: token_recuerdo)
  end

  def usuario_actual?(usuario)
    usuario == usuario_actual
  end

  def usuario_logueado 
    unless inicio_sesion?
      guardar_ubicacion
      redirect_to iniciases_url, notice: "Por favor, inicia sesión"
    end
  end    

  def cerrar_sesion
    usuario_actual.update_attribute(:token_recuerdo, 
                                    Usuario.digest(Usuario.new_token_recuerdo))
    cookies.delete(:token_recuerdo)
    self.usuario_actual = nil
  end

  def redirige_antes(default)
    redirect_to(session[:anterior_a] || default)
    session.delete(:anterior_a)
  end

  def guardar_ubicacion
    session[:anterior_a] = request.url if request.get?
  end
end
