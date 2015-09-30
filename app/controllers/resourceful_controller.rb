class ResourcefulController < ApplicationController

  attr_accessor :resource

  before_action :build_empty_resource, only: :new
  before_action :build_resource, only: :create
  before_action :load_resource, only: %i[show edit destroy update]
  before_action :authorize_resource, except: :index

  def create
    resource.save!
  end

  def new; end
  def edit; end
  def show; end

  def destroy
    resource.destroy!
  end

  def update
    resource.update! extract_params
  end

  private

  abstract_method :permitted_params

  def authorize_resource
    authorize resource
  end

  def load_resource
    @resource = resource_scope.find params[:id]
  end

  def extract_params
    params
      .require(resource_key)
      .permit(*permitted_params)
  end

  def resource_root
    resource_model.name.underscore.to_sym
  end

  def build_empty_resource
    @resource = resource_scope.new
  end

  def build_resource
    @resource = resource_scope.new extract_params
  end

  def resource_model_name
    self.class.name.match(/(\S+)Controller/)[1].singularize
  end

  def resource_model
    resource_model_name.constantize
  end

  def resource_key
    resource_model_name.underscore
  end

  def resource_scope
    resource_model
  end

end
