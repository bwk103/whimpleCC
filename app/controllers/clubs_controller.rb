class ClubsController < ApplicationController

  def index
  end

  def new
    @club = Club.new()
  end

  def create
    @club = Club.new(club_params)
    p @club
    if @club.save
      redirect_to clubs_url
    else
      redirect_to root_url
      p @club.errors
    end
  end


  private

  def club_params
    params.require(:club).permit(:name, :ground, :lat, :lng )
  end
end
