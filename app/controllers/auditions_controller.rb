class AuditionsController < ApplicationController

    def show
        @audition = Audition.find(params[:id])
    end
end
