class LogicalsController < ApplicationController
  before_action :set_logical, only: [:show, :edit, :update, :destroy]

  # GET /logicals
  # GET /logicals.json
  def index
    @logicals = Logical.all
  end

  # GET /logicals/1
  # GET /logicals/1.json
  def show
  end

  # GET /logicals/new
  def new
    @rmine=Request.find(params[:request_id])
    @cmine=Company.find(@rmine.company_id)
    if @cmine.user_id == current_user.id
      @logical = Logical.new
    else
      redirect_to root_path
    end
    
  end

  # GET /logicals/1/edit
  def edit
  end

  # POST /logicals
  # POST /logicals.json
  def create
    @logical = Logical.new(logical_params)
    @logical.request_id = params[:request_id]
    respond_to do |format|
      if @logical.save
        format.html { redirect_to @logical, notice: 'Logical was successfully created.' }
        format.json { render :show, status: :created, location: @logical }
      else
        format.html { render :new }
        format.json { render json: @logical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logicals/1
  # PATCH/PUT /logicals/1.json
  def update
    respond_to do |format|
      if @logical.update(logical_params)
        format.html { redirect_to @logical, notice: 'Logical was successfully updated.' }
        format.json { render :show, status: :ok, location: @logical }
      else
        format.html { render :edit }
        format.json { render json: @logical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logicals/1
  # DELETE /logicals/1.json
  def destroy
    @logical.destroy
    respond_to do |format|
      format.html { redirect_to logicals_url, notice: 'Logical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logical
      @logical = Logical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logical_params
      params.require(:logical).permit(:redundancy, :scalability, :subnets, :subnet_description, :scripts, :iptable, :request_id, :host1, :host2, :host3, :host4)
    end
end
