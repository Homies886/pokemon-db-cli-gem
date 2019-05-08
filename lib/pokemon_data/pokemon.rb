class PokemonData::Pokemon

  attr_accessor :pokedex, :name, :description

  @@all = []

  def self.new_from_scrape(p)
    self.new()
  end







end
