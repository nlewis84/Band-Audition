module Api
    module V1
        class UsersController < ApplicationController
            skip_before_action :has_access, only: [:new, :create]
            skip_before_action :restricted, only: [:show, :index]

            def new
                @user = User.new
            end

            def index
                @users = User.all
                render json: @users
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to user_auditions_path(@user)
                else
                    render :new
                end
            end

            def show
                render json: current_user
                # redirect_to '/' if !@user
            end

            private

            def user_params
                params.require(:user).permit(:username, :password, :name)
            end

        end
    end
end
