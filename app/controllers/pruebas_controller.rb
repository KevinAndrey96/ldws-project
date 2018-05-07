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
    
    matrix = Array.new(5,(Array.new(5,9)))
    matrix = []

    5.times do 
      matrix.push(Array.new(5,9))
    end
    
    #puts "Ancho: "+width.to_s
    
    puts  "#{matrix}"
    matrix [0][0] = 2
    puts  "#{matrix}"
    
    
    
    
    
    #Imprimir matriz 
    for i in (0..itemlist.size-1)
        for j in (0..itemlist[i].size-1)
          print "#{itemlist[i][j]}\s"
        end
        print "\n"
    end
    
    puts itemlist.to_s
    # validacion
    meters = width*large # metros cuadrados de la sala
    computer_space = computers*2 # espacio necesario para los pcs
    avalaible_area = meters-width # espacio disponible para pcs
    number_computer = (avalaible_area/2).to_s # numero de computadores que caben en la sala
    
    if computer_space > avalaible_area
      puts "En esta sala caben "+number_computer+" computadores"
    end
  
    #itemlist[0][0] = "|R|"
    
    
    #itemlist[itemlist.index(0)] = "|R|"
    
    for i in (0..itemlist.size-1)
        for j in (0..itemlist[i].size-1)
          print "#{itemlist[i][j]}\s"
        end
        print "\n"
    end
  end
end


