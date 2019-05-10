class PokemonData::Pokedex

  attr_accessor :name, :pokedex_url, :list_pokemon,
  attr_reader :pokemon

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
    if @pokemon.empty
      set_pokemon
    end

    @pokemon.each do |n, index|
      puts "#{index} #{n.name}"
    end

    # Move to set pokemon
  end

  def set_pokemon
    # This populates @pokemon with Pokemon objects
    pokedex.each do |n|
      name = n.css(".ent-name").text
      href = n.css(".ent-name").href

      @pokemon << Pokemon(name, href)
    end
  end

  def get_pokemon(index)
    @pokemon[index]
  end

  def pokedex
    Nokogiri::HTML(open(self.pokemon_url))
  end

end
