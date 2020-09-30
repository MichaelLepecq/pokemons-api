require "rails_helper"

RSpec.describe PokemonsController, type: :controller do

    describe "index" do
      let!(:pokemons) { create_list(:pokemon, 10)}
      it "return the list of all pokemons" do 
        get :index 
        expect(JSON.parse(response.body)["meta"]["records"]).to eq 10     
      end
    end

    describe "show" do
        let(:pokemon) { create(:pokemon)}
        it "shows a pokemon" do 
            get :show, params: { id: pokemon.id }
            expect(JSON.parse(response.body)["name"]).to eq "Bulbasaur"   
        end
    end
    
    describe "create" do
        let(:valid_attributes) {
            { 
                name: "Bulbasaur", 
                first_type:  "Grass", 
                second_type: "Poison",
                total: 318,
                hp: 45,
                attack: 49,
                defense: 49,
                speed_attack: 65,
                speed_defense: 65,
                speed: 45,
                generation: 1,
                legendary: false
            } 
        }
        let(:invalid_attributes) { { name: "Bulbasaur" } }
        
        it "creates a new pokemon" do
            expect do
                post :create, params: valid_attributes
            end.to change { Pokemon.count }.by 1
        end

        it "doesn't create a new pokemon if missing attributes" do
            expect do
            post :create, params: invalid_attributes
            end.to change { Pokemon.count }.by 0
        end
    end

    describe "update" do
        let(:pokemon) { create(:pokemon)}

        it "updates a pokemon" do
            patch :update, params: { id: pokemon.id, name: 'New Name' }
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)["name"]).to eq "New Name"
        end

        it "doen't updates a pokemon if wrong attribute" do
            patch :update, params: { id: pokemon.id, first_type: 'Unknown type' }
            expect(response.status).to eq 422
        end
    end

    describe "destroy" do
        let!(:pokemon) { create(:pokemon)}

        it "destroys a pokemon" do
            expect { delete :destroy, params: { id: pokemon.id } }.to change { Pokemon.count }.by -1
        end
    end
end
