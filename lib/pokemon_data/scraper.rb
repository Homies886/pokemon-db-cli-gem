class PokemonData:Scraper

  url = https://pokemondb.net/pokedex

  def get_pokdex_list
    Nokogiri::HTML(open("#{url}"))
  end

  def scrape_pokedex_list
    self.get_pokdex_list.css(".panel li a")
  end

  def get_pokemon_list
    
  end
end
