class PruebasController < ApplicationController
  
  def index
    
    computers = Physical.first.computers
    height    = Physical.first.height
    width     = Physical.first.width
    large     = Physical.first.large

    item_large = []
    itemlist   = []
    
    for i in 1..large
      item_large.push("|x|")
    end
    
    for i in 1..width
      itemlist.push(item_large)
    end
    
    #Imprimir matriz ;) ;)
    for i in (0..itemlist.size-1)
        for j in (0..itemlist[i].size-1)
          print "#{itemlist[i][j]}\s"
        end
        print "\n"
    end

    
    # validacion
    meters = width*large # metros cuadrados de la sala
    computer_space = computers*2 # espacio necesario para los pcs
    avalaible_area = meters-width # espacio disponible para pcs
    number_computer = (avalaible_area/2).to_s # numero de computadores que caben en la sala
    
    if computer_space > avalaible_area
      puts "En esta sala caben "+number_computer+" computadores"
    end
    
    itemlist[0] = "|R|"
    itemlist[1][1] = "|S|"
    itemlist[0][2] = "|C|"
    itemlist[0][3] = "|R|"
    itemlist[0][4] = "|R|"
    
    for j in (0..itemlist.size-1)
      for i in (0..itemlist[j].size-1)
        #itemlist[0][0] = "|R|"
        print "#{itemlist[0][i]}\s"
      end
      print "\n"
    end
    # itemlist = [[1,1], [1,2], [2,1], [2,2]]
    # puts itemlist.lenght # largo
    # puts itemlist.first # primero
    # puts itemlist.push [2, 4]
    # puts itemlist[0] # [1, 1]
    # puts itemlist[1][1] # 2
    
    
    #[1, 1]

  end
end


