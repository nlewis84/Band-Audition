module Api
    module V1
        class ApplicationController < ActionController::Base
            protect_from_forgery with: :null_session 
            respond_to? :json
            before_action :has_access, :restricted
            helper_method :current_user
          
            private
          
            def has_access
              # Use this for authorization eventually
              # redirect_to '/' unless logged_in?
              render json: { :message => "Unauthorized" }, status: 401 unless logged_in?
            end
          
            def restricted
              redirect_to user_auditions_path(current_user) if logged_in?
            end
          
            def logged_in?
              !!current_user
            end
          
            def current_user
              token = request.headers['token']
              if token.present?
                decoded = JWT.decode(token, ENV['JWT_SECRET_KEY'])
                user_id = decoded[0]['data']['id']
              else
                user_id = session[:user_id]
              end
              User.find_by(id: user_id)
            end
        end        
    end
  end