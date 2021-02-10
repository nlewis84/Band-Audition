class AuditionsController < ApplicationController
    skip_before_action :has_access, only: [:new, :create]

    def new
        @audition = Audition.new
    end

    def show
        @audition = Audition.find(params[:id])
    end

    def create
        @audition = Audition.create(audition_params)  
        current_user.auditions << @audition
        redirect_to audition_path(@audition)      
    end

    private

    def audition_params
        params.require(:audition).permit(:school, :year)
    end
end