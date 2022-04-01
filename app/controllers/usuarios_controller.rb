class UsuariosController < ApplicationController
  skip_before_action :usuario_logado, only:[:new, :create]
  before_filter :set_usuario, except:[:new, :create, :index]

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
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @usuario = Usuario.all
  end

  def destroy
    @usuario.destroy
    redirect_to usuario_path
  end

  private
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :senha)
    end

    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
end
