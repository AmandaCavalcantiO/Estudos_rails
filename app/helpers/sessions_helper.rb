module SessionsHelper

  def login(usuario)
    session[:usuario_id] = @usuario.id
  end

  def usuario_ativo

    @usuario_ativo ||= Usuario.find_by(id: session[:usuario_id])

  end

  def bloquear_acesso
    if @usuario_ativo.present?

      redirect_to usuario_path(@usuario_ativo.id)
    else
      render 'new'
    end
  end

  def sair
    session.delete(:usuario_id)
      @usuario_ativo = nil
  end

end
