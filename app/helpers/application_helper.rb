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

  def track_tabs track, active_id
    tabs = [{
       id: :milestones,
       label: 'Milestones' ,
       to: track_milestones_path(track),
     }, {
       id: :participants,
       label: 'Participants',
       to: track_participants_path(track)
     }, {
       id: :settings,
       label: 'Settings',
       to: track_settings_path(track)
     }]

    tabs.map{|it| it[:active] = (it[:id] == active_id) ; it }
  end

end
