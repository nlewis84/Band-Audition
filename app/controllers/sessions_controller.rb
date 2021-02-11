class SessionsController < ApplicationController
    skip_before_action :has_access, only: [:new, :create, :welcome]

    def welcome
    end

    def new
        @user = User.new
    end

    # NEW CREATE
    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
     
        session[:user_id] = @user.try(:id)
     
        redirect_to 'user_auditions_path(@user)'
    end
     
    # OLD CREATE
    # def create
    #     @user = User.find_by(username: params[:user][:username])
        
    #     if @user.try(:authenticate, params[:user][:password])
    #         session[:user_id] = @user.id
    #         redirect_to user_auditions_path(@user)
    #     else
    #         flash[:error] = "Sorry, login info was incorrect. Please try again."
    #         redirect_to login_path
    #     end
    # end    

    def destroy
        binding.pry
        session.delete(:user_id)
        redirect_to '/'
    end

    private
     
    def auth
        request.env['omniauth.auth']
    end
end
