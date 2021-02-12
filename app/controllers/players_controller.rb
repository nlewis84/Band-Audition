class PlayersController < ApplicationController

    def new
        @player = Player.new
        @audition = Audition.find(params[:audition_id])
    end

    def show
        binding.pry
        @player = Player.find(params[:id])
        @audition = Audition.find(params[:audition_id])
    end

    def create
        binding.pry
        @player = Player.create(player_params)  
        @audition = Audition.find_by(id: params[:audition_id])
        @audition.players << @player
        @instrument = Instrument.find_by(id: params[:player][:instrument])
        @instrument.players << @player
        redirect_to audition_player_path(@audition, @player)
    end

    def edit
        @player = Player.find(params[:id])
        @audition = Audition.find_by(id: params[:audition_id])
    end

    def update
        @player = Player.find(params[:id])
        @audition = Audition.find_by(id: params[:audition_id])
        @player.update(player_params)
        redirect_to audition_player_path(@audition, @player)
    end

    def destroy
        Player.find(params[:id]).destroy
        redirect_to user_auditions_path(current_user)
    end

    private

    def player_params
        params.require(:player).permit(:first_name, :last_name, :virtual, :comment, :first_choice, :second_choice, :third_choice, :audition_id, :instrument_id)
    end
end
