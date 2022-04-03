# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
@item_1 = @project.items.create!(name: "Anvil", cost: 200)
@item_2 = @project.items.create!(name: "Trampoline", cost: 800)

@acme = Manufacturer.create!(name: "ACME", location: "Toonville USA")
@offbrand = Manufacturer.create!(name: "Offbrand ACME", location: "Worseville USA")

@item_1.manufacturers << @acme
@item_2.manufacturers << @acme
@item_2.manufacturers << @offbrand
