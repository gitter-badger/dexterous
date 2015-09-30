class ResourcefulController < ApplicationController

  attr_accessor :resource

  before_action :build_resource, only: %i[new create]
  before_action :load_resource, only: %i[show edit destroy update]
  before_action :authorize_resource, except: [:index]

  def create
    resource.save!
  end

  def edit; end
  def show; end

  def destroy
    resource.destroy!
  end

  def update
    resource.update! extract_params
  end

  private

  abstract_method :resource_model
  abstract_method :permitted_params

  def authorize_resource
    authorize resource
  end

  def load_resource
    @resource = resource_model.find params[:id]
  end

  def extract_params
    params
      .require(resource_key)
      .permit(*permitted_params)
  end

  def resource_root
    resource_model.name.underscore.to_sym
  end

  def build_resource
    @resource = resource_model.new extract_params
  end

  def resource_model
    self.class.name.match(/(\S+)Controller/)[1].singularize.constantize
  end

end
