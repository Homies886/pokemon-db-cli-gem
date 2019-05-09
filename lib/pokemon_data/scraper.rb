class PokemonData:Scraper

  def scrape_pokedex_list
    Nokogiri::HTML(open("https://pokemondb.net/pokedex")).css(".panel li a")
  end

  def scrape_pokemon_list
    self.scrape_pokedex_list.each do |g|
      Nokogiri::HTML(open("https://pokemondb.net#{g.attribute("href")}")).css(".ent-name")
    end
  end

  def scrape_pokemon_description
    self.scrape_pokemon_list.each do |g|
      Nokogiri::HTML(open("https://pokemondb.net#{g.attribute("href")}")).css("p")
    end
  end

  def make_pokedex_list
    scrape_pokedex_list.each do |p|
      PokemonData:Pokemon.add_pokedex(p) unless p.text == "All Pokémon" || p.text == "National Dex" || p.text == "Shinydex" || p.text == "Competitive Pokédex" || p.text == "Size Pokédex" || p.text == "Pokémon GO"
    end
  end


end
