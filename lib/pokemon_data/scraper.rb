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
    unless scrape_pokedexes.text == "All Pokémon" || scrape_pokedexes.text == "National Dex" || scrape_pokedexes.text == "Shinydex" || scrape_pokedexes.text == "Competitive Pokédex" || scrape_pokedexes.text == "Size Pokédex" || scrape_pokedexes.text == "Pokémon GO"

    end
    end
  end

end
