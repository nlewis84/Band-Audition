class InstrumentsController < ApplicationController
    skip_before_action :restricted

    def new
        @instrument = Instrument.new
        @instrument.audition_instruments.build
    end

    def edit
        @instrument = Instrument.find(params[:id])
        @audition = Audition.find(params[:audition_id])
    end

    def create
        @instrument = Instrument.create(instrument_params)  
        @audition = Audition.find_by(id: params[:instrument][:auditions])
        @audition.instruments << @instrument
        redirect_to user_audition_path(current_user, @audition)     
    end

    def update
        @instrument = Instrument.find(params[:id])
        @audition = Audition.find_by(id: params[:audition_id])
        if @instrument.update(instrument_params)
            redirect_to user_audition_path(current_user, @audition)
        else
            render :edit
        end
    end

    private

    def instrument_params
        params.require(:instrument).permit(:name, :available_spots, :audition_id, audition_instruments_attributes: [:id, :priority])
    end
end
