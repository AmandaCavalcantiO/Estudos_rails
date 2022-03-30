class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

before_action :usuario_logado
  def current_user
    Usuario.find(session[:usuario_id]) if !!session[:usuario_id]
  end

  def usuario_logado
    if !current_user
      flash[:alert] = "Você precisa estar logado."
      redirect_to root_url

    end
  end

end
