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


    private

    def fixture_params
        params.require(:fixture).permit(:opponent, :location, :match_start)
    end
end
