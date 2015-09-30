class TracksController < ResourcefulController

  layout 'dashboard'
  alias_method :track, :resource
  ensure_policy_application

  before_action :authenticate_user!, except: [:show, :index]
  before_action :load_resource, only: %i[edit destroy update]

  def create
    super
    current_user.add_role :contributor, @track
    redirect_to controller: 'home', action: 'dashboard'
  end

  def show
    @resource = Track.includes(
      :learning_resources,
      :milestones => [:achievements]
    ).friendly.find params[:id]
    authorize resource
  end

  private

  def permitted_params
    %i[title description visibility]
  end

  def load_resource
    @resource = resource_model.friendly.find params[:id]
  end

end
