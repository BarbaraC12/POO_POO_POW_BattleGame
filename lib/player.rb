require "pry"
#   VERSION 1.00
class Player #a
  attr_accessor :name, :life_point, :damage

  def initialize(name)
    @name = name
    @life_point = 10
  end

  def show_state #b
    puts "#{name} à #{life_point} point de vie."
  end

  def get_damage(damage)#c
    @damage_receive = damage
  @life_point -= damage
#Si le niveau de vie de l'objet est inférieur ou égal à zéro, le joueur est tué et on affiche un message.
  if @life_point <= 0 

  puts " #{name} à été tué 👎 !" # l'écriture #{} permet d'insérer une variable dans un string
  puts " "
  puts "____________ZZZZZZZZZZZZZZZZZZZZZ"
  puts "__________ZZZZZ______________ZZZZZZ                    "
  puts "________ZZZZZ____________________ZZZZ                  "
  puts "______ZZZZZ_______________________ZZZZZ                "
  puts "____ZZZZZ___________________________ZZZZ               "
  puts "___ZZZZ______________________________ZZZZ              "
  puts "__ZZZ__________________________________ZZZ             "
  puts "_ZZZ____________________________________ZZZ            "
  puts "ZZZZ____________________________________ZZZ            "
  puts "ZZZ_____________________________________ZZZ            "
  puts "ZZZ_____________________________________ZZZ                     _____      ______     _______    "
  puts "ZZZ_____________________________________ZZZ         ||         /_____ \    /_____/    | ______|  "
  puts "ZZZ_____________________________ZZ______ZZZ         ||        //      \\  //          ||         "
  puts "ZZZ___________________________ZZZZZ_____ZZZ         ||       //        \\  \\______    ||____    "
  puts "ZZZ________________________ZZZZZZZZZ__ZZZZZ         ||       ||       ||   \______ \   | ____|   "
  puts "ZZZZ____ZZZ______________ZZZZZZZZZZZZ_ZZZZ          ||        \\       //          \\  ||        "
  puts "ZZZZ___ZZZZZZ___________ZZZZZZZZZZZZZ_ZZZ           ||______   \\_____//    ______//  ||______   "
  puts "ZZZZ__ZZZZZZZZZZ_______ZZZZZZZZZZZZZ__ZZ            |_______|   \_____/     \______/   |_______| "
  puts "ZZZZ__ZZZZZZZZZZZ______ZZZZZZZZZZZZ___ZZ"
  puts "_ZZZ___ZZZZZZZZZZZ______ZZZZZZZZZZ____ZZ"
  puts "_ZZZ____ZZZZZZZZZ_ZZZZZ___ZZZZZZ____ZZZZ                                             _      _      _"
  puts "___ZZZZZ__________Z__ZZZ_____ZZZZZZZZZ       ..._|\______________ ,,_                | |    | |    | |" 
  puts "____ZZZZZZZZ__________ZZ____ZZZZZZZZ        ../ `---۵ ♥ ۵ ♥ ۵ ♥ ۵ ♥ ۵ ♥ |           | |    | |    | |"
  puts "_____ZZZZZZZZ_____________ZZZZZ            ./_==o ___92i_______|                    | |    | |    | |"
  puts "__________ZZZ__Z___Z___Z__ZZZ             ...),---.(_(__) /                         | |    | |    | |"
  puts "__________ZZZ_ZZZ_ZZZ_ZZZ_ZZZ            ..// (\ ) ),-----.'                         |_|    |_|    |_|"
  puts "__________ZZZ_ZZZ_ZZZ_ZZZ_ZZZ           .//___//                                     _      _      _"
  puts "__________ZZZ_ZZZ_ZZZ_ZZZ_ZZZ           /------'                                    |_|    |_|    |_|"
  puts "___________ZZZZZZZZZZZZZZZZZ"         
  puts "______________ZZZZZZZZZZZ"
  puts " "
  end
  end

  def attacks(player) #d
    puts "#{name} attaque #{player.name} !"   # un joueur lance une attaque
    damage = compute_damage
    puts "Il lui inflige #{damage} points de degats." # calcul les dommages et affichage du résultat
    player.get_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

#   VERSION 2.00
class HumanPlayer < Player #a
  attr_accessor :weapon_level

  def initialize(name) #b
    @weapon_level = 1
    super(name) #ATTENTION à l'emplacement du super dans l'initialize, pour une modification effective, le life_points doit être mis aprés
    @life_point = 100

  end
  def show_state  #c
    puts "#{name} a #{life_point} points de vie et une arme de niveaux #{weapon_level}"
  end
  def compute_damage
    rand(1..6) * @weapon_level
  end
  def search_weapon #d
    return rand(1..6)
  end
  def exchange_weapon
    new_weapon_level = search_weapon # fait appel à ma def search_weapon
    puts "Tu as trouvé une arme de niveau #{new_weapon_level} " 
    if new_weapon_level > weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "Sh@*#$...., elle n'est pas mieux que ton arme actuelle."
  end
  end
  def search_health_pack #e
    health_pack = rand(1..6)
    if health_pack == 1
      puts "tu n'as rien trouvé"
    elsif health_pack == 6
      @life_point = life_point + 80
      if life_point > 100
        @life_point = 100
      end
    puts "Woaw tu as trouvé un pack Platinium ! Sa te rapporte + 80 points de vie. "
    else
      @life_point = life_point + 50
      if life_point > 100
        @life_point = 100
      end
    puts "Tu as trouvé un pack Or ! Sa te rapporte + 50 points de vie. "
    end
  end

end

binding.pry