class PdfController < ApplicationController
  
  before_action :authenticate_user!
  def empresa
    if params[:request_id]
      @request=Request.find(params[:request_id]) 
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id).first
      @subnets=Subnet.where(:logical_id => @logical.id)
    end
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @eco=0
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 1).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 3).count  
        if @eq == 0
          @Sw_status=0
        else
          @eco=3
        end
      else
        @eco=2
      end
    else
      @eco=1
    end
    
    @servidores=0
    if @request.web?
      @servidores+=1
    end
    if @request.bd?
      @servidores+=1
    end
    if @request.aplications?
      @servidores+=1
    end
    if @request.proxy?
      @servidores+=1
    end
    if @request.voip?
      @servidores+=1
    end
    if @request.video_conference?
      @servidores+=1
    end
    if @request.active_dir?
      @servidores+=1
    end
    if @request.dhcp?
      @servidores+=1
    end
    if @request.dns?
      @servidores+=1
    end
    if @request.ftp?
      @servidores+=1
    end
    if @request.email?
      @servidores+=1
    end
   
    render  :pdf => "Reporte", :template => 'pdf/empresa.html.erb'
  end
  def direccionamiento
    
    
    
    if params[:request_id]
      @request=Request.find(params[:request_id])
      @company=Company.find(@request.company_id)
      
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id)
    end
    @id_empresa=params[:id]
    @request=Request.where(:company_id => @company.id).first 
    @company=Company.find(@company.id) 
    @physical=Physical.where(:request_id => @request.id) 
    @logical=Logical.where(:request_id => @request.id).last 
    @subnets=Subnet.where(:logical_id => @logical.id) 
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    @totalcomputers=@physical.sum(:computers) 
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
    
    totalcomputers=@physical.sum(:computers)
    default=totalcomputers-@subnets.sum(:computers) 
    @subaux=Subnet.where(:name => "default", :logical_id => @logical.id).count
    if default>0 && @subaux==0
      @su=Subnet.new(:name => "default", :description => "Sub red Default", :computers => default, :logical_id => @logical.id)
      @su.save 
    end
    
    #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    #response = HTTParty.get("http://instanceshape.com/admin/VLSM/index.php?Host=192.168.1.24&sub[uno]=15&sub[dos]=56&sub[tres]=36")
    require 'uri'
    require 'net/http'
    
    #Direccionamiento normal
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0";
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+subs.computers.to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @h = JSON.parse response.read_body
    
    #Direccionamiento Escalabilidad
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0"
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+(subs.computers+(subs.computers*@logical.scalability/100)).to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @g = JSON.parse response.read_body
    
    
    render  :pdf => "Reporte", :template => 'pdf/direccionamiento.html.erb'
  end
  def switches
    if params[:request_id]
      @request=Request.find(params[:request_id])
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id)
    end
    @id_empresa=params[:id]
    @request=Request.where(:company_id => @company.id).first 
    @company=Company.find(@company.id) 
    @physical=Physical.where(:request_id => @request.id) 
    @logical=Logical.where(:request_id => @request.id).first 
    @subnets=Subnet.where(:logical_id => @logical.id) 
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    @totalcomputers=@physical.sum(:computers) 
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
   
    render  :pdf => "Reporte", :template => 'pdf/switches.html.erb'
  end
  def routers
    if params[:request_id]
      @request=Request.find(params[:request_id])
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id)
    end
    @id_empresa=params[:id]
    @request=Request.where(:company_id => @company.id).first 
    @company=Company.find(@company.id) 
    @physical=Physical.where(:request_id => @request.id) 
    @logical=Logical.where(:request_id => @request.id).first 
    @subnets=Subnet.where(:logical_id => @logical.id) 
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    @totalcomputers=@physical.sum(:computers) 
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
    render  :pdf => "Reporte", :template => 'pdf/routers.html.erb'
  end
  def topologia
    if params[:request_id]
      @request=Request.find(params[:request_id])
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id)
    end
    @id_empresa=params[:id]
    @request=Request.where(:company_id => @company.id).first 
    @company=Company.find(@company.id) 
    @physical=Physical.where(:request_id => @request.id) 
    @logical=Logical.where(:request_id => @request.id).first 
    @subnets=Subnet.where(:logical_id => @logical.id) 
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    @totalcomputers=@physical.sum(:computers) 
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
    render  :pdf => "Reporte", :template => 'pdf/topologia.html.erb'
  end
  def cotizacion
    if params[:request_id]
      @request=Request.find(params[:request_id])
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id).first
      
    end
    @Logical=Logical.where(:request_id => @request.id).first
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @eco=0
    @opt=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 1).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 3).count  
        if @eq == 0
          @Sw_status=0
        else
          @eco=3
        end
      else
        @eco=2
      end
    else
      @eco=1
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @eco_r=0
    @opt_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 1).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 2).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 3).count  
        if @eq_r == 0
          @R_status=0
        else
          @eco_r=3
        end
      else
        @eco_r=2
      end
    else
      @eco_r=1
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @eco_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @eco_ra=3
        end
      else
        @eco_ra=2
      end
    else
      @eco_ra=1
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @eco_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @eco_ca=3
        end
      else
        @eco_ca=2
      end
    else
      @eco_ca=1
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @physical.each do |physical|
    cont=0
    @cable = 0
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
     #Código de Canaleta
    @Can_status = 1
    
    @eco_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count  
        if @eq_can == 0
          @Can_status=0
        else
          @eco_can=3
        end
      else
        @eco_can=2
      end
    else
      @eco_can=1
    end
    
    #Código de Tomas
    @T_status = 1
    
    @eco_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 1).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 3).count  
        if @eq_t == 0
          @T_status=0
        else
          @eco_t=3
        end
      else
        @eco_t=2
      end
    else
      @eco_t=1
    end
    
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_con=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 1).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 3).count  
        if @eq_co == 0
          @Co_status=0
        else
          @eco_con=3
        end
      else
        @eco_con=2
      end
    else
      @eco_con=1
    end
    
    #Código de AP
    @Ap_status = 1
    
    @eco_ap=0
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 1).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power => 2).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 3).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @eco_ap=3
        end
      else
        @eco_ap=2
      end
    else
      @eco_ap=1
    end
    
    
    #Estandar
        
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @est=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 2).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 3).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 1).count  
        if @eq == 0
          @Sw_status=0
        else
          @est=1
        end
      else
        @est=3
      end
    else
      @est=2
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @est_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 2).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 3).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 1).count  
        if @eq_r == 0
          @R_status=0
        else
          @est_r=1
        end
      else
        @est_r=3
      end
    else
      @est_r=2
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @est_ra=0
    @est_ra=0
    @opt_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @est_ra=1
        end
      else
        @est_ra=3
      end
    else
      @est_ra=2
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @est_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @est_ca=1
        end
      else
        @est_ca=3
      end
    else
      @est_ca=2
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @physical.each do |physical|
    cont=0
    @cable = 0
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
     #Código de Canaleta
    @Can_status = 1
    
    @est_can=0
    @est_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count  
        if @eq_can == 0
          @Can_status=0
        else
          @est_can=1
        end
      else
        @est_can=3
      end
    else
      @est_can=2
    end
    
    #Código de Canaleta
    @T_status = 1
    
    @est_t=0
    @est_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 3).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 1).count  
        if @eq_t == 0
          @T_status=0
        else
          @est_t=1
        end
      else
        @est_t=3
      end
    else
      @est_t=2
    end
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_co=0
    @opt_co=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 3).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 1).count  
        if @eq_co == 0
          @Co_status=0
        else
          @est_co=1
        end
      else
        @est_co=3
      end
    else
      @est_co=2
    end
    
    #Código de AP
    @Ap_status = 1
    
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 2).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power => 3).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 1).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @est_ap=1
        end
      else
        @est_ap=3
      end
    else
      @est_ap=2
    end
    
    
    
    
    
    # Optima
    
    
    
    
    
    
        
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @opt=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 3).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 1).count  
        if @eq == 0
          @Sw_status=0
        else
          @opt=1
        end
      else
        @opt=2
        
      end
    else
      @opt=3
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @opt_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 3).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 2).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 1).count  
        if @eq_r == 0
          @R_status=0
        else
          @opt_r=1
        end
      else
        @opt_r=2
      end
    else
      @opt_r=3
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @opt_ra=0
    @opt_ra=0
    @opt_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @opt_ra=1
        end
      else
        @opt_ra=2
      end
    else
      @opt_ra=3
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @opt_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @opt_ca=1
        end
      else
        @opt_ca=2
      end
    else
      @opt_ca=3
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @cable = 0
    @physical.each do |physical|
      if physical.conference_hall?
        @cable+=2*physical.height+physical.width+physical.large+4
      end
    cont=0
    @cable = @cable +(0.5+(physical.height*2)+2) 
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
   
     #Código de Canaleta
    @Can_status = 1
    
    @opt_can=0
    @opt_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count  
        if @eq_can == 0
          @Can_status=0
        else
          @opt_can=1
        end
      else
        @opt_can=2
      end
    else
      @opt_can=3
    end
    
    #Código de Canaleta
    @T_status = 1
    
    @opt_t=0
    @opt_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 3).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 1).count  
        if @eq_t == 0
          @T_status=0
        else
          @opt_t=1
        end
      else
        @opt_t=2
      end
    else
      @opt_t=3
    end
    
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_co=0
    @opt_co=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 3).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 1).count  
        if @eq_co == 0
          @Co_status=0
        else
          @opt_co=1
        end
      else
        @opt_co=2
      end
    else
      @opt_co=3
    end
    
    #Código de AP
    @Ap_status = 1
    
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 3).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power =>2).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 1).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @opt_ap=1
        end
      else
        @opt_ap=2
      end
    else
      @opt_ap=3
    end
    
    
    
    
    
    render  :pdf => "Reporte", :template => 'pdf/cotizacion.html.erb'
  end
  def red
    if params[:request_id]
      @request=Request.find(params[:request_id]) 
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id).order('computers desc')
      @logical=Logical.where(:request_id => @request.id).first
      @subnets=Subnet.where(:logical_id => @logical.id)
    end
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    
    
    
    @id_empresa=params[:id]
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
    
    totalcomputers=@physical.sum(:computers)
    default=totalcomputers-@subnets.sum(:computers) 
    @subaux=Subnet.where(:name => "default", :logical_id => @logical.id).count
    if default>0 && @subaux==0
      @su=Subnet.new(:name => "default", :description => "Sub red Default", :computers => default, :logical_id => @logical.id)
      @su.save 
    end
    
    #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    #response = HTTParty.get("http://instanceshape.com/admin/VLSM/index.php?Host=192.168.1.24&sub[uno]=15&sub[dos]=56&sub[tres]=36")
    require 'uri'
    require 'net/http'
    
    #Direccionamiento normal
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0";
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+subs.computers.to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @h = JSON.parse response.read_body
    
    #Direccionamiento Escalabilidad
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0"
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+(subs.computers+(subs.computers*@logical.scalability/100)).to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @g = JSON.parse response.read_body
    
    @tipodered = @request.ctype
    render  :pdf => "Reporte", :template => 'pdf/red.html.erb'
  end
  def final
    if params[:request_id]
      @request=Request.find(params[:request_id]) 
      @company=Company.find(@request.company_id)
      @physical=Physical.where(:request_id => @request.id)
      @logical=Logical.where(:request_id => @request.id).first
      @subnets=Subnet.where(:logical_id => @logical.id)
    end
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    
    # Inicia Empresa
    
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    @eco=0
    @eq=Equipment.where(:etype => "Switch", :power => 1).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 3).count  
        if @eq == 0
          @Sw_status=0
        else
          @eco=3
        end
      else
        @eco=2
      end
    else
      @eco=1
    end
    @servidores=0
    if @request.web?
      @servidores+=1
    end
    if @request.bd?
      @servidores+=1
    end
    if @request.aplications?
      @servidores+=1
    end
    if @request.proxy?
      @servidores+=1
    end
    if @request.voip?
      @servidores+=1
    end
    if @request.video_conference?
      @servidores+=1
    end
    if @request.active_dir?
      @servidores+=1
    end
    if @request.dhcp?
      @servidores+=1
    end
    if @request.dns?
      @servidores+=1
    end
    if @request.ftp?
      @servidores+=1
    end
    if @request.email?
      @servidores+=1
    end
    
    # Finaliza empresa
   # Inicia Direccionamiento
   
   @id_empresa=params[:id]
    @request=Request.where(:company_id => @company.id).first 
    @company=Company.find(@company.id) 
    @physical=Physical.where(:request_id => @request.id) 
    @logical=Logical.where(:request_id => @request.id).last 
    @subnets=Subnet.where(:logical_id => @logical.id) 
    @sizeofs=Subnet.where(:logical_id => @logical.id).size 
    @totalcomputers=@physical.sum(:computers) 
    @totalcomputers2=@physical.sum(:computers)
    @totalcomputers3=@physical.sum(:computers)
    
    totalcomputers=@physical.sum(:computers)
    default=totalcomputers-@subnets.sum(:computers) 
    @subaux=Subnet.where(:name => "default", :logical_id => @logical.id).count
    if default>0 && @subaux==0
      @su=Subnet.new(:name => "default", :description => "Sub red Default", :computers => default, :logical_id => @logical.id)
      @su.save 
    end
    
    #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    #response = HTTParty.get("http://instanceshape.com/admin/VLSM/index.php?Host=192.168.1.24&sub[uno]=15&sub[dos]=56&sub[tres]=36")
    require 'uri'
    require 'net/http'
    
    #Direccionamiento normal
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0";
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+subs.computers.to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @h = JSON.parse response.read_body
    
    #Direccionamiento Escalabilidad
    
    #myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+"."+@logical.host4.to_s
    myurl="https://instanceshape.com/admin/VLSM/index.php?Host="+@logical.host1.to_s+"."+@logical.host2.to_s+"."+@logical.host3.to_s+".0"
    @subnets.each do |subs|
      myurl+="&sub["+subs.name+"]="+(subs.computers+(subs.computers*@logical.scalability/100)).to_s
    end  
    url = URI(myurl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_body
    require 'json'
    @g = JSON.parse response.read_body
    
   #Finaliza Direccionamiento
   
   #Inicia Cotización
   
   @Logical=Logical.where(:request_id => @request.id).first
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @eco=0
    @opt=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 1).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 3).count  
        if @eq == 0
          @Sw_status=0
        else
          @eco=3
        end
      else
        @eco=2
      end
    else
      @eco=1
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @eco_r=0
    @opt_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 1).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 2).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 3).count  
        if @eq_r == 0
          @R_status=0
        else
          @eco_r=3
        end
      else
        @eco_r=2
      end
    else
      @eco_r=1
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @eco_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @eco_ra=3
        end
      else
        @eco_ra=2
      end
    else
      @eco_ra=1
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @eco_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @eco_ca=3
        end
      else
        @eco_ca=2
      end
    else
      @eco_ca=1
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @physical.each do |physical|
    cont=0
    @cable = 0
    @canaleta = 1
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                @canaleta = 1+@canaleta
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @canaleta = (i+1)+@canaleta 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
     #Código de Canaleta
    @Can_status = 1
    
    @eco_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count  
        if @eq_can == 0
          @Can_status=0
        else
          @eco_can=3
        end
      else
        @eco_can=2
      end
    else
      @eco_can=1
    end
    
    #Código de Tomas
    @T_status = 1
    
    @eco_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 1).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 3).count  
        if @eq_t == 0
          @T_status=0
        else
          @eco_t=3
        end
      else
        @eco_t=2
      end
    else
      @eco_t=1
    end
    
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_con=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 1).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 3).count  
        if @eq_co == 0
          @Co_status=0
        else
          @eco_con=3
        end
      else
        @eco_con=2
      end
    else
      @eco_con=1
    end
    
    #Código de AP
    @Ap_status = 1
    
    @eco_ap=0
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 1).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power => 2).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 3).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @eco_ap=3
        end
      else
        @eco_ap=2
      end
    else
      @eco_ap=1
    end
    
    
    #Estandar
        
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @est=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 2).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 3).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 1).count  
        if @eq == 0
          @Sw_status=0
        else
          @est=1
        end
      else
        @est=3
      end
    else
      @est=2
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @est_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 2).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 3).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 1).count  
        if @eq_r == 0
          @R_status=0
        else
          @est_r=1
        end
      else
        @est_r=3
      end
    else
      @est_r=2
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @est_ra=0
    @est_ra=0
    @opt_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @est_ra=1
        end
      else
        @est_ra=3
      end
    else
      @est_ra=2
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @est_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @est_ca=1
        end
      else
        @est_ca=3
      end
    else
      @est_ca=2
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @physical.each do |physical|
    cont=0
    @cable = 0
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
     #Código de Canaleta
    @Can_status = 1
    
    @est_can=0
    @est_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count  
        if @eq_can == 0
          @Can_status=0
        else
          @est_can=1
        end
      else
        @est_can=3
      end
    else
      @est_can=2
    end
    
    #Código de Canaleta
    @T_status = 1
    
    @est_t=0
    @est_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 3).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 1).count  
        if @eq_t == 0
          @T_status=0
        else
          @est_t=1
        end
      else
        @est_t=3
      end
    else
      @est_t=2
    end
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_co=0
    @opt_co=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 3).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 1).count  
        if @eq_co == 0
          @Co_status=0
        else
          @est_co=1
        end
      else
        @est_co=3
      end
    else
      @est_co=2
    end
    
    #Código de AP
    @Ap_status = 1
    
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 2).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power => 3).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 1).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @est_ap=1
        end
      else
        @est_ap=3
      end
    else
      @est_ap=2
    end
    
    
    
    
    
    # Optima
    
    
    
    
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @opt=0
    
    #Verificamos existencias
    @eq=Equipment.where(:etype => "Switch", :power => 3).count
    if @eq == 0
      @eq=Equipment.where(:etype => "Switch", :power => 2).count
      if @eq == 0
        @eq=Equipment.where(:etype => "Switch", :power => 1).count  
        if @eq == 0
          @Sw_status=0
        else
          @opt=1
        end
      else
        @opt=2
        
      end
    else
      @opt=3
    end
    
    #Código de Routers
    
    @R_status = 1
    
    @opt_r=0
    
    @eq_r=Equipment.where(:etype => "Router", :power => 3).count
    if @eq_r == 0
      @eq_r=Equipment.where(:etype => "Router", :power => 2).count
      if @eq_r == 0
        @eq_r=Equipment.where(:etype => "Router", :power => 1).count  
        if @eq_r == 0
          @R_status=0
        else
          @opt_r=1
        end
      else
        @opt_r=2
      end
    else
      @opt_r=3
    end
    
    #Código de Racks
    @Ra_status = 1
    
    @opt_ra=0
    @opt_ra=0
    @opt_ra=0
    
    @eq_ra=Equipment.where(:etype => "Rack", :power => 3).count
    if @eq_ra == 0
      @eq_ra=Equipment.where(:etype => "Rack", :power => 2).count
      if @eq_ra == 0
        @eq_ra=Equipment.where(:etype => "Rack", :power => 1).count  
        if @eq_ra == 0
          @Ra_status=0
        else
          @opt_ra=1
        end
      else
        @opt_ra=2
      end
    else
      @opt_ra=3
    end
    
    #Código de Cable
    @Ca_status = 1
    
    @opt_ca=0
    
    @eq_ca=Equipment.where(:etype => "Cable", :power => 3).count
    if @eq_ca == 0
      @eq_ca=Equipment.where(:etype => "Cable", :power => 2).count
      if @eq_ca == 0
        @eq_ca=Equipment.where(:etype => "Cable", :power => 1).count  
        if @eq_ca == 0
          @Ca_status=0
        else
          @opt_ca=1
        end
      else
        @opt_ca=2
      end
    else
      @opt_ca=3
    end
    
    #Cantidad de cable
    @physical=Physical.where(:request_id => params[:request_id]) 
    @cable = 0
    @physical.each do |physical|
      if physical.conference_hall?
        @cable+=2*physical.height+physical.width+physical.large+4
      end
    cont=0
    @cable = @cable +(0.5+(physical.height*2)+2) 
     i = 0 
     while i < physical.large 
         j = 0 
         @aux=0 
       while j < physical.width 
      
           if j != 0 
             if i%2 == 0 
              if cont < physical.computers
                cont+=1
                 if i == 0 
                  @cable = (0.5+(physical.height*2)+((j+1))+2)+@cable 
                 else 
                  @cable = (0.5+(physical.height*2)+((i+1)+(j+1))+2)+@cable 
                 end 
              end
            end
          end
         j += 1 
       end 
       i += 1 
     end 
   end
   
     #Código de Canaleta
    @Can_status = 1
    
    @opt_can=0
    @opt_can=0
    @opt_can=0
    
    @eq_can=Equipment.where(:etype => "Canaleta", :power => 3).count
    if @eq_can == 0
      @eq_can=Equipment.where(:etype => "Canaleta", :power => 2).count
      if @eq_can == 0
        @eq_can=Equipment.where(:etype => "Canaleta", :power => 1).count  
        if @eq_can == 0
          @Can_status=0
        else
          @opt_can=1
        end
      else
        @opt_can=2
      end
    else
      @opt_can=3
    end
    
    #Código de Canaleta
    @T_status = 1
    
    @opt_t=0
    @opt_t=0
    @opt_t=0
    
    @eq_t=Equipment.where(:etype => "Toma", :power => 3).count
    if @eq_t == 0
      @eq_t=Equipment.where(:etype => "Toma", :power => 2).count
      if @eq_t == 0
        @eq_t=Equipment.where(:etype => "Toma", :power => 1).count  
        if @eq_t == 0
          @T_status=0
        else
          @opt_t=1
        end
      else
        @opt_t=2
      end
    else
      @opt_t=3
    end
    
    
    #Código de Conectores
    @Co_status = 1
    
    @eco_co=0
    @opt_co=0
    
    @eq_co=Equipment.where(:etype => "Conector", :power => 3).count
    if @eq_co == 0
      @eq_co=Equipment.where(:etype => "Conector", :power => 2).count
      if @eq_co == 0
        @eq_co=Equipment.where(:etype => "Conector", :power => 1).count  
        if @eq_co == 0
          @Co_status=0
        else
          @opt_co=1
        end
      else
        @opt_co=2
      end
    else
      @opt_co=3
    end
    
    #Código de AP
    @Ap_status = 1
    
    @opt_ap=0
    
    @eq_ap=Equipment.where(:etype => "AP", :power => 3).count
    if @eq_ap == 0
      @eq_ap=Equipment.where(:etype => "AP", :power =>2).count
      if @eq_ap == 0
        @eq_ap=Equipment.where(:etype => "AP", :power => 1).count  
        if @eq_ap == 0
          @Ap_status=0
        else
          @opt_ap=1
        end
      else
        @opt_ap=2
      end
    else
      @opt_ap=3
    end
   #Finaliza Cotización
    render  :pdf => "Reporte", :template => 'pdf/final.html.erb'
  end
end