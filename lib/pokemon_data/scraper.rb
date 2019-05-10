class PokemonData:Scraper

  def get_page
    Nokogiri::HTML(open("https://pokemondb.net/pokedex"))
  end

  def scrape_pokedexes
    self.get_page.css(".panel li a")
  end

  def make_pokedexes
    scrape_pokedexes.each do |p|
      PokemonData:Pokedex.new_from_page(p)
    end
  end
end
