require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative '../pokemon_data/version'
require_relative '../pokemon_data/scraper'
require_relative '../pokemon_data/pokedex'
require_relative '../pokemon_data/pokemon'


# User initializes cli
# Scaper hits pokedex page => pokedexes are and displayed
# A user selects a pokedex => pokedex scrapes its page to populate pokemon, if necessary => list of pokemon are displayed
class PokemonData::CLI

  def call
    PokemonData::Scraper.new.make_pokedexes
    puts "Basic Pokemon Information"
    start
  end

  def start
    puts ""
    puts "Please enter the number of the Pokedex you want to view"
    PokemonData::Pokedex.all.each_with_index do |v, index|
      puts "#{(index + 1)}. #{v.name}"
    end
    input = gets.strip

    pokedex = PokemonData::Pokedex.find(input.to_i)

    if pokedex == nil
      puts ""
      puts "I'm sorry. I don't understand that answer."
      return start
    end

    print_pokemon_list(pokedex)

    puts ""
    puts "Please enter the number of the pokemon you would like more information on"
    input = gets.strip

    pokemon_name = pokedex.get_pokemon_name_via_id(input.to_i)

    if pokemon_name == nil
      puts ""
      puts "I'm sorry. I don't understand that answer."
      return start
    end

    pokemon = PokemonData::Pokemon.find_by_name(pokemon_name)

    print_pokemon_description(pokemon)

    puts ""
    puts "Would you like to view information on another Pokedex/Pokemon? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you and good luck on your quest to become a Pokemon master!"
      exit
    else
      puts ""
      puts "I'm sorry. I don't understand that answer."
      start
    end
  end

  def print_pokemon_description(pokemon)
    puts pokemon.description
  end

  def print_pokemon_list(pokedex)
    puts ""
    pokedex.list_pokemon
  end
end
