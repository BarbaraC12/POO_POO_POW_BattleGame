require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  puts "----------------------------------------------------"
  puts "| ⚔️ Bienvenue sur 'POO-POO-PWO TheBattleGame'!⚔️   |"
  puts "|  Le jeu ou il faut être le dernier survivant !   |"
  puts "----------------------------------------------------"



  print "Quel est ton Pseudo ? "
  name = gets.chomp
  puts "Bonjour #{name}, tu veux veux etre super vilain et combattre les 4 Fantastiques ?"


my_game = Game.new(name)
while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice
	my_game.show_players
	my_game.enemies_attack
	my_game.show_players
end


my_game.end
