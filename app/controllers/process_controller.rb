class ProcessController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:new]=="false"
      @id=params[:id]
      @company=Company.find(@id)
    elsif params[:edit]=="true"
      id=params[:id]
      @request=Request.find(id)
      @company=Company.find(@request.company.id)
      @physicals=Physical.where(:request_id => id)
      @logical=Logical.where(:request_id => id).first
      @subnets=Subnet.where(:logical_id => @logical.id)
    end
      
  end

  def create
    
    if params[:otra_solicitud] == "false"
      @one=Company.create(:id => params[:my_company_id], :name => params[:name], :user_id => current_user.id, :nit =>  params[:nit], :cell =>  params[:cell], :phone =>  params[:phone], :email =>  params[:email])
      @one.save
      
      @two=Request.create(:id => params[:my_request_id], :title => params[:my_request_title], :company_id => params[:my_company_id] , :description =>  params[:my_request_description],
      :objective => params[:my_request_objective], :observation =>  params[:my_request_observation], :web =>  params[:my_request_web], :bd =>  params[:my_request_bd],
      :aplications =>  params[:my_request_aplications], :proxy =>  params[:my_request_proxy], :voip =>  params[:my_request_voip], :video_conference =>  params[:my_request_video_conference], 
      :active_dir =>  params[:my_request_active_dir], :dhcp =>  params[:my_request_dhcp], :dns =>  params[:my_request_dns], :ftp =>  params[:my_request_ftp], :email =>  params[:my_request_email])
      @two.save
      
      if params[:building_1]=="true"
        @six=Building.create(:id => params[:building_id_1], :name => params[:building_name_1], :distance => params[:building_distance_1], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_2]=="true"
        @six=Building.create(:id => params[:building_id_2], :name => params[:building_name_2], :distance => params[:building_distance_2], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_3]=="true"
        @six=Building.create(:id => params[:building_id_3], :name => params[:building_name_3], :distance => params[:building_distance_3], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_4]=="true"
        @six=Building.create(:id => params[:building_id_4], :name => params[:building_name_4], :distance => params[:building_distance_4], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_5]=="true"
        @six=Building.create(:id => params[:building_id_5], :name => params[:building_name_5], :distance => params[:building_distance_5], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_6]=="true"
        @six=Building.create(:id => params[:building_id_6], :name => params[:building_name_6], :distance => params[:building_distance_6], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_7]=="true"
        @six=Building.create(:id => params[:building_id_7], :name => params[:building_name_7], :distance => params[:building_distance_7], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_8]=="true"
        @six=Building.create(:id => params[:building_id_8], :name => params[:building_name_8], :distance => params[:building_distance_8], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_9]=="true"
        @six=Building.create(:id => params[:building_id_9], :name => params[:building_name_9], :distance => params[:building_distance_9], :request_id => params[:my_request_id])
        @six.save
      end
      if params[:building_10]=="true"
        @six=Building.create(:id => params[:building_id_10], :name => params[:building_name_10], :distance => params[:building_distance_10], :request_id => params[:my_request_id])
        @six.save
      end
      
      
      
      
      
      if params[:fisico_1]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_1], :width => params[:my_physical_width_1],:large => params[:my_physical_large_1],      :computers => params[:my_physical_computers_1], :printers => params[:my_physical_printers_1], :conference_hall => params[:my_physical_conference_hall_1])
        @three.save
      end
      if params[:fisico_2]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_2], :width => params[:my_physical_width_2],:large => params[:my_physical_large_2],      :computers => params[:my_physical_computers_2], :printers => params[:my_physical_printers_2], :conference_hall => params[:my_physical_conference_hall_2])
        @three.save
      end
      if params[:fisico_3]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_3], :width => params[:my_physical_width_3],:large => params[:my_physical_large_3],      :computers => params[:my_physical_computers_3], :printers => params[:my_physical_printers_3], :conference_hall => params[:my_physical_conference_hall_3])
        @three.save
      end
      if params[:fisico_4]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_4], :width => params[:my_physical_width_4],:large => params[:my_physical_large_4],      :computers => params[:my_physical_computers_4], :printers => params[:my_physical_printers_4], :conference_hall => params[:my_physical_conference_hall_4])
        @three.save
      end
      if params[:fisico_5]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_5], :width => params[:my_physical_width_5],:large => params[:my_physical_large_5],      :computers => params[:my_physical_computers_5], :printers => params[:my_physical_printers_5], :conference_hall => params[:my_physical_conference_hall_5])
        @three.save
      end
      if params[:fisico_6]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_6], :width => params[:my_physical_width_6],:large => params[:my_physical_large_6],      :computers => params[:my_physical_computers_6], :printers => params[:my_physical_printers_6], :conference_hall => params[:my_physical_conference_hall_6])
        @three.save
      end
      if params[:fisico_7]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_7], :width => params[:my_physical_width_7],:large => params[:my_physical_large_7],      :computers => params[:my_physical_computers_7], :printers => params[:my_physical_printers_7], :conference_hall => params[:my_physical_conference_hall_7])
        @three.save
      end
      if params[:fisico_8]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_8], :width => params[:my_physical_width_8],:large => params[:my_physical_large_8],      :computers => params[:my_physical_computers_8], :printers => params[:my_physical_printers_8], :conference_hall => params[:my_physical_conference_hall_8])
        @three.save
      end
      if params[:fisico_9]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_9], :width => params[:my_physical_width_9],:large => params[:my_physical_large_9],      :computers => params[:my_physical_computers_9], :printers => params[:my_physical_printers_9], :conference_hall => params[:my_physical_conference_hall_9])
        @three.save
      end
      if params[:fisico_10]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_10], :width => params[:my_physical_width_10],:large => params[:my_physical_large_10],      :computers => params[:my_physical_computers_10], :printers => params[:my_physical_printers_10], :conference_hall => params[:my_physical_conference_hall_10])
        @three.save
      end
      
      @four=Logical.create(:id => params[:my_logical_id], :request_id => params[:my_request_id], :host1 => params[:my_logical_host1], :host2 => params[:my_logical_host2], :host3 => params[:my_logical_host3], :host4 => params[:my_logical_host4],
      :redundancy => params[:my_logical_redundancy], :scalability => params[:my_logical_scalability], :security => params[:my_logical_security])
      
      if params[:subnet_1]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_1], :description => params[:my_subnet_description_1], :computers => params[:my_subnet_computers_1], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_2]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_2], :description => params[:my_subnet_description_2], :computers => params[:my_subnet_computers_2], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_3]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_3], :description => params[:my_subnet_description_3], :computers => params[:my_subnet_computers_3], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_4]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_4], :description => params[:my_subnet_description_4], :computers => params[:my_subnet_computers_4], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_5]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_5], :description => params[:my_subnet_description_5], :computers => params[:my_subnet_computers_5], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_6]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_6], :description => params[:my_subnet_description_6], :computers => params[:my_subnet_computers_6], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_7]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_7], :description => params[:my_subnet_description_7], :computers => params[:my_subnet_computers_7], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_8]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_8], :description => params[:my_subnet_description_8], :computers => params[:my_subnet_computers_8], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_9]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_9], :description => params[:my_subnet_description_9], :computers => params[:my_subnet_computers_9], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_10]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_10], :description => params[:my_subnet_description_10], :computers => params[:my_subnet_computers_10], :logical_id => params[:my_logical_id])
        @five.save
      end
      
      
      @b=Binnacle.create(:user_id => current_user.id, :action => "Crear" , :description => "Se ha creado una solicitud completa (Con Empresa)", :company_id => @one.id)
      @b.save
    elsif params[:otra_solicitud] == "true"
      #@one=Company.create(:id => params[:my_company_id], :name => params[:name], :user_id => current_user.id, :nit =>  params[:nit], :mision =>  params[:mision], :vision =>  params[:vision])
      #@one.save
      
      @two=Request.create(:id => params[:my_request_id], :title => params[:my_request_title], :company_id => params[:my_company_id] , :description =>  params[:my_request_description],
      :objective => params[:my_request_objective], :observation =>  params[:my_request_observation], :web =>  params[:my_request_web], :bd =>  params[:my_request_bd],
      :aplications =>  params[:my_request_aplications], :proxy =>  params[:my_request_proxy], :voip =>  params[:my_request_voip], :video_conference =>  params[:my_request_video_conference], 
      :active_dir =>  params[:my_request_active_dir], :dhcp =>  params[:my_request_dhcp], :dns =>  params[:my_request_dns], :ftp =>  params[:my_request_ftp], :email =>  params[:my_request_email])
      @two.save
      
      if params[:fisico_1]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_1], :width => params[:my_physical_width_1],:large => params[:my_physical_large_1],      :computers => params[:my_physical_computers_1], :printers => params[:my_physical_printers_1], :conference_hall => params[:my_physical_conference_hall_1])
        @three.save
      end
      if params[:fisico_2]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_2], :width => params[:my_physical_width_2],:large => params[:my_physical_large_2],      :computers => params[:my_physical_computers_2], :printers => params[:my_physical_printers_2], :conference_hall => params[:my_physical_conference_hall_2])
        @three.save
      end
      if params[:fisico_3]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_3], :width => params[:my_physical_width_3],:large => params[:my_physical_large_3],      :computers => params[:my_physical_computers_3], :printers => params[:my_physical_printers_3], :conference_hall => params[:my_physical_conference_hall_3])
        @three.save
      end
      if params[:fisico_4]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_4], :width => params[:my_physical_width_4],:large => params[:my_physical_large_4],      :computers => params[:my_physical_computers_4], :printers => params[:my_physical_printers_4], :conference_hall => params[:my_physical_conference_hall_4])
        @three.save
      end
      if params[:fisico_5]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_5], :width => params[:my_physical_width_5],:large => params[:my_physical_large_5],      :computers => params[:my_physical_computers_5], :printers => params[:my_physical_printers_5], :conference_hall => params[:my_physical_conference_hall_5])
        @three.save
      end
      if params[:fisico_6]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_6], :width => params[:my_physical_width_6],:large => params[:my_physical_large_6],      :computers => params[:my_physical_computers_6], :printers => params[:my_physical_printers_6], :conference_hall => params[:my_physical_conference_hall_6])
        @three.save
      end
      if params[:fisico_7]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_7], :width => params[:my_physical_width_7],:large => params[:my_physical_large_7],      :computers => params[:my_physical_computers_7], :printers => params[:my_physical_printers_7], :conference_hall => params[:my_physical_conference_hall_7])
        @three.save
      end
      if params[:fisico_8]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_8], :width => params[:my_physical_width_8],:large => params[:my_physical_large_8],      :computers => params[:my_physical_computers_8], :printers => params[:my_physical_printers_8], :conference_hall => params[:my_physical_conference_hall_8])
        @three.save
      end
      if params[:fisico_9]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_9], :width => params[:my_physical_width_9],:large => params[:my_physical_large_9],      :computers => params[:my_physical_computers_9], :printers => params[:my_physical_printers_9], :conference_hall => params[:my_physical_conference_hall_9])
        @three.save
      end
      if params[:fisico_10]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_10], :width => params[:my_physical_width_10],:large => params[:my_physical_large_10],      :computers => params[:my_physical_computers_10], :printers => params[:my_physical_printers_10], :conference_hall => params[:my_physical_conference_hall_10])
        @three.save
      end
      
      @four=Logical.create(:id => params[:my_logical_id], :request_id => params[:my_request_id], :host1 => params[:my_logical_host1], :host2 => params[:my_logical_host2], :host3 => params[:my_logical_host3], :host4 => params[:my_logical_host4],
      :redundancy => params[:my_logical_redundancy], :scalability => params[:my_logical_scalability], :security => params[:my_logical_security])
      
      if params[:subnet_1]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_1], :description => params[:my_subnet_description_1], :computers => params[:my_subnet_computers_1], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_2]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_2], :description => params[:my_subnet_description_2], :computers => params[:my_subnet_computers_2], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_3]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_3], :description => params[:my_subnet_description_3], :computers => params[:my_subnet_computers_3], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_4]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_4], :description => params[:my_subnet_description_4], :computers => params[:my_subnet_computers_4], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_5]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_5], :description => params[:my_subnet_description_5], :computers => params[:my_subnet_computers_5], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_6]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_6], :description => params[:my_subnet_description_6], :computers => params[:my_subnet_computers_6], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_7]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_7], :description => params[:my_subnet_description_7], :computers => params[:my_subnet_computers_7], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_8]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_8], :description => params[:my_subnet_description_8], :computers => params[:my_subnet_computers_8], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_9]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_9], :description => params[:my_subnet_description_9], :computers => params[:my_subnet_computers_9], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_10]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_10], :description => params[:my_subnet_description_10], :computers => params[:my_subnet_computers_10], :logical_id => params[:my_logical_id])
        @five.save
      end
      
      
      @b=Binnacle.create(:user_id => current_user.id, :action => "Crear" , :description => "Se ha creado una solicitud completa (Con Empresa)", :company_id => params[:my_company_id])
      @b.save
      
    elsif params[:otra_solicitud] == "edit"
      @two=Request.update(params[:my_request_id], :title => params[:my_request_title], :description =>  params[:my_request_description],
      :objective => params[:my_request_objective], :observation =>  params[:my_request_observation], :web =>  params[:my_request_web], :bd =>  params[:my_request_bd],
      :aplications =>  params[:my_request_aplications], :proxy =>  params[:my_request_proxy], :voip =>  params[:my_request_voip], :video_conference =>  params[:my_request_video_conference], 
      :active_dir =>  params[:my_request_active_dir], :dhcp =>  params[:my_request_dhcp], :dns =>  params[:my_request_dns], :ftp =>  params[:my_request_ftp], :email =>  params[:my_request_email])
      @two.save
      
      @three=Physical.where(:request_id => params[:my_request_id])
      @three.destroy_all
      
      if params[:fisico_1]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_1], :width => params[:my_physical_width_1],:large => params[:my_physical_large_1],      :computers => params[:my_physical_computers_1], :printers => params[:my_physical_printers_1], :conference_hall => params[:my_physical_conference_hall_1])
        @three.save
      end
      if params[:fisico_2]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_2], :width => params[:my_physical_width_2],:large => params[:my_physical_large_2],      :computers => params[:my_physical_computers_2], :printers => params[:my_physical_printers_2], :conference_hall => params[:my_physical_conference_hall_2])
        @three.save
      end
      if params[:fisico_3]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_3], :width => params[:my_physical_width_3],:large => params[:my_physical_large_3],      :computers => params[:my_physical_computers_3], :printers => params[:my_physical_printers_3], :conference_hall => params[:my_physical_conference_hall_3])
        @three.save
      end
      if params[:fisico_4]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_4], :width => params[:my_physical_width_4],:large => params[:my_physical_large_4],      :computers => params[:my_physical_computers_4], :printers => params[:my_physical_printers_4], :conference_hall => params[:my_physical_conference_hall_4])
        @three.save
      end
      if params[:fisico_5]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_5], :width => params[:my_physical_width_5],:large => params[:my_physical_large_5],      :computers => params[:my_physical_computers_5], :printers => params[:my_physical_printers_5], :conference_hall => params[:my_physical_conference_hall_5])
        @three.save
      end
      if params[:fisico_6]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_6], :width => params[:my_physical_width_6],:large => params[:my_physical_large_6],      :computers => params[:my_physical_computers_6], :printers => params[:my_physical_printers_6], :conference_hall => params[:my_physical_conference_hall_6])
        @three.save
      end
      if params[:fisico_7]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_7], :width => params[:my_physical_width_7],:large => params[:my_physical_large_7],      :computers => params[:my_physical_computers_7], :printers => params[:my_physical_printers_7], :conference_hall => params[:my_physical_conference_hall_7])
        @three.save
      end
      if params[:fisico_8]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_8], :width => params[:my_physical_width_8],:large => params[:my_physical_large_8],      :computers => params[:my_physical_computers_8], :printers => params[:my_physical_printers_8], :conference_hall => params[:my_physical_conference_hall_8])
        @three.save
      end
      if params[:fisico_9]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_9], :width => params[:my_physical_width_9],:large => params[:my_physical_large_9],      :computers => params[:my_physical_computers_9], :printers => params[:my_physical_printers_9], :conference_hall => params[:my_physical_conference_hall_9])
        @three.save
      end
      if params[:fisico_10]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_10], :width => params[:my_physical_width_10],:large => params[:my_physical_large_10],      :computers => params[:my_physical_computers_10], :printers => params[:my_physical_printers_10], :conference_hall => params[:my_physical_conference_hall_10])
        @three.save
      end
      
      @four=Logical.update(params[:mi_logical], :id => params[:my_logical_id], :request_id => params[:my_request_id], :host1 => params[:my_logical_host1], :host2 => params[:my_logical_host2], :host3 => params[:my_logical_host3], :host4 => params[:my_logical_host4],
      :redundancy => params[:my_logical_redundancy], :scalability => params[:my_logical_scalability], :security => params[:my_logical_security])
      
      Subnet.where(:logical_id => params[:mi_company]).destroy_all
      
      if params[:subnet_1]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_1], :description => params[:my_subnet_description_1], :computers => params[:my_subnet_computers_1], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_2]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_2], :description => params[:my_subnet_description_2], :computers => params[:my_subnet_computers_2], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_3]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_3], :description => params[:my_subnet_description_3], :computers => params[:my_subnet_computers_3], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_4]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_4], :description => params[:my_subnet_description_4], :computers => params[:my_subnet_computers_4], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_5]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_5], :description => params[:my_subnet_description_5], :computers => params[:my_subnet_computers_5], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_6]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_6], :description => params[:my_subnet_description_6], :computers => params[:my_subnet_computers_6], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_7]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_7], :description => params[:my_subnet_description_7], :computers => params[:my_subnet_computers_7], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_8]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_8], :description => params[:my_subnet_description_8], :computers => params[:my_subnet_computers_8], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_9]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_9], :description => params[:my_subnet_description_9], :computers => params[:my_subnet_computers_9], :logical_id => params[:my_logical_id])
        @five.save
      end
      if params[:subnet_10]=="true"
        @five=Subnet.create(:name => params[:my_subnet_name_10], :description => params[:my_subnet_description_10], :computers => params[:my_subnet_computers_10], :logical_id => params[:my_logical_id])
        @five.save
      end
      
      
      @b=Binnacle.create(:user_id => current_user.id, :action => "Edición" , :description => "Se ha editado una solicitud", :company_id => params[:mi_company])
      @b.save
    end
      
    
    
    redirect_to panel_index_path(:request_id => params[:my_request_id])
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def process_params
      params.permit(
       :my_company_id, :name, :nit, :cell, :phone, :email,
        
       :my_request_id, :my_request_title, :my_request_description, :my_request_objective, :my_request_observation, :my_request_web,
       :my_request_bd, :my_request_aplications, :my_request_proxy, :my_request_voip, :my_request_video_conference, :my_request_active_dir, :my_request_dhcp, :my_request_dns, :my_request_ftp,
       :my_request_email,
       
       :building_1, :building_id_1, :building_name_1, :building_distance_1,
       
       #request_id: 3, height: 4, width: 3, large: 10, computers: 120, printers: 5, conference_hall: false,
       :fisico_1, :my_physical_height_1, :my_physical_width_1, :my_physical_large_1, :my_physical_computers_1, :my_physical_printers_1, :my_physical_conference_hall_1,
       :fisico_2, :my_physical_height_2, :my_physical_width_2, :my_physical_large_2, :my_physical_computers_2, :my_physical_printers_2, :my_physical_conference_hall_2,
       :fisico_3, :my_physical_height_3, :my_physical_width_3, :my_physical_large_3, :my_physical_computers_3, :my_physical_printers_3, :my_physical_conference_hall_3,
       :fisico_4, :my_physical_height_4, :my_physical_width_4, :my_physical_large_4, :my_physical_computers_4, :my_physical_printers_4, :my_physical_conference_hall_4,
       :fisico_5, :my_physical_height_5, :my_physical_width_5, :my_physical_large_5, :my_physical_computers_5, :my_physical_printers_5, :my_physical_conference_hall_5,
       :fisico_6, :my_physical_height_6, :my_physical_width_6, :my_physical_large_6, :my_physical_computers_6, :my_physical_printers_6, :my_physical_conference_hall_6,
       :fisico_7, :my_physical_height_7, :my_physical_width_7, :my_physical_large_7, :my_physical_computers_7, :my_physical_printers_7, :my_physical_conference_hall_7,
       :fisico_8, :my_physical_height_8, :my_physical_width_8, :my_physical_large_8, :my_physical_computers_8, :my_physical_printers_8, :my_physical_conference_hall_8,
       :fisico_9, :my_physical_height_9, :my_physical_width_9, :my_physical_large_9, :my_physical_computers_9, :my_physical_printers_9, :my_physical_conference_hall_9,
       :fisico_10, :my_physical_height_10, :my_physical_width_10, :my_physical_large_10, :my_physical_computers_10, :my_physical_printers_10, :my_physical_conference_hall_10,
       
       :my_logical_id, :my_logical_host1, :my_logical_host2, :my_logical_host3, :my_logical_host4, :my_logical_redundancy, :my_logical_scalability, :my_logical_security,
       
       :subnet_1, :my_subnet_name_1, :my_subnet_description_1, :my_subnet_computers_1,
       :subnet_2, :my_subnet_name_2, :my_subnet_description_2, :my_subnet_computers_2,
       :subnet_3, :my_subnet_name_3, :my_subnet_description_3, :my_subnet_computers_3,
       :subnet_4, :my_subnet_name_4, :my_subnet_description_4, :my_subnet_computers_4,
       :subnet_5, :my_subnet_name_5, :my_subnet_description_5, :my_subnet_computers_5,
       :subnet_6, :my_subnet_name_6, :my_subnet_description_6, :my_subnet_computers_6,
       :subnet_7, :my_subnet_name_7, :my_subnet_description_7, :my_subnet_computers_7,
       :subnet_8, :my_subnet_name_8, :my_subnet_description_8, :my_subnet_computers_8,
       :subnet_9, :my_subnet_name_9, :my_subnet_description_9, :my_subnet_computers_9,
       :subnet_10, :my_subnet_name_10, :my_subnet_description_10, :my_subnet_computers_10,
       
       :otra_solicitud,
       
       :mi_fisico_1,:mi_fisico_2,:mi_fisico_3,:mi_fisico_4,:mi_fisico_5,:mi_fisico_6,:mi_fisico_,:mi_fisico_9,:mi_fisico_10,
       :mi_subnet_1,:mi_subnet_2,:mi_subnet_3,:mi_subnet_4,:mi_subnet_5,:mi_subnet_6,:mi_subnet_,:mi_subnet_9,:mi_subnet_10,
       
       :mi_logical, :mi_company
       )
       #Physical.create(:request_id => 1, :height => 12, :width => 13,:large => 15, :computers => 200, :printers => 5, :conference_hall => true, building_id => 1)
    end
end

