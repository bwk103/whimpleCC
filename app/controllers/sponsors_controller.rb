class SponsorsController < ApplicationController

  def index
    @sponsors = Sponsor.all
  end

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      redirect_to @sponsor
    else
      redirect_to sponsors_url
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :website, :email, :phone, :address)
  end
end
