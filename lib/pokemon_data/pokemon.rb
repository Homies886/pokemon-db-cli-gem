class PokemonData::Pokemon

  attr_accessor :name
  attr_reader :pokedex, :description

  @@all = []

  def initialize(name, pokedex = nil, description = nil)
    @name = name
    @pokedex = pokedex
    @description = description
  end

  def self.all
    @@all
  end

    



end
