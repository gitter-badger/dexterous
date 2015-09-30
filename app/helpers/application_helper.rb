module ApplicationHelper


  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def home_path
    if user_signed_in? 
      dashboard_path
    else
      root_path
    end
  end

end
