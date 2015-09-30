module PunditSupport

  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  module ClassMethods
    def self.ensure_policy_application
      after_action :verify_authorized, except: :index
      after_action :verify_policy_scoped, only: :index
    end
  end

end
