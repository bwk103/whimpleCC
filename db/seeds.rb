ben = Player.create!(first_name: 'Ben',
                     surname: 'Silk',
                     email: 'ben@test.com',
                     team: 1,
                     role: "Batsman",
                     bio: "This is a test bio")
leigh = Player.create!(first_name: 'Leigh',
                       surname: 'Lorenzen',
                       email: 'leigh@test.com',
                       team: 1,
                       role: "Bowler",
                       bio: "This is a test bio")
tom = Player.create!(first_name: 'Tom',
                     surname: 'Allan',
                     email: 'tom@test.com',
                     team: 1,
                     role: "Wicketkeeper",
                     bio: "This is a test bio")

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
