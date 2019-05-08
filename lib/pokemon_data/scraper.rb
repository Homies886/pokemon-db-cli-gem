class PokemonData:Scraper

  def get_pokdex_list
    Nokogiri::HTML(open("https://pokemondb.net/pokedex"))
  end

  def scrape_pokemon
    self.get_pokdex_list.css(".panel li a")
  end

end
