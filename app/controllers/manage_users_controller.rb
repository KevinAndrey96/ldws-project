class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  before_action:set_user, only: [:create,:show, :edit, :update, :destroy, :delete]
  def index
    @users = User.all
  end
  
  def new
    @user= User.new
  end
  
  def show
    @user= User.find(params[:id])
  end
  
  def edit
    @user= User.find(params[:id])
  end
  
  def create
    @user= User.new(user_params)
    #@user.zone=current_user.zone
      respond_to do |format|
        if @user.save
    format.html { redirect_to manage_users_path, notice: 'Client was successfully destroyed.' }
    format.json { render:show, status: :created, location: @user }
        else
    format.html { render:new }
    format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    
  end
   
    def update
      respond_to do |format|
        @user= User.find(params[:id])
        if @user.update(user_params)
          format.html { redirect_to manage_users_path, notice: 'El Usuario se ha actualizado satisfactoriamente' }
          format.json { render:show, status: :ok, location: @user }
        else
          format.html { render:edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @user= User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to manage_users_path, notice: 'Eliminado satisfactoriamente' }
        format.json { head :no_content }
      end
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id]==""
        @user= User.find(params[:id])
      else
        @user=User.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:email, :role, :name, :phone, :password, :password_confirmation)
    end

end