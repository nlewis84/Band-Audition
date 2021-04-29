class PlayersController < ApplicationController
    skip_before_action :restricted

    def new
        @player = Player.new
        @audition = Audition.find(params[:audition_id])
    end

    def total
        @audition = Audition.find(params[:audition_id])
        @players = Player.belonging_to_current_audition(@audition).sorted_last_then_first
    end

    def show
        @player = Player.find(params[:id])
        @audition = Audition.find(params[:audition_id])
    end

    def create
        @player = Player.create(player_params)  
        @audition = Audition.find_by(id: params[:audition_id])
        @audition.players << @player
        @instrument = Instrument.find_by(id: params[:player][:instrument])
        @instrument.players << @player
        if @player.save
            redirect_to audition_player_path(@audition, @player)
        else
            render :new
        end
    end

    def edit
        @player = Player.find(params[:id])
        @audition = Audition.find_by(id: params[:audition_id])
    end

    def update
        @player = Player.find(params[:id])
        @audition = Audition.find_by(id: params[:audition_id])
        
        # this code should be looked at
        @instrument = Instrument.find_by(id: params[:player][:instrument])
        @instrument.players << @player
        
        # this code is fine
        @player.update(player_params)
        if @player.save
            redirect_to audition_player_path(@audition, @player)
        else
            render :edit
        end
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
