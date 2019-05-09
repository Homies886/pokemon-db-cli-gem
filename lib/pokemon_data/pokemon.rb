class PokemonData::Pokemon

  attr_accessor :name, :pokedex_url, :pokemon, :description

  @@all = []

  def initialize(name=nil, pokedex_url=nil)
    @name = name
    @pokedex_url = pokedex_url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end

  def list_pokemon
    @list_pokemon ||= doc.each do |n|
      n.css(".ent-name").text
  end

  def doc
    doc = Nokogiri::HTML(open(self.pokemon_url))
  end

end
