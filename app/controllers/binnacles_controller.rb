class BinnaclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_binnacle, only: [:show, :destroy]

  # GET /binnacles
  # GET /binnacles.json
  def index
    #@binnacles = Binnacle.all.order(created_at: :desc)
    ## perform a paginated query:
    if params[:spec]=="login"
      @binnacles = Binnacle.where("action = ? or action = ?", "Login", "Logout").order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    elsif params[:spec]=="other"
      @binnacles = Binnacle.where("action = ? ", "Crear").order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    else
      @binnacles = Binnacle.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    end
    # or, use an explicit "per page" limit:
    
    
    ## render page links in the view:
    
  end

  # GET /binnacles/1
  # GET /binnacles/1.json
  def show
  end

  # GET /binnacles/new
  def new
    @binnacle = Binnacle.new
  end

  # GET /binnacles/1/edit
  def edit
  end

  # POST /binnacles
  # POST /binnacles.json
  def create
    @binnacle = Binnacle.new(binnacle_params)

    respond_to do |format|
      if @binnacle.save
        format.html { redirect_to @binnacle, notice: 'Binnacle was successfully created.' }
        format.json { render :show, status: :created, location: @binnacle }
      else
        format.html { render :new }
        format.json { render json: @binnacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /binnacles/1
  # PATCH/PUT /binnacles/1.json
  def update
    respond_to do |format|
      if @binnacle.update(binnacle_params)
        format.html { redirect_to @binnacle, notice: 'Binnacle was successfully updated.' }
        format.json { render :show, status: :ok, location: @binnacle }
      else
        format.html { render :edit }
        format.json { render json: @binnacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /binnacles/1
  # DELETE /binnacles/1.json
  def destroy
    @binnacle.destroy
    respond_to do |format|
      format.html { redirect_to binnacles_url, notice: 'Binnacle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binnacle
      @binnacle = Binnacle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def binnacle_params
      params.require(:binnacle).permit(:user_id, :company_id, :action, :description)
    end
end
