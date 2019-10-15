require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def home_page
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

def initialize_player
  print "Quel est ton Pseudo ? "
  name = gets.chomp
  puts "Bonjour #{name} !"
  playerH = HumanPlayer.new(name)
  puts "J'ai créé ton avatar !"
  return playerH
end

home_page
human_being = initialize_player

binding.pry
