class AuditionsController < ApplicationController
    skip_before_action :restricted

    def index
        if params[:user_id]
            @auditions = User.find(params[:user_id]).auditions
        else
            @auditions = Audition.all
        end
        binding.pry
        render json: @auditions
    end

    # SEARCH FUNCTIONALITY
    # def search
    #     @auditions = Audition.where("school like ?", "%#{params[:q]}%")

    #     render :index
    # end

    def new
        @audition = Audition.new
        15.times { @audition.instruments.build }
    end

    def edit
        @audition = Audition.find(params[:id])
        15.times { @audition.instruments.build }
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
        @audition = Audition.new(audition_params) 
        if @audition.save 
            ## current_user.auditions.build
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
            redirect_to user_auditions_path(current_user)
        else
            flash[:error] = "Sorry, audition code was not valid. Please try again."
            redirect_to join_path
        end
    end

    private

    def audition_params
        params.require(:audition).permit(:audition, :school, :date, instruments_attributes: [:id, :name, :available_spots])
    end

end