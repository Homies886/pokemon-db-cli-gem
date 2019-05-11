class PokemonData::Pokemon

  attr_accessor :name, :pokemon_url, :description

  @@all = []

  def self.new_from_pokedex(name, pokemon_url)
    self.new(name, pokemon_url)
  end

  def initialize(name=nil, pokemon_url=nil)
    @name = name
    @pokemon_url = pokemon_url
    @description = get_description
    @@all << self
  end

  def self.all
    @@all
  end

  def get_description
    pokemon_details.css("p").first.text
  end

  def pokemon_details
    Nokogiri::HTML(open(self.pokemon_url))
  end

end
