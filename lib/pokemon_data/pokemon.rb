class PokemonData::Pokemon

  attr_accessor :name, :pokemon_url, :pokemon, :description

  @@all = []

  def initialize(name=nil, pokemon_url=nil)
    @name = name
    @pokemon_url = pokemon_url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end




end
