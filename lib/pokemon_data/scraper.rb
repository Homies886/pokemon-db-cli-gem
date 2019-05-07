class PokemonData:Scraper

  def get_page
    Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
  end

  def scrape_pokemon
    self.get_page.css(".infocard-list")
  end

end
