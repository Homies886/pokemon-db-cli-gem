class PokemonData::Pokemon

  attr_accessor :name, :href, :description

  def initialize(name=nil, href=nil)
    @name = name
    @href = href
    @description = get_description
  end

  def self.new_from_page(p)
    self.new(p.text, "https://pokemondb.net#{p.attribute("href")}")
  end

  def get_description
    # Scrape description
  end

  def pokemon
    Nokogiri::HTML(open(self.pokemon_url))
  end

end
