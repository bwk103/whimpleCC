class FixturesController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @fixtures = Fixture.all.order('match_start')
  end

  def new
    @fixture = Fixture.new
  end

  def create
    @fixture = Fixture.new(fixture_params)
    if @fixture.save
      redirect_to fixtures_url
    else
      redirect_to new_fixture_url
    end
  end

  def edit
    @fixture = Fixture.find(params[:id])
  end

  def update
    @fixture = Fixture.find(params[:id])
    if @fixture.update_attributes(fixture_params)
      flash[:notice] = 'Fixture updated successfully'
      redirect_to fixtures_url
    else
      flash.now[:alert] = @fixture.errors.full_messages
      render :edit
    end
  end

  private

  def fixture_params
    p params
    params.require(:fixture).permit(:opponent, :location, :match_start)
  end
end
