class SessionsController < ApplicationController
    skip_before_action :has_access, only: [:new, :create, :welcome]

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_auditions_path(@user)
        else
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end    

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end
