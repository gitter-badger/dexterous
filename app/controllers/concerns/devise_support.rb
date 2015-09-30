module DeviseSupport
  
  extend ActiveSupport::Concern
  
  def after_sign_in_path_for resource
    dashboard_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
  
end
