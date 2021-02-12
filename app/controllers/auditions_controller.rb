class AuditionsController < ApplicationController

    def index
        if params[:user_id]
            @auditions = User.find(params[:user_id]).auditions
        else
            @auditions = Audition.all
        end
    end

    def new
        @audition = Audition.new
        11.times { @audition.instruments.build }
    end

    def edit
        @audition = Audition.find(params[:id])
        4.times { @audition.instruments.build }
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
        redirect_to user_audition_path(current_user, @audition)      
    end

    def update
        @audition = Audition.find(params[:id])
        @audition.update(audition_params)
        redirect_to user_audition_path(current_user, @audition)
    end

    def join
        @audition = Audition.new
    end

    def code
        @audition = Audition.find_by(code: params[:audition][:code])
        @audition.users << current_user
        redirect_to user_auditions_path(current_user)
    end

    private

    def audition_params
        params.require(:audition).permit(:school, :year, instruments_attributes: [:id, :name, :available_spots])
    end

end