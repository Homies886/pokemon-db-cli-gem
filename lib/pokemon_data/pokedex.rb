class PokemonData::Pokedex

  attr_accessor :name, :pokedex_url, :list_pokemon, :make_pokemon, :pokemon

  @@all = []

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end

  def initialize(name=nil, pokedex_url=nil)
    @name = name
    @pokedex_url = pokedex_url
    @pokemon = []
    @@all << self
    make_pokemon
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1] ? self.all[id-1] : nil
  end

  def list_pokemon
    @list_pokemon = @pokemon.each_with_index do |n, index|
      puts "#{(index + 1)}. #{n}"
    end
  end

  def make_pokemon
    pokemon_list.css(".ent-name").each do |n|
      name = n.text
      pokemon_url = "https://pokemondb.net#{n.attribute("href")}"
      @pokemon << name unless @pokemon.include?(name)
      PokemonData::Pokemon.new_from_pokedex(name, pokemon_url)
    end
  end

  def get_pokemon_name_via_id(num)
    @pokemon[num-1] ? @pokemon[num-1] : nil
  end

  def pokemon_list
    Nokogiri::HTML(open(self.pokedex_url))
  end

end
