# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@project_1 = Project.create!(name: 'Alpha Omega', manager: 'Luke P')
@project_2 = Project.create!(name: 'Infinity Gauntlet', manager: 'Thanos')

@manufacturer_1 = Manufacturer.create!(name: 'Metal Customs', location: 'London, UK')
@manufacturer_2 = Manufacturer.create!(name: 'Earls Fabrication', location: 'Peoria, GA')
@manufacturer_3 = Manufacturer.create!(name: 'Tech Center One', location: 'Oklahoma City, OK')
@manufacturer_4 = Manufacturer.create!(name: 'PNW Operators', location: 'Central City, CO')

@item_1 = @project_1.items.create!(name: 'Adamantium Tube', cost: 743)
@item_2 = @project_1.items.create!(name: 'Silver Stirrup', cost: 132)
@item_3 = @project_1.items.create!(name: 'Hex Coil', cost: 42)
@item_4 = @project_1.items.create!(name: 'Vaulted Strip', cost: 17)
@item_5 = @project_1.items.create!(name: 'Shoar Visor', cost: 85)
