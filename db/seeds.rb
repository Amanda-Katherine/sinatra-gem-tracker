# Add seed data here. Seed your database with `rake db:seed`
purple_plum = User.create(username: "purple_plum", password: "purple")
kitkat_attack = User.create(username: "kitkat_attack", password: "kitkat")
waterboy_123 = User.create(username: "Waterboy-123", password: "waterboy")

Gemstone.create(name: "Tux", description: "A Sinatra based gem that let's you to interact with built-in Sinatra methods, your views, as well as Rack CRUD actions, and other fun commands. All from your terminal!", user: purple_plum)
Gemstone.create(name: "pry", description: "IRB alternative and runtime developer console. Used in conjuction with binding.pry in the text editor.", user: purple_plum)

Gemstone.create(name: "Pry", description: "Better than IRB", user: kitkat_attack)

Gemstone.create(name: "Thin", description: "A thin and fast web server", user: waterboy_123)
Gemstone.create(name: "corneal", description: "Sets up your base project, file directory, etc for Sinatra based projects", user: waterboy_123)


