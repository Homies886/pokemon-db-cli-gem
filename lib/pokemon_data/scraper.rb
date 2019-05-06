class PokemonData:Scraper

  def get_page
    Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
  end

  def scrape_pokemon_index
    self.get_page.css("infocard-lg-data text-muted")
  end

end
