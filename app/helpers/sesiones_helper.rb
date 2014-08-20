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

  def cerrar_sesion
    usuario_actual.update_attribute(:token_recuerdo, 
                                    Usuario.digest(Usuario.new_token_recuerdo))
    cookies.delete(:token_recuerdo)
    self.usuario_actual = nil
  end
end
