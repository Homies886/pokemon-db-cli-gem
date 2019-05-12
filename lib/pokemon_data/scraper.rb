class PokemonData::Scraper

  def get_page
    Nokogiri::HTML(open("https://pokemondb.net/pokedex"))
  end

  def scrape_pokedexes
    self.get_page.css(".panel li a")
  end

  def make_pokedexes
    scrape_pokedexes.each do |p|
      PokemonData:Pokedex.new_from_page(p) unless p.text == "All Pokémon" || p.text == "National Dex" || p.text == "Shinydex" || p.text == "Competitive Pokédex" || p.text == "Size Pokédex" || p.text == "Pokémon GO"
    end
  end

end
