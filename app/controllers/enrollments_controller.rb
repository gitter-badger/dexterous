class EnrollmentsController < ApplicationController
    before_filter :authenticate_user!

    def index
        render json: current_user.enrollments.to_json(
            include: [
                :achievements, {
                    track: {
                        include: [:milestones]
                    }
                }])
    end
end
