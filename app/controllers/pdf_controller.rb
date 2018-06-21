class PdfController < ApplicationController
  
  before_action :authenticate_user!
  def empresa
    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
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
    #if params[:id]
     # @company=Company.find(params[:id])
    #  @request=Request.where(:company_id => params[:id]).first
    #elsif params[:request_id]
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
    #if params[:id]
     # @company=Company.find(params[:id])
    #  @request=Request.where(:company_id => params[:id]).first
    #elsif params[:request_id]
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
      @logical=Logical.where(:request_id => @request.id)
    end
    #totalcomputers=@physical.sum(:computers)
    @Sw_status = 1
    @total_of_computers = @physical.sum(:computers)
    
    #Potencias
    @eco=0
    @est=0
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
    @est_r=0
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
  
    
    
    render  :pdf => "Reporte", :template => 'pdf/cotizacion.html.erb'
  end
  def final
    render  :pdf => "Reporte", :template => 'pdf/final.html.erb'
  end
  
  
end
