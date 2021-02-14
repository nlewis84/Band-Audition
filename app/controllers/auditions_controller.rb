class AuditionsController < ApplicationController
    skip_before_action :restricted

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
        if @audition.save 
            current_user.auditions << @audition
            redirect_to user_audition_path(current_user, @audition)      
        else
            render :new
        end
    end

    def update
        @audition = Audition.find(params[:id])
        if @audition.update(audition_params)
            redirect_to user_audition_path(current_user, @audition)
        else
            render :edit
        end
    end

    def join
        @audition = Audition.new
    end

    def code
        if @audition = Audition.find_by(code: params[:audition][:code])
            @audition.users << current_user
            @audition.save
            redirect_to user_auditions_path(current_user)
        else
            flash[:error] = "Sorry, audition code was not valid. Please try again."
            redirect_to join_path
        end
    end

    private

    def audition_params
        params.require(:audition).permit(:school, :date, instruments_attributes: [:id, :name, :available_spots])
    end

end