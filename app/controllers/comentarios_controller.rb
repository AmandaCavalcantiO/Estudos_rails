class ComentariosController < ApplicationController
  before_filter :set_usuario, :set_livro
  before_filter :set_comentario, except: [:new, :create]

  def create
    @comentario = @livro.comentarios.create(comentarios_params)
    render json: @comentario
  end

  def edit
  end

  def update
    @comentario.update(comentarios_params)
    redirect_to usuario_livro_path(@livro.id, usuario_id: @livro.usuario_id)
  end

  def destroy
    @comentario.destroy
    redirect_to usuario_livro_path(@livro.id, usuario_id: @livro.usuario_id)
  end

  private
    def comentarios_params
      params.require(:comentario).permit(:titulo, :conteudo)
    end

    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    def set_usuario
      @usuario = Usuario.find(params[:usuario_id])
    end

    def set_livro
      @livro = Livro.find(params[:livro_id])
    end
end
