require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def home_page #acceuil
  puts "----------------------------------------------------"
  puts "| ⚔️ Bienvenue sur 'POO-POO-PWO TheBattleGame'!⚔️  |"
  puts "|  Le jeu ou il faut être le dernier survivant !   |"
  puts "----------------------------------------------------"
end

def initialize_player #initialisation du joueur
  print "Quel est ton Pseudo ? "
  name = gets.chomp
  puts "Bonjour #{name}, tu veux jouer avec moi 🤡🤡 !"
  user = HumanPlayer.new(name)
  return user
end

 # faire appel a mes def home_page et initialize_player
home_page
user = initialize_player

 # initialisation des ennemis
enemie1 = Player.new("Josiane")
enemie2 = Player.new("José")
enemies = [enemie1,enemie2]

 # boucle de combat
while user.life_point>0 && (enemie1.life_point > 0 || enemie2.life_point >0)
  # affiche le status de joueur humain
  user.show_state

 # let's play
  # choix de l'action à faire
  puts 
  puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "Attaquer un joueur en vue :"
  if enemie1.life_point > 0
    print "0 - "
    enemie1.show_state
  end
  if enemie2.life_point > 0
    print "1 - "
    enemie2.show_state
  end
  puts
  puts "Quel choix fait tu ?"
  action = gets.chomp
  puts 
  puts "----------------------------------"
  puts 

  # arbre de décision en fonction du choix del'action
  if action == "a"
    user.exchange_weapon
  end
  if action == "s"
    user.search_health_pack
  end
  if action == "0" && enemie1.life_point > 0
    user.attacks(enemie1)
  end
  if action == "1" && enemie2.life_point > 0
    user.attacks(enemie2)
  end
puts 
 puts "-----------------------------------"
 puts 
 puts 
 
  # ripostes des enemies 
  if enemie2.life_point>0 && enemie1.life_point> 0
     puts "Les autres joueurs t'attaquent !"
  end
  enemies.each do | enemie |
    if enemie.life_point>0
      enemie.attacks(user)
    end
  end
end
 # fin du jeu
puts "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
puts "   | *** La partie est finie *** |"
if user.life_point > 0
puts "   |👌👌BRAVO ! TU AS GAGNE !👌👌|"
else 
puts "   |👎👎Loser ! Tu as perdu !👎👎|"
end
puts "   *******************************"

