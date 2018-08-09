class SwitchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_switch, only: [:show, :edit, :update, :destroy]

  # GET /switches
  # GET /switches.json
  def index
    @switches = Switch.group(:name)
    
  end

  # GET /switches/1
  # GET /switches/1.json
  def show
    @the_switches = TheSwitch.where(:switches_id => params[:id])
    
  end

  # GET /switches/new
  def new
    @switch = Switch.new
    @ports = Port.all
  end

  # GET /switches/1/edit
  def edit
  end

  # POST /switches
  # POST /switches.json
  def create
    @switch = Switch.new(switch_params)
    @switch.save
    
      if params[:puerto1].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto1], :numberports => params[:puerto1])
        @TheSwitch.save
      end
      if params[:puerto2].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto2], :numberports => params[:puerto2])
        @TheSwitch.save
      end
      if params[:puerto3].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto3], :numberports => params[:puerto3])
        @TheSwitch.save
      end
      if params[:puerto4].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto4], :numberports => params[:puerto4])
        @TheSwitch.save
      end
      if params[:puerto5].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto5], :numberports => params[:puerto5])
        @TheSwitch.save
      end
      if params[:puerto6].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto6], :numberports => params[:puerto6])
        @TheSwitch.save
      end
      if params[:puerto7].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto7], :numberports => params[:puerto7])
        @TheSwitch.save
      end
      if params[:puerto8].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto8], :numberports => params[:puerto8])
        @TheSwitch.save
      end
      if params[:puerto9].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto9], :numberports => params[:puerto9])
        @TheSwitch.save
      end
      if params[:puerto10].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto10], :numberports => params[:puerto10])
        @TheSwitch.save
      end
      if params[:puerto11].to_i > 0
        @TheSwitch=TheSwitch.create(:switches_id => @switch.id, :ports_id => params[:idpuerto11], :numberports => params[:puerto11])
        @TheSwitch.save
      end
    
    redirect_to @switch
  end

  # PATCH/PUT /switches/1
  # PATCH/PUT /switches/1.json
  def update
    respond_to do |format|
      if @switch.update(switch_params)
        format.html { redirect_to @switch, notice: 'Switch was successfully updated.' }
        format.json { render :show, status: :ok, location: @switch }
      else
        format.html { render :edit }
        format.json { render json: @switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /switches/1
  # DELETE /switches/1.json
  def destroy
    @switch.destroy
    respond_to do |format|
      format.html { redirect_to switches_url, notice: 'Switch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_switch
      @switch = Switch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def switch_params
      params.require(:switch).permit(:name, :reference, :price, :nports, :port, :numerodepuertos,
      :puerto1,:puerto2,:puerto3,:puerto4,:puerto5,:puerto6,:puerto7,:puerto8,:puerto9,:puerto10,:puerto11,
      :idpuerto1,:idpuerto2,:idpuerto3,:idpuerto4,:idpuerto5,:idpuerto6,:idpuerto7,:idpuerto8,:idpuerto9,:idpuerto10,:idpuerto11
      
      )
    end
end
