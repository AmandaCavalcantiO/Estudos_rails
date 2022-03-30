class UsuariosController < ApplicationController

  skip_before_action :usuario_logado, only:[:new, :create]
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
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

    if @usuario.update(usuario_params) && current_user.present?
      redirect_to @usuario
    else
      redirect_to root_url
    end
  end


  def show
    @usuario = Usuario.find(params[:id])
  end

  def index
    @usuario = Usuario.all
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    redirect_to usuario_path
  end

  private
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :senha)
    end

end
