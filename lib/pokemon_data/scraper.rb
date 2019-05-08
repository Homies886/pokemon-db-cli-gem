class PokemonData::Scraper

  def get_page
    Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
  end

  def scrape_pokemon
    self.get_page.css(".infocard-lg-data")
  end

  def add_pokemon
    scrape_pokemon.each do |p|
      PokemonData::Pokemon.new_from_scrape(p)
    end
  end  
end
