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
    @filtro = params[:filtro]
    livro_por_pagina = 3
    @pagina = params.fetch(:pagina, 1).to_i

    if (@pagina == 1)
      inicio = 0
    else
      inicio =((@pagina - 1) * livro_por_pagina)
    end

    if (@filtro == "pendente")
      @livros_total = @usuario.livros.leitura_pendente
      @livros = @livros_total.offset(inicio).limit(livro_por_pagina)
    elsif (@filtro == "concluido")
      @livros_total = @usuario.livros.leitura_concluida
      @livros = @livros_total.offset(inicio).limit(livro_por_pagina)
    else
      @livros_total = @usuario.livros
      @livros = @livros_total.offset(inicio).limit(livro_por_pagina)
    end
    @livros_total_busca = @livros_total.count
    @total_paginas = (@livros_total_busca / livro_por_pagina.to_f).ceil

  end

  def index
    usuario_por_pagina = 3
    @total_paginas = Usuario.count / usuario_por_pagina
    @pagina = params.fetch(:pagina, 0).to_i
    @usuario = Usuario.offset(@pagina * usuario_por_pagina).limit(usuario_por_pagina)
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
