require 'rails_helper'

RSpec.describe Player, type: :model do

  before(:each) do
    player = new Player(
      first_name: 'James',
      surname: 'Anderson',
      email: 'jimmy@whimplecc.com',
      team: 'first'
    )
  end

end
