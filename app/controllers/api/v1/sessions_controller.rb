module Api
    module V1
        class SessionsController < ApplicationController
            skip_before_action :has_access, only: [:new, :create, :welcome, :omniauth]
            # skip_before_action :restricted, only: [:destroy]

            # def welcome
            # end

            # def new
            #     @user = User.new
            # end

            def omniauth
                @user = User.create_by_google_omniauth(auth)
                session[:user_id] = @user.id
                redirect_to user_auditions_path(@user)
            end
            
            def create
                @user = User.find_by(username: params[:user][:username])
                if @user.try(:authenticate, params[:user][:password])
                    session[:user_id] = @user.id        
                    exp = Time.now.to_i + 3600
                    exp_payload = { :data => JSON.parse(@user.to_json), :exp => exp }
                    token = JWT.encode(exp_payload, ENV['JWT_SECRET_KEY'])
                    response.headers['token'] = token
                    render json: @user
                    # redirect_to user_auditions_path(@user)
                else
                    flash[:error] = "Sorry, login info was incorrect. Please try again."
                    redirect_to login_path
                end
            end    

            # def destroy
            #     session.delete(:user_id)
            #     redirect_to '/'
            # end

            private
            
            def auth
                request.env['omniauth.auth']
            end
        end
    end
end
