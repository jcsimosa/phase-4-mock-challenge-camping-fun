class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    
    def index 
        activities = Activity.all 
        render json:activities, status: :ok
    end
    def destroy 
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
        end
    end
    private
    def render_not_found_response(error)
        render json:{error: 'Activity not found'},status: :not_found
end

