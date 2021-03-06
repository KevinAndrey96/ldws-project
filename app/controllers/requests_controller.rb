class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    #@requests = Request.all
    if params[:id]
      @requests = Request.where(:company_id => params[:id])
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  @ismine
  def new
    if params[:company_id]
      @ismine=Company.find(params[:company_id])
      if @ismine.user_id == current_user.id
        @request = Request.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    
    @request.company_id = params[:company_id]
    #@request.company_id = @ismine.user_id
    
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    Physical.where(:request_id => @request.id).destroy_all
    @l=Logical.where(:request_id => @request.id)
    Subnet.where(:logical_id => @l.first.id).destroy_all
    @l.destroy_all
    @request.destroy
    
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Se ha eliminado la solicitud' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :company_id, :description, :objective, :observation, :web, :bd, :aplications, :proxy, :voip, :video_conference, :active_dir, :dhcp, :dns, :ftp, :logical_id, :physical_id, :company_id, :email)
    end
end
