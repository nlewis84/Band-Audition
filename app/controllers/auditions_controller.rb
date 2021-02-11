class AuditionsController < ApplicationController
    skip_before_action :has_access, only: [:new, :create]

    def index
        if params[:user_id]
            @auditions = User.find(params[:user_id]).auditions
        else
            @auditions = Audition.all
        end
    end

    def new
        @audition = Audition.new
    end

    def show
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            if @user.nil?
                redirect_to user_path, flash[:error] = "User not found."
            else
                @audition = Audition.find(params[:id])
            end
        else
            @audition = Audition.find(params[:id])
        end
        
    end

    def create
        @audition = Audition.create(audition_params)  
        current_user.auditions << @audition
        redirect_to audition_path(@audition)      
    end

    def join
        @audition = current_user.auditions.new(audition_params)
     end

    def update
        binding.pry
        if @audition = Audition.find_by(code: params[:audition][:code])
            if !current_user.auditions.include?(@audition)
                current_user.auditions << @audition
            end
        else
            flash[:error] = "Sorry, join code was incorrect. Please try again."
            redirect_to join_path
        end
    end

    private

    def audition_params
        params.require(:audition).permit(:school, :year)
    end
end