#encoding: UTF-8
class UsuariosController < ApplicationController
  before_action :usuario_logueado, only: [:index, :edit, :update, :destroy]
  before_action :usuario_valido,   only: [:edit, :update]
  before_action :usuario_admin,    only: :destroy

  def index
    @usuarios = Usuario.paginate(page: params[:page])
  end

  def show
    @usuario = Usuario.find(params[:id])
    @mensajes = @usuario.mensajes.paginate(page: params[:page])
  end

  def new
  	@usuario = Usuario.new
  end

  def create
  	@usuario = Usuario.new(usuario_params)
  	if @usuario.save
      inicia_sesion @usuario
      flash[:success] = "Te has registrado con éxito: #{@usuario.nombre}!"
      redirect_to @usuario
  	else
  		render 'new'
  	end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado"
    redirect_to usuarios_url
  end
  
  private

  def usuario_params
  	params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
  end 

  #filtros

  def usuario_valido
    @usuario = Usuario.find(params[:id])
    redirect_to(root_url) unless usuario_actual?(@usuario)      
  end

  def usuario_admin
    redirect_to(root_url) unless usuario_actual.admin?
  end
end
