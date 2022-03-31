class SessionsController < ApplicationController
  skip_before_action :usuario_logado

  def new
  end

  def create
    @usuario = Usuario.find_by_email(params[:session][:email])
    if @usuario && @usuario.senha == params[:session][:senha]
        session[:usuario_id] = @usuario.id
        redirect_to usuario_path(@usuario.id)
    else
        flash.alert = 'Usuário ou senha errados.'
        redirect_to root_url
    end
  end

  def destroy
    session.delete(:usuario_id)
    @usuario = nil
    redirect_to root_url
  end
end
