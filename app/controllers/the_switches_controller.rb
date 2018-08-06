class TheSwitchesController < ApplicationController
  before_action :set_the_switch, only: [:show, :edit, :update, :destroy]

  # GET /the_switches
  # GET /the_switches.json
  def index
    @the_switches = TheSwitch.all
  end

  # GET /the_switches/1
  # GET /the_switches/1.json
  def show
  end

  # GET /the_switches/new
  def new
    @the_switch = TheSwitch.new
  end

  # GET /the_switches/1/edit
  def edit
  end

  # POST /the_switches
  # POST /the_switches.json
  def create
    @the_switch = TheSwitch.new(the_switch_params)

    respond_to do |format|
      if @the_switch.save
        format.html { redirect_to @the_switch, notice: 'The switch was successfully created.' }
        format.json { render :show, status: :created, location: @the_switch }
      else
        format.html { render :new }
        format.json { render json: @the_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /the_switches/1
  # PATCH/PUT /the_switches/1.json
  def update
    respond_to do |format|
      if @the_switch.update(the_switch_params)
        format.html { redirect_to @the_switch, notice: 'The switch was successfully updated.' }
        format.json { render :show, status: :ok, location: @the_switch }
      else
        format.html { render :edit }
        format.json { render json: @the_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /the_switches/1
  # DELETE /the_switches/1.json
  def destroy
    @the_switch.destroy
    respond_to do |format|
      format.html { redirect_to the_switches_url, notice: 'The switch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_the_switch
      @the_switch = TheSwitch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def the_switch_params
      params.require(:the_switch).permit(:switches_id, :ports_id)
    end
end
