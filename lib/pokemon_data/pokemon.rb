class PokemonData::Pokemon

  attr_accessor :name, :pokemon_url, :description

  @@all = []

  def self.new_from_pokedex(name, pokemon_url)
    self.new(name, pokemon_url)
  end

  def initialize(name=nil, pokemon_url=nil)
    @name = name
    @pokemon_url = pokemon_url
    @@all << self unless @@all.include?(self)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def description
    @description ||= pokemon_details.css("p").first.text
  end

  def pokemon_details
    Nokogiri::HTML(open(self.pokemon_url))
  end

end
