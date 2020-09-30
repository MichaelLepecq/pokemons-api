class PokemonsController < ApplicationController
    before_action :set_pokemon, only: [:show, :update, :destroy]

    def index
        per_page = 40
        pokemons = Pokemon.page(params[:page]).per(per_page)
        render json: { pokemon_list: pokemons, per_page: per_page, meta: { records: Pokemon.count } }, status: :ok
    end

    def create
        @pokemon = Pokemon.create(pokemon_params)
        if @pokemon.errors.empty?
            render json: @pokemon, status: :created
        else
            render json: @pokemon.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @pokemon, status: :ok
    end

    def update
        @pokemon.update(pokemon_params)
        if @pokemon.errors.empty?
            render json: @pokemon, status: :ok
        else
            render json: @pokemon.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @pokemon.destroy!
        head :no_content
    end

    private

    def pokemon_params
        params.permit(:name, :first_type, :second_type, :total, :hp, :attack, :defense, :speed_attack, :speed_defense, :speed, :generation, :legendary)
    end

    def set_pokemon
        @pokemon = Pokemon.find(params[:id])
    end
end
