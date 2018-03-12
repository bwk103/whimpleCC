class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player
    else
      redirect_to new_player_url
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      redirect_to @player
    else
      redirect_to edit_player_url(@player)
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to players_url
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :surname, :email, :team)
  end
end
