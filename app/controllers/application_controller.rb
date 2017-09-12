class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_loclae_from_params

  private
  def set_loclae_from_params
    session[:locale] = params[:locale] if params[:locale].in?(%w(uk ru en be))
    session[:locale] ||= 'uk'
    I18n.locale = session[:locale]
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
