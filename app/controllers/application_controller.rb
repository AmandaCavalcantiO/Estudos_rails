class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :usuario_logado

  def current_user
    Usuario.find(session[:usuario_id]) unless session[:usuario_id]
  end

  def usuario_logado
    return unless current_user

    flash[:alert] = "Você precisa estar logado."
    redirect_to root_url
  end
end
