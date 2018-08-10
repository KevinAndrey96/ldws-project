class EthernetsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_ethernet, only: [:show, :edit, :update, :destroy]

  # GET /ethernets
  # GET /ethernets.json
  def index
    @ethernets = Ethernet.all
  end

  # GET /ethernets/1
  # GET /ethernets/1.json
  def show
  end

  # GET /ethernets/new
  def new
    @ethernet = Ethernet.new
  end

  # GET /ethernets/1/edit
  def edit
  end

  # POST /ethernets
  # POST /ethernets.json
  def create
    @ethernet = Ethernet.new(ethernet_params)

    respond_to do |format|
      if @ethernet.save
        format.html { redirect_to @ethernet, notice: 'Ethernet was successfully created.' }
        format.json { render :show, status: :created, location: @ethernet }
      else
        format.html { render :new }
        format.json { render json: @ethernet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ethernets/1
  # PATCH/PUT /ethernets/1.json
  def update
    respond_to do |format|
      if @ethernet.update(ethernet_params)
        format.html { redirect_to @ethernet, notice: 'Ethernet was successfully updated.' }
        format.json { render :show, status: :ok, location: @ethernet }
      else
        format.html { render :edit }
        format.json { render json: @ethernet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ethernets/1
  # DELETE /ethernets/1.json
  def destroy
    @ethernet.destroy
    respond_to do |format|
      format.html { redirect_to ethernets_url, notice: 'Ethernet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ethernet
      @ethernet = Ethernet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ethernet_params
      params.require(:ethernet).permit(:name, :speed, :distance)
    end
end
