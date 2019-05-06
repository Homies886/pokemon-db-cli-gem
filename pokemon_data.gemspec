require_relative './lib/pokemon_data/version'

Gem::Specification.new do |s|
  s.name          = "pokemon_data"
  s.version       = PokemonData::VERSION
  s.authors       = ["'Nicholas Rodriguez'"]
  s.email         = ["'niko876@hotmail.com'"]
  s.summary       = "Pokemon Data"
  s.description   = "Provides data on all 809 Pokemon"
  s.homepage      = "TODO: Put your gem's website or public repo URL here."
  s.license       = "MIT"

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
