class PdfController < ApplicationController
  
  def empresa
    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
      @company=Company.find(params[:request_id])
      @request=Request.find(params[:request_id])
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
    
 ip = IPAddress::IPv4.new "172.16.10.1/24"
    
    

    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
      @company=Company.find(params[:request_id])
      @request=Request.find(params[:request_id])
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
    
    render  :pdf => "Reporte", :template => 'pdf/direccionamiento.html.erb'
  end
  def switches
    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
      @company=Company.find(params[:request_id])
      @request=Request.find(params[:request_id])
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
    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
      @company=Company.find(params[:request_id])
      @request=Request.find(params[:request_id])
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
    if params[:id]
      @company=Company.find(params[:id])
      @request=Request.where(:company_id => params[:id]).first
    elsif params[:request_id]
      @company=Company.find(params[:request_id])
      @request=Request.find(params[:request_id])
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
  
end
