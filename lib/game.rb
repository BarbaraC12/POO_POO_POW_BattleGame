require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(human)
    @human_player = HumanPlayer.new(human)
    @enemies = [Player.new("Mr Invisible"), Player.new("La Femme invisible"), Player.new("La Torche humaine"), Player.new("La Chose")]
  end

  def kill_player
    # Supprime un player de la table enemies
    @enemies.each do |gamer|
      if (gamer.life_point <= 0)
          @enemies.delete(gamer)
      end
    end
  end
 
  def is_still_ongoing?
    #total = 0
    #@enemies.each do |pv|   # je fais la somme des PV des ennemies pour voi si ils sont à 0
    #  total += pv.life_point
    #end
    if @human_player.life_point > 0 && !@enemies.empty?
      return true
    else
      return false
    end
    # qui retourne true si le jeu est toujours en cours et false sinon. 
    #Le jeu continue tant que le @human_player a encore des points de vie et qu'il reste des Player à combattre 
    #dans l’array @enemies
  end

  def show_players
    #va afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
    @human_player.show_state
    puts "Il reste #{@enemies.count} ennemis en jeu."
    
  end

  def menu
    #afficher le menu de choix (juste l'afficher, pas plus)
    puts "**********************************"
    puts "Quelle action veux-tu effectuer ? "
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "attaquer un des 4 Fantastique en vue :"
    i = 0
    @enemies.each do |enemie|
      if enemie.life_point > 0
        print "#{i} - "
        enemie.show_state
        i += 1
      end
    end
  end

  def menu_choice()
    puts
    puts "Votre choix ?"
    action = gets.chomp
    puts "----------------------------------"
    if action == "a"
      @human_player.search_weapon
    elsif action == "s"
      @human_player.search_health_pack
    # si le choix est différent de a ou s, alors je prends la position de l'ennemi à supprimer
    elsif action == "0" || action == "1" || action == "2" || action == "3"
      position = action.to_i
      if position <= @enemies.count-1  # va chercher l'ennemie a enlever
        if @enemies[position].life_point > 0
          @human_player.attacks(enemies[position])
          kill_player    #l'ennemie qui a 0 PV et mort
        end
      else
        puts "Mauvais choix, tant pis pour toi !"
      end
    else
      puts "Erreur de saisie: a ou s ou un chifre de 0 à 3..."
    end
  end


  def enemies_attack
    #faire riposter tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain
    puts "----------------------------------" 
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do | enemie |
      if enemie.life_point > 0
        enemie.attacks(@human_player)
      end
    end
  end

  def end
 # fin du jeu
    puts "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts "   | *** La partie est finie *** |"
    if @human_player.life_point > 0
      puts "   |👌👌BRAVO ! TU AS GAGNE !👌👌|"
    else 
      puts "   |👎👎Loser ! Tu as perdu !👎👎|"
    end
    puts "   *******************************"

  end
end