ben = Player.create!(first_name: 'James',
                     surname: 'Smith',
                     email: 'james@test.com',
                     team: 1,
                     role: 'Batsman',
                     bio: 'Twee bespoke cred, post-ironic scenester craft beer pug selvage disrupt. La croix small batch next level, skateboard organic etsy poke tilde lo-fi iPhone ramps affogato bitters. Man braid readymade schlitz tacos PBR&B, sartorial fanny pack neutra raclette roof party church-key. Pop-up truffaut gentrify letterpress seitan, celiac meditation squid sriracha gastropub. Man bun pabst meditation tacos raw denim. Chicharrones pitchfork sustainable whatever williamsburg, vape hell of green juice la croix sartorial selvage mixtape fashion axe tofu etsy. Offal intelligentsia banjo four loko.                     ')
bruce = Player.create!(first_name: 'Bruce',
                       surname: 'Adams',
                       email: 'bruce@test.com',
                       team: 1,
                       role: 'All-Rounder',
                       bio: 'Butcher fashion axe readymade meggings salvia paleo viral cronut photo booth unicorn PBR&B vexillologist tofu tote bag. Retro flexitarian ramps post-ironic bespoke. Tumeric four dollar toast butcher small batch. Tattooed lyft sriracha typewriter messenger bag cold-pressed 8-bit hell of raclette slow-carb prism palo santo.                       ')
alan = Player.create!(first_name: 'Alan',
                      surname: 'Day',
                      email: 'alan@test.com',
                      team: 1,
                      role: 'Wicketkeeper',
                      bio: 'IPhone next level kogi la croix, keffiyeh adaptogen chillwave kombucha. Banjo snackwave ramps mustache godard.')
howard = Player.create!(first_name: 'Howard',
                        surname: 'Day',
                        email: 'howard@test.com',
                        team: 1,
                        role: 'Batsman',
                        bio: 'IPhone next level kogi la croix, keffiyeh adaptogen chillwave kombucha. Banjo snackwave ramps mustache godard.')
neil = Player.create!(first_name: 'Neil',
                      surname: 'Bolum',
                      email: 'neil@test.com',
                      team: 1,
                      role: 'Bowler',
                      bio: 'IPhone next level kogi la croix, keffiyeh adaptogen chillwave kombucha. Banjo snackwave ramps mustache godard.')
fixture1 = Fixture.create!(opponent: 'Exeter CC',
                           location: 'Knowle Cross',
                           match_start: DateTime.new(2018, 8, 12, 13, 0, 0))
fixture2 = Fixture.create!(opponent: 'Ottery St Mary CC',
                           location: 'Knowle Cross',
                           match_start: DateTime.new(2018, 8, 22, 13, 0, 0))
fixture2 = Fixture.create!(opponent: 'Honiton CC',
                           location: 'Knowle Cross',
                           match_start: DateTime.new(2018, 8, 30, 13, 0, 0))
event1 = Event.create!(name: 'Race Night',
                       date: DateTime.new(2018, 8, 30, 19, 0, 0),
                       location: 'Knowle Cross',
                       description: 'Butcher fashion axe readymade meggings salvia paleo viral cronut photo booth unicorn PBR&B vexillologist tofu tote bag. Retro flexitarian ramps post-ironic bespoke. Tumeric four dollar toast butcher small batch. Tattooed lyft sriracha typewriter messenger bag cold-pressed 8-bit hell of raclette slow-carb prism palo santo.')
event2 = Event.create!(name: 'Meat Bingo',
                       date: DateTime.new(2018, 8, 1, 19, 0, 0),
                       location: 'Knowle Cross',
                       description: 'Butcher fashion axe readymade meggings salvia paleo viral cronut photo booth unicorn PBR&B vexillologist tofu tote bag. Retro flexitarian ramps post-ironic bespoke. Tumeric four dollar toast butcher small batch. Tattooed lyft sriracha typewriter messenger bag cold-pressed 8-bit hell of raclette slow-carb prism palo santo.')
event3 = Event.create!(name: 'Awards Night',
                       date: DateTime.new(2018, 8, 10, 19, 0, 0),
                       location: 'Knowle Cross',
                       description: 'Butcher fashion axe readymade meggings salvia paleo viral cronut photo booth unicorn PBR&B vexillologist tofu tote bag. Retro flexitarian ramps post-ironic bespoke. Tumeric four dollar toast butcher small batch. Tattooed lyft sriracha typewriter messenger bag cold-pressed 8-bit hell of raclette slow-carb prism palo santo.')
