class ApplicationController < ActionController::Base

  include Pundit
  include DeviseCustomizations

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private

  def self.ensure_policy_application
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index
  end

  def for_action action
    if params[:action] == action
      yield
    end
  end

end
