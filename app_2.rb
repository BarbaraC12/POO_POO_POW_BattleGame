require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def home_page
  puts "--------------------------------------------------"
  puts "|  ⚔️Bienvenue sur 'ILS VEULENT TOUS MA POO'!⚔️  |"
  puts "|Le but du jeu est d'être le dernier survivant ! |"
  puts "--------------------------------------------------"
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

# création des ennemis
enemie1 = Player.new("Josiane")
enemie2 = Player.new("José")
enemies = [enemie1,enemie2]

while human_being.life_point>0 && (enemie1.life_point > 0 || enemie2.life_point >0)
  # affiche le status de joueur humain
  human_being.show_state


  # choix de l'action à faire
  puts "**********************************"
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
  if enemie1.life_point > 0
    print "0 - "
    enemie1.show_state
  end
  if enemie2.life_point > 0
    print "1 - "
    enemie2.show_state
  end
  puts
  puts "Votre choix ?"
  action = gets.chomp
  puts "----------------------------------"

  # arbre de décision en fonction du choix del'action
  if action == "a"
    human_being.exchange_weapon
  end
  if action == "s"
    human_being.search_health_pack
  end
  if action == "0" && enemie1.life_point > 0
    human_being.attacks(enemie1)
  end
  if action == "1" && enemie2.life_point > 0
    human_being.attacks(enemie2)
  end

 puts "----------------------------------"
 
  # ripostes des enemies 
  if enemie2.life_point>0 && enemie1.life_point> 0
     puts "Les autres joueurs t'attaquent !"
  end
  enemies.each do | enemie |
    if enemie.life_point>0
      enemie.attacks(human_being)
    end
  end
end

puts "**********************************"
puts "*** La partie est finie ***"
if human_being.life_point > 0
  puts "BRAVO ! TU AS GAGNE !"
else 
  puts "Loser ! Tu as perdu !"
end
puts "**********************************"


binding.pry
