class Pokemon < ApplicationRecord
    ALLOWED_TYPES = ["Grass", "Fire", "Water", "Bug", "Normal", "Poison", "Electric", "Ground", "Fairy", "Fighting", "Psychic", "Rock", "Ghost", "Ice", "Dragon", "Dark", "Steel", "Flying"]
    validates :generation, numericality: { less_than_or_equal_to: 6,  only_integer: true }
    validates :first_type, inclusion: { in: ALLOWED_TYPES }
    validates :second_type, inclusion: { in: ALLOWED_TYPES }, allow_nil: true
    validates :name, :first_type, :total, :hp, :attack, :defense, :speed_attack, :speed_defense, :speed, :generation, presence: true
end
