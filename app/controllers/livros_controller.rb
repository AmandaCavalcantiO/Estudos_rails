class LivrosController < ApplicationController

 before_filter :set_livro, :set_usuario, except: [:new, :create]
  def new
    @usuario = Usuario.find(params[:usuario_id])

  end

  def create

    @usuario = Usuario.find(params[:usuario_id])

    @livro = @usuario.livros.create(livros_params)
    #@livro.save

    redirect_to usuario_path(@usuario)
  end

  def edit
  #  @usuario = Usuario.find(params[:usuario_id])
  end

  def update
  #  @usuario = Usuario.find(params[:usuario_id])
    @livro.update(livros_params)
    redirect_to @usuario
  end

  def destroy
  #  @usuario = Usuario.find(params[:usuario_id])
    @livro.delete
    redirect_to @usuario
  end

  private
    def livros_params
      params.require(:livro).permit(:autor, :nome)
    end

    def set_livro
      @livro = Livro.find_by(id: params[:id], usuario_id: params[:usuario_id])
    end

    def set_usuario
      @usuario = Usuario.find(params[:usuario_id])
    end
end
