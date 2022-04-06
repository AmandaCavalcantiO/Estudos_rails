class LivrosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :set_usuario
  before_filter :set_livro, except: [:new, :create]

  def new
  end

  def create
    @livro = @usuario.livros.build(livros_params)
    upload if (params[:livro][:imagem])
    @livro.save
    redirect_to @usuario
  end

  def edit
  end

  def update
    binding.pry
    @livro.update(livros_params)
    @livro.update(imagem: upload ) if (params[:livro][:imagem])
    redirect_to @usuario
  end

  def show
  end

  def index
  end

  def upload
    uploaded_file = params[:livro][:imagem]
    nome_imagem = "#{DateTime.now.strftime("%Y%jT%H%MZ")}#{uploaded_file.original_filename}"
    File.open(Rails.root.join('app','assets', 'images', nome_imagem ), 'wb') do |file|
      file.write(uploaded_file.read)
    end
    @livro.imagem = nome_imagem
    return nome_imagem
  end

  def destroy
    @livro.destroy
    redirect_to @usuario
  end

  private
    def livros_params
      params.require(:livro).permit(:autor, :nome, :concluido, :imagem)
    end

    def set_livro
      @livro = Livro.find_by(id: params[:id], usuario_id: params[:usuario_id])
    end

    def set_usuario
      @usuario =  Usuario.find(params[:usuario_id])
    end
end
