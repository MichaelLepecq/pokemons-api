FactoryBot.define do
    factory :pokemon do
        name { "Bulbasaur" }
        first_type { "Grass" }
        second_type { "Poison" }
        total { 318 }
        hp { 45 }
        attack { 49 }
        defense { 49 }
        speed_attack { 65 }
        speed_defense { 65 }
        speed { 45 }
        generation { 1 }
        legendary { false }
    end
end