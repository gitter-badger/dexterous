class TracksController < ResourcefulController

  layout 'dashboard'
  alias_method :track, :resource
  helper_method :track
  ensure_policy_application

  before_action :authenticate_user!, except: [:show, :index]

  def create
    super
    current_user.add_role :contributor, track
    redirect_to controller: 'home', action: 'dashboard'
  end

  private

  def permitted_params
    %i[title description visibility]
  end

  def load_resource
    @resource = resource_scope.friendly.find params[:id]
  end

  def resource_scope
    scope = super
    if params[:action] == :show
      scope.includes(:learning_resources, :milestones => [:achievements])
    else
      scope
    end
  end

end
