class SponsorsController < ApplicationController

  def index
    @sponsors = Sponsor.all
  end

  def new
    @sponsor = Sponsor.new
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      redirect_to @sponsor
    else
      redirect_to sponsors_url
    end
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update_attributes(sponsor_params)
      redirect_to @sponsor
    else
      redirect_to edit_sponsor_url(@sponsor)
    end
  end

  def destroy
    Sponsor.find(params[:id]).destroy
    redirect_to sponsors_url
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :website, :email, :phone, :address)
  end
end
