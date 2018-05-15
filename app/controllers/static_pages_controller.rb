class StaticPagesController < ApplicationController
  def home
    @fixture = next_fixture
  end

  def contact
  end

  def history
  end

  def ground
  end

  private 

  def next_fixture
    fixtures = Fixture.all
    current_time = DateTime.now
    p current_time
    future_fixtures = fixtures.select { |fixture| fixture.match_start > current_time }
    return future_fixtures.sort_by! { |fixture| fixture.match_start }[0]
  end
end
