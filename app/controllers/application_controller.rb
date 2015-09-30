class ApplicationController < ActionController::Base

  include Pundit
  include PunditSupport
  include DeviseSupport

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def for_action action
    if params[:action] == action
      yield
    end
  end

end
