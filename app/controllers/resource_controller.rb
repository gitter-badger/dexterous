class ResourceController < ApplicationController

    before_filter :authenticate_user!
    before_filter :load_resource, only: [:update, :destroy, :show]

    def create
        if model_class.creatable_by? current_user
            @model = model_class.new extract_params
            @model.save!
            render json: @model
        else
            head :not_acceptable
        end
    rescue
        render json: @model.errors.full_messages
    end

    def show
        if @model.viewable_by? current_user
            render json: @model
        else
            head :not_found
        end
    end

    def update
        if @model.editable_by? current_user
            @model.update! extract_params
            render json: @model
        else
            head :not_found
        end
    rescue
        render json: @model.errors.full_messages, status: :not_acceptable
    end

    def destroy
        if @model.deletable_by? current_user
            @model.destroy!
            head :ok
        else
            head :not_found
        end
    rescue
        render json: @model.errors.full_messages, status: not_acceptable
    end

    private

    def extract_params
        params.require model_name.to_sym
    end

    def model_class
        self.class.name[0..-11].singularize.constantize
    end

    def load_resource
        @model = model_class.find params[:id]
        head :not_found if @model.nil?
    end

    def model_name
        self.class.name[0..-11].singularize.underscore.downcase
    end

    def load_track
        mname = :"#{model_name}"
        if params[mname].nil? or params[mname][:track_id].nil?
                head :not_found
                return
        end
        @track = Track.find params[mname][:track_id]
        head :not_found if @track.nil?
    end

end
