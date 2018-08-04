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
      :active_dir =>  params[:my_request_active_dir], :dhcp =>  params[:my_request_dhcp], :dns =>  params[:my_request_dns], :ftp =>  params[:my_request_ftp], :email =>  params[:my_request_email],
      :ctype => params[:ctype])
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
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_1], :width => params[:my_physical_width_1],:large => params[:my_physical_large_1],      :computers => params[:my_physical_computers_1], :printers => params[:my_physical_printers_1], :conference_hall => params[:my_physical_conference_hall_1], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_2]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_2], :width => params[:my_physical_width_2],:large => params[:my_physical_large_2],      :computers => params[:my_physical_computers_2], :printers => params[:my_physical_printers_2], :conference_hall => params[:my_physical_conference_hall_2], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_3]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_3], :width => params[:my_physical_width_3],:large => params[:my_physical_large_3],      :computers => params[:my_physical_computers_3], :printers => params[:my_physical_printers_3], :conference_hall => params[:my_physical_conference_hall_3], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_4]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_4], :width => params[:my_physical_width_4],:large => params[:my_physical_large_4],      :computers => params[:my_physical_computers_4], :printers => params[:my_physical_printers_4], :conference_hall => params[:my_physical_conference_hall_4], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_5]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_5], :width => params[:my_physical_width_5],:large => params[:my_physical_large_5],      :computers => params[:my_physical_computers_5], :printers => params[:my_physical_printers_5], :conference_hall => params[:my_physical_conference_hall_5], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_6]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_6], :width => params[:my_physical_width_6],:large => params[:my_physical_large_6],      :computers => params[:my_physical_computers_6], :printers => params[:my_physical_printers_6], :conference_hall => params[:my_physical_conference_hall_6], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_7]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_7], :width => params[:my_physical_width_7],:large => params[:my_physical_large_7],      :computers => params[:my_physical_computers_7], :printers => params[:my_physical_printers_7], :conference_hall => params[:my_physical_conference_hall_7], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_8]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_8], :width => params[:my_physical_width_8],:large => params[:my_physical_large_8],      :computers => params[:my_physical_computers_8], :printers => params[:my_physical_printers_8], :conference_hall => params[:my_physical_conference_hall_8], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_9]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_9], :width => params[:my_physical_width_9],:large => params[:my_physical_large_9],      :computers => params[:my_physical_computers_9], :printers => params[:my_physical_printers_9], :conference_hall => params[:my_physical_conference_hall_9], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_10]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_10], :width => params[:my_physical_width_10],:large => params[:my_physical_large_10],      :computers => params[:my_physical_computers_10], :printers => params[:my_physical_printers_10], :conference_hall => params[:my_physical_conference_hall_10], :building_id => params[:building_id_1])
        @three.save
      end
      if params[:fisico_11]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_11], :width => params[:my_physical_width_11],:large => params[:my_physical_large_11],      :computers => params[:my_physical_computers_11], :printers => params[:my_physical_printers_11], :conference_hall => params[:my_physical_conference_hall_11], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_12]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_12], :width => params[:my_physical_width_12],:large => params[:my_physical_large_12],      :computers => params[:my_physical_computers_12], :printers => params[:my_physical_printers_12], :conference_hall => params[:my_physical_conference_hall_12], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_13]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_13], :width => params[:my_physical_width_13],:large => params[:my_physical_large_13],      :computers => params[:my_physical_computers_13], :printers => params[:my_physical_printers_13], :conference_hall => params[:my_physical_conference_hall_13], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_14]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_14], :width => params[:my_physical_width_14],:large => params[:my_physical_large_14],      :computers => params[:my_physical_computers_14], :printers => params[:my_physical_printers_14], :conference_hall => params[:my_physical_conference_hall_14], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_15]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_15], :width => params[:my_physical_width_15],:large => params[:my_physical_large_15],      :computers => params[:my_physical_computers_15], :printers => params[:my_physical_printers_15], :conference_hall => params[:my_physical_conference_hall_15], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_16]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_16], :width => params[:my_physical_width_16],:large => params[:my_physical_large_16],      :computers => params[:my_physical_computers_16], :printers => params[:my_physical_printers_16], :conference_hall => params[:my_physical_conference_hall_16], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_17]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_17], :width => params[:my_physical_width_17],:large => params[:my_physical_large_17],      :computers => params[:my_physical_computers_17], :printers => params[:my_physical_printers_17], :conference_hall => params[:my_physical_conference_hall_17], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_18]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_18], :width => params[:my_physical_width_18],:large => params[:my_physical_large_18],      :computers => params[:my_physical_computers_18], :printers => params[:my_physical_printers_18], :conference_hall => params[:my_physical_conference_hall_18], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_19]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_19], :width => params[:my_physical_width_19],:large => params[:my_physical_large_19],      :computers => params[:my_physical_computers_19], :printers => params[:my_physical_printers_19], :conference_hall => params[:my_physical_conference_hall_19], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_20]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_20], :width => params[:my_physical_width_20],:large => params[:my_physical_large_20],      :computers => params[:my_physical_computers_20], :printers => params[:my_physical_printers_20], :conference_hall => params[:my_physical_conference_hall_20], :building_id => params[:building_id_2])
        @three.save
      end
      if params[:fisico_21]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_21], :width => params[:my_physical_width_21],:large => params[:my_physical_large_21],      :computers => params[:my_physical_computers_21], :printers => params[:my_physical_printers_21], :conference_hall => params[:my_physical_conference_hall_21], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_22]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_22], :width => params[:my_physical_width_22],:large => params[:my_physical_large_22],      :computers => params[:my_physical_computers_22], :printers => params[:my_physical_printers_22], :conference_hall => params[:my_physical_conference_hall_22], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_23]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_23], :width => params[:my_physical_width_23],:large => params[:my_physical_large_23],      :computers => params[:my_physical_computers_23], :printers => params[:my_physical_printers_23], :conference_hall => params[:my_physical_conference_hall_23], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_24]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_24], :width => params[:my_physical_width_24],:large => params[:my_physical_large_24],      :computers => params[:my_physical_computers_24], :printers => params[:my_physical_printers_24], :conference_hall => params[:my_physical_conference_hall_24], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_25]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_25], :width => params[:my_physical_width_25],:large => params[:my_physical_large_25],      :computers => params[:my_physical_computers_25], :printers => params[:my_physical_printers_25], :conference_hall => params[:my_physical_conference_hall_25], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_26]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_26], :width => params[:my_physical_width_26],:large => params[:my_physical_large_26],      :computers => params[:my_physical_computers_26], :printers => params[:my_physical_printers_26], :conference_hall => params[:my_physical_conference_hall_26], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_27]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_27], :width => params[:my_physical_width_27],:large => params[:my_physical_large_27],      :computers => params[:my_physical_computers_27], :printers => params[:my_physical_printers_27], :conference_hall => params[:my_physical_conference_hall_27], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_28]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_28], :width => params[:my_physical_width_28],:large => params[:my_physical_large_28],      :computers => params[:my_physical_computers_28], :printers => params[:my_physical_printers_28], :conference_hall => params[:my_physical_conference_hall_28], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_29]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_29], :width => params[:my_physical_width_29],:large => params[:my_physical_large_29],      :computers => params[:my_physical_computers_29], :printers => params[:my_physical_printers_29], :conference_hall => params[:my_physical_conference_hall_29], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_30]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_30], :width => params[:my_physical_width_30],:large => params[:my_physical_large_30],      :computers => params[:my_physical_computers_30], :printers => params[:my_physical_printers_30], :conference_hall => params[:my_physical_conference_hall_30], :building_id => params[:building_id_3])
        @three.save
      end
      if params[:fisico_31]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_31], :width => params[:my_physical_width_31],:large => params[:my_physical_large_31],      :computers => params[:my_physical_computers_31], :printers => params[:my_physical_printers_31], :conference_hall => params[:my_physical_conference_hall_31], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_32]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_32], :width => params[:my_physical_width_32],:large => params[:my_physical_large_32],      :computers => params[:my_physical_computers_32], :printers => params[:my_physical_printers_32], :conference_hall => params[:my_physical_conference_hall_32], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_33]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_33], :width => params[:my_physical_width_33],:large => params[:my_physical_large_33],      :computers => params[:my_physical_computers_33], :printers => params[:my_physical_printers_33], :conference_hall => params[:my_physical_conference_hall_33], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_34]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_34], :width => params[:my_physical_width_34],:large => params[:my_physical_large_34],      :computers => params[:my_physical_computers_34], :printers => params[:my_physical_printers_34], :conference_hall => params[:my_physical_conference_hall_34], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_35]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_35], :width => params[:my_physical_width_35],:large => params[:my_physical_large_35],      :computers => params[:my_physical_computers_35], :printers => params[:my_physical_printers_35], :conference_hall => params[:my_physical_conference_hall_35], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_36]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_36], :width => params[:my_physical_width_36],:large => params[:my_physical_large_36],      :computers => params[:my_physical_computers_36], :printers => params[:my_physical_printers_36], :conference_hall => params[:my_physical_conference_hall_36], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_37]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_37], :width => params[:my_physical_width_37],:large => params[:my_physical_large_37],      :computers => params[:my_physical_computers_37], :printers => params[:my_physical_printers_37], :conference_hall => params[:my_physical_conference_hall_37], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_38]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_38], :width => params[:my_physical_width_38],:large => params[:my_physical_large_38],      :computers => params[:my_physical_computers_38], :printers => params[:my_physical_printers_38], :conference_hall => params[:my_physical_conference_hall_38], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_39]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_39], :width => params[:my_physical_width_39],:large => params[:my_physical_large_39],      :computers => params[:my_physical_computers_39], :printers => params[:my_physical_printers_39], :conference_hall => params[:my_physical_conference_hall_39], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_40]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_40], :width => params[:my_physical_width_40],:large => params[:my_physical_large_40],      :computers => params[:my_physical_computers_40], :printers => params[:my_physical_printers_40], :conference_hall => params[:my_physical_conference_hall_40], :building_id => params[:building_id_4])
        @three.save
      end
      if params[:fisico_41]=="true"
        @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_41], :width => params[:my_physical_width_41],:large => params[:my_physical_large_41],      :computers => params[:my_physical_computers_41], :printers => params[:my_physical_printers_41], :conference_hall => params[:my_physical_conference_hall_41], :building_id => params[:building_id_5])
        @three.save
      end
if params[:fisico_42]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_42], :width => params[:my_physical_width_42],:large => params[:my_physical_large_42],      :computers => params[:my_physical_computers_42], :printers => params[:my_physical_printers_42], :conference_hall => params[:my_physical_conference_hall_42], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_43]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_43], :width => params[:my_physical_width_43],:large => params[:my_physical_large_43],      :computers => params[:my_physical_computers_43], :printers => params[:my_physical_printers_43], :conference_hall => params[:my_physical_conference_hall_43], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_44]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_44], :width => params[:my_physical_width_44],:large => params[:my_physical_large_44],      :computers => params[:my_physical_computers_44], :printers => params[:my_physical_printers_44], :conference_hall => params[:my_physical_conference_hall_44], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_45]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_45], :width => params[:my_physical_width_45],:large => params[:my_physical_large_45],      :computers => params[:my_physical_computers_45], :printers => params[:my_physical_printers_45], :conference_hall => params[:my_physical_conference_hall_45], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_46]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_46], :width => params[:my_physical_width_46],:large => params[:my_physical_large_46],      :computers => params[:my_physical_computers_46], :printers => params[:my_physical_printers_46], :conference_hall => params[:my_physical_conference_hall_46], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_47]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_47], :width => params[:my_physical_width_47],:large => params[:my_physical_large_47],      :computers => params[:my_physical_computers_47], :printers => params[:my_physical_printers_47], :conference_hall => params[:my_physical_conference_hall_47], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_48]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_48], :width => params[:my_physical_width_48],:large => params[:my_physical_large_48],      :computers => params[:my_physical_computers_48], :printers => params[:my_physical_printers_48], :conference_hall => params[:my_physical_conference_hall_48], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_49]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_49], :width => params[:my_physical_width_49],:large => params[:my_physical_large_49],      :computers => params[:my_physical_computers_49], :printers => params[:my_physical_printers_49], :conference_hall => params[:my_physical_conference_hall_49], :building_id => params[:building_id_5])
  @three.save
end
if params[:fisico_50]=="true"
  @three=Physical.create(:request_id => params[:my_request_id], :height => params[:my_physical_height_50], :width => params[:my_physical_width_50],:large => params[:my_physical_large_50],      :computers => params[:my_physical_computers_50], :printers => params[:my_physical_printers_50], :conference_hall => params[:my_physical_conference_hall_50], :building_id => params[:building_id_5])
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
      :building_2, :building_id_2, :building_name_2, :building_distance_2,
      :building_3, :building_id_3, :building_name_3, :building_distance_3,
      :building_4, :building_id_4, :building_name_4, :building_distance_4,
      :building_5, :building_id_5, :building_name_5, :building_distance_5,
      :building_6, :building_id_6, :building_name_6, :building_distance_6,
      :building_7, :building_id_7, :building_name_7, :building_distance_7,
      :building_8, :building_id_8, :building_name_8, :building_distance_8,
      :building_9, :building_id_9, :building_name_9, :building_distance_9,
      :building_10, :building_id_10, :building_name_10, :building_distance_10,
       
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
       
      :fisico_11, :my_physical_height_11, :my_physical_width_11, :my_physical_large_11, :my_physical_computers_11, :my_physical_printers_11, :my_physical_conference_hall_11,
      :fisico_12, :my_physical_height_12, :my_physical_width_12, :my_physical_large_12, :my_physical_computers_12, :my_physical_printers_12, :my_physical_conference_hall_12,
      :fisico_13, :my_physical_height_13, :my_physical_width_13, :my_physical_large_13, :my_physical_computers_13, :my_physical_printers_13, :my_physical_conference_hall_13,
      :fisico_14, :my_physical_height_14, :my_physical_width_14, :my_physical_large_14, :my_physical_computers_14, :my_physical_printers_14, :my_physical_conference_hall_14,
      :fisico_15, :my_physical_height_15, :my_physical_width_15, :my_physical_large_15, :my_physical_computers_15, :my_physical_printers_15, :my_physical_conference_hall_15,
      :fisico_16, :my_physical_height_16, :my_physical_width_16, :my_physical_large_16, :my_physical_computers_16, :my_physical_printers_16, :my_physical_conference_hall_16,
      :fisico_17, :my_physical_height_17, :my_physical_width_17, :my_physical_large_17, :my_physical_computers_17, :my_physical_printers_17, :my_physical_conference_hall_17,
      :fisico_18, :my_physical_height_18, :my_physical_width_18, :my_physical_large_18, :my_physical_computers_18, :my_physical_printers_18, :my_physical_conference_hall_18,
      :fisico_19, :my_physical_height_19, :my_physical_width_19, :my_physical_large_19, :my_physical_computers_19, :my_physical_printers_19, :my_physical_conference_hall_19,
      :fisico_20, :my_physical_height_20, :my_physical_width_20, :my_physical_large_20, :my_physical_computers_20, :my_physical_printers_20, :my_physical_conference_hall_20,
      
      :fisico_21, :my_physical_height_21, :my_physical_width_21, :my_physical_large_21, :my_physical_computers_21, :my_physical_printers_21, :my_physical_conference_hall_21,
:fisico_22, :my_physical_height_22, :my_physical_width_22, :my_physical_large_22, :my_physical_computers_22, :my_physical_printers_22, :my_physical_conference_hall_22,
:fisico_23, :my_physical_height_23, :my_physical_width_23, :my_physical_large_23, :my_physical_computers_23, :my_physical_printers_23, :my_physical_conference_hall_23,
:fisico_24, :my_physical_height_24, :my_physical_width_24, :my_physical_large_24, :my_physical_computers_24, :my_physical_printers_24, :my_physical_conference_hall_24,
:fisico_25, :my_physical_height_25, :my_physical_width_25, :my_physical_large_25, :my_physical_computers_25, :my_physical_printers_25, :my_physical_conference_hall_25,
:fisico_26, :my_physical_height_26, :my_physical_width_26, :my_physical_large_26, :my_physical_computers_26, :my_physical_printers_26, :my_physical_conference_hall_26,
:fisico_27, :my_physical_height_27, :my_physical_width_27, :my_physical_large_27, :my_physical_computers_27, :my_physical_printers_27, :my_physical_conference_hall_27,
:fisico_28, :my_physical_height_28, :my_physical_width_28, :my_physical_large_28, :my_physical_computers_28, :my_physical_printers_28, :my_physical_conference_hall_28,
:fisico_29, :my_physical_height_29, :my_physical_width_29, :my_physical_large_29, :my_physical_computers_29, :my_physical_printers_29, :my_physical_conference_hall_29,

:fisico_30, :my_physical_height_30, :my_physical_width_30, :my_physical_large_30, :my_physical_computers_30, :my_physical_printers_30, :my_physical_conference_hall_30,
:fisico_31, :my_physical_height_31, :my_physical_width_31, :my_physical_large_31, :my_physical_computers_31, :my_physical_printers_31, :my_physical_conference_hall_31,
:fisico_32, :my_physical_height_32, :my_physical_width_32, :my_physical_large_32, :my_physical_computers_32, :my_physical_printers_32, :my_physical_conference_hall_32,
:fisico_33, :my_physical_height_33, :my_physical_width_33, :my_physical_large_33, :my_physical_computers_33, :my_physical_printers_33, :my_physical_conference_hall_33,
:fisico_34, :my_physical_height_34, :my_physical_width_34, :my_physical_large_34, :my_physical_computers_34, :my_physical_printers_34, :my_physical_conference_hall_34,
:fisico_35, :my_physical_height_35, :my_physical_width_35, :my_physical_large_35, :my_physical_computers_35, :my_physical_printers_35, :my_physical_conference_hall_35,
:fisico_36, :my_physical_height_36, :my_physical_width_36, :my_physical_large_36, :my_physical_computers_36, :my_physical_printers_36, :my_physical_conference_hall_36,
:fisico_37, :my_physical_height_37, :my_physical_width_37, :my_physical_large_37, :my_physical_computers_37, :my_physical_printers_37, :my_physical_conference_hall_37,
:fisico_38, :my_physical_height_38, :my_physical_width_38, :my_physical_large_38, :my_physical_computers_38, :my_physical_printers_38, :my_physical_conference_hall_38,
:fisico_39, :my_physical_height_39, :my_physical_width_39, :my_physical_large_39, :my_physical_computers_39, :my_physical_printers_39, :my_physical_conference_hall_39,

:fisico_40, :my_physical_height_40, :my_physical_width_40, :my_physical_large_40, :my_physical_computers_40, :my_physical_printers_40, :my_physical_conference_hall_40,
:fisico_41, :my_physical_height_41, :my_physical_width_41, :my_physical_large_41, :my_physical_computers_41, :my_physical_printers_41, :my_physical_conference_hall_41,
:fisico_42, :my_physical_height_42, :my_physical_width_42, :my_physical_large_42, :my_physical_computers_42, :my_physical_printers_42, :my_physical_conference_hall_42,
:fisico_43, :my_physical_height_43, :my_physical_width_43, :my_physical_large_43, :my_physical_computers_43, :my_physical_printers_43, :my_physical_conference_hall_43,
:fisico_44, :my_physical_height_44, :my_physical_width_44, :my_physical_large_44, :my_physical_computers_44, :my_physical_printers_44, :my_physical_conference_hall_44,
:fisico_45, :my_physical_height_45, :my_physical_width_45, :my_physical_large_45, :my_physical_computers_45, :my_physical_printers_45, :my_physical_conference_hall_45,
:fisico_46, :my_physical_height_46, :my_physical_width_46, :my_physical_large_46, :my_physical_computers_46, :my_physical_printers_46, :my_physical_conference_hall_46,
:fisico_47, :my_physical_height_47, :my_physical_width_47, :my_physical_large_47, :my_physical_computers_47, :my_physical_printers_47, :my_physical_conference_hall_47,
:fisico_48, :my_physical_height_48, :my_physical_width_48, :my_physical_large_48, :my_physical_computers_48, :my_physical_printers_48, :my_physical_conference_hall_48,
:fisico_49, :my_physical_height_49, :my_physical_width_49, :my_physical_large_49, :my_physical_computers_49, :my_physical_printers_49, :my_physical_conference_hall_49,

:fisico_50, :my_physical_height_50, :my_physical_width_50, :my_physical_large_50, :my_physical_computers_50, :my_physical_printers_50, :my_physical_conference_hall_50,


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
       
       #:mi_fisico_1,:mi_fisico_2,:mi_fisico_3,:mi_fisico_4,:mi_fisico_5,:mi_fisico_6,:mi_fisico_,:mi_fisico_9,:mi_fisico_10,
       :mi_subnet_1,:mi_subnet_2,:mi_subnet_3,:mi_subnet_4,:mi_subnet_5,:mi_subnet_6,:mi_subnet_,:mi_subnet_9,:mi_subnet_10,
       
       :mi_logical, :mi_company, :ctype
       )
       #Physical.create(:request_id => 1, :height => 12, :width => 13,:large => 15, :computers => 200, :printers => 5, :conference_hall => true, building_id => 1)
    end
end

