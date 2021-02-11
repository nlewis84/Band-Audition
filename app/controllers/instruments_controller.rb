class InstrumentsController < ApplicationController
    
    def new
        @instrument = Instrument.new
    end

    def create
        @instrument = Instrument.create(instrument_params)  
        @audition = Audition.find_by(id: params[:instrument][:auditions])
        @audition.instruments << @instrument
        redirect_to audition_path(@audition)      
    end

    private

    def instrument_params
        params.require(:instrument).permit(:name, :available_spots, :audition_id)
    end
end
