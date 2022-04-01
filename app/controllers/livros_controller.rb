class LivrosController < ApplicationController

  before_filter :set_usuario
  before_filter :set_livro, except: [:new, :create]

  def new
  end

  def create
    @livro = @usuario.livros.create(livros_params)
  end

  def edit
  end

  def update
    @livro.update(livros_params)
    redirect_to @usuario
  end

  def show
  end

  def destroy
    @livro.destroy
    redirect_to @usuario
  end

  private
    def livros_params
      params.require(:livro).permit(:autor, :nome, :concluido)
    end

    def set_livro
      @livro = Livro.find_by(id: params[:id], usuario_id: params[:usuario_id])
    end

    def set_usuario
      @usuario =  Usuario.find(params[:usuario_id])
    end
end
