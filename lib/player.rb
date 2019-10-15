require "pry"

class Player #a
  attr_accessor :name, :life_point, :damage

  def initialize(name)
    @name = name
  	@life_point = 10
  end

  def show_state #b
  	puts "#{name} à #{life_point} point de vie.:heart:"
  end

  def get_damage(damage)#c
  	@damage_receive = damage
	@life_point -= damage
#Si le niveau de vie de l'objet est inférieur ou égal à zéro, le joueur est tué et on affiche un message.
	if @life_point <= 0
	

	puts " "
	puts " #{name} a été tué !" # l'écriture #{} permet d'insérer une variable dans un string
	puts " "
	puts "____________ZZZZZZZZZZZZZZZZZZZZZ"
	puts "__________ZZZZZ______________ZZZZZZ                                 _____"
	puts "________ZZZZZ____________________ZZZZ                      \\    // /_____ \   ||       ||"
	puts "______ZZZZZ_______________________ZZZZZ                     \\  // //      \\  ||       ||"
	puts "____ZZZZZ___________________________ZZZZ                     \\// //        \\ ||       ||"
	puts "___ZZZZ______________________________ZZZZ                    ||  ||       || ||       ||"
	puts "__ZZZ__________________________________ZZZ                   ||   \\       //  \\       //"
	puts "_ZZZ____________________________________ZZZ                  ||    \\_____//    \\_____//"
	puts "ZZZZ____________________________________ZZZ                  ||     \_____/      \_____/"
	puts "ZZZ_____________________________________ZZZ"     
	puts "ZZZ_____________________________________ZZZ                     _____      ______     _______   "
	puts "ZZZ_____________________________________ZZZ         ||         /_____ \    /_____/    | ______|  "
	puts "ZZZ_____________________________ZZ______ZZZ         ||        //      \\  //          ||         "
	puts "ZZZ___________________________ZZZZZ_____ZZZ         ||       //        \\  \\______    ||____     "
	puts "ZZZ________________________ZZZZZZZZZ__ZZZZZ         ||       ||       ||   \______ \   | ____|    "
	puts "ZZZZ____ZZZ______________ZZZZZZZZZZZZ_ZZZZ          ||        \\       //          \\  ||         "
	puts "ZZZZ___ZZZZZZ___________ZZZZZZZZZZZZZ_ZZZ           ||______   \\_____//    ______//  ||______   "
	puts "ZZZZ__ZZZZZZZZZZ_______ZZZZZZZZZZZZZ__ZZ            |_______|   \_____/     \______/   |_______|  "
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

  def attacks(player)
    puts "#{name} attaque #{player.name} !"   # un joueur lance une attaque
    damage = compute_damage
    puts "Il lui inflige #{damage} points de degats." # calcul les dommages et affiche le résultat
    player.get_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end



end

binding.pry
puts "end of file"