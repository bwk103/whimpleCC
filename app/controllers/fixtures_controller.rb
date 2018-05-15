class FixturesController < ApplicationController

    def index
        @fixtures = Fixture.all.order('date')
    end
end
