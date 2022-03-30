class SessionsController < ApplicationController

  skip_before_action :usuario_logado
  def new
  end

  def create

    @usuario = Usuario.find_by_email(params[:session][:email])

    if @usuario && @usuario.senha == params[:session][:senha]

        login(@usuario)

        usuario_ativo

        bloquear_acesso

    else
        flash.alert = 'Usuário ou senha errados.'
        render 'new'
    end



  end

  def destroy
    sair
    redirect_to root_url
  end


end
