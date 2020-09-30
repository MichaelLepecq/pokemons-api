class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :first_type 
      t.string :second_type
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :speed_attack
      t.integer :speed_defense
      t.integer :speed
      t.integer :generation
      t.boolean :legendary
      t.timestamps
    end
  end
end
