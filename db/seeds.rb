require 'csv'

pokemon_data = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv = CSV.parse(pokemon_data, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Pokemon.new
  p.name = row['Name']
  p.first_type = row['Type 1']
  p.second_type = row['Type 2']
  p.total = row['Total']
  p.hp = row['HP']
  p.attack = row['Attack']
  p.defense = row['Defense']
  p.speed_attack = row['Sp. Atk']
  p.speed_defense = row['Sp. Def']
  p.speed = row['Speed']
  p.generation = row['Generation']
  p.legendary = row['Legendary']
  p.save!
end