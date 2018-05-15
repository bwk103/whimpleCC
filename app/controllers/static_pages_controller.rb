class StaticPagesController < ApplicationController
  def home
    @fixture = Fixture.first
  end

  def contact
  end

  def history
  end

  def ground
  end

  private 

  # def next_fixture
  #   fixtures = Fixture.all
  #   current_time = Time.new
  #   p fixtures
  #   future_fixtures = fixtures.select { |fixture| fixture.time > current_time }
  #   return future_fixtures.sort_by! { |fixture| fixture.time }[0]
  # end
end
