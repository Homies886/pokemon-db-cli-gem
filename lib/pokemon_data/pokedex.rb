class PokemonData::Pokedex

  attr_accessor :name, :pokedex_url, :list_pokemon,
  attr_reader :pokemon

  def initialize(name=nil, pokedex_url=nil)
    @name = name
    @pokedex_url = pokedex_url
    @pokemon = []
  end

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end

  def list_pokemon
    if @pokemon.empty
      make_pokemon
    end

    @pokemon.each_with_index do |n, index|
      puts "#{(index + 1)}. #{n.name}"
  end

  def make_pokemon
    pokemon_list.each do |n|
      name = n.css(".ent-name").text
      pokemon_url = "https://"
      @pokemon << PokemonData::Pokemon.name unless @pokemon.include?(PokemonData::Pokemon.name)
    end
  end

  def pokemon_list
    Nokogiri::HTML(open(self.pokemon_url))
  end

end
