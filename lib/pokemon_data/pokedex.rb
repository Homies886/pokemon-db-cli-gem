class PokemonData::Pokedex

  attr_accessor :name, :pokedex_url, :list_pokemon

  @@all = []

  def initialize(name=nil, pokedex_url=nil)
    @name = name
    @pokedex_url = pokedex_url
    @@all << self
    @pokemon = []
  end

  def self.all
    @@all
  end

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end

  def list_pokemon
    @list_pokemon ||= pokedex.each do |n|
      n.css(".ent-name").text
    end
  end

  def pokedex
    pokedex = Nokogiri::HTML(open(self.pokemon_url))
  end




end
