class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player
    else
      redirect_to new_player_path
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :surname, :email, :team)
  end
end
