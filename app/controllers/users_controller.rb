class UsersController < ApplicationController
  before_filter :find_user, only: [:edit,:update]
  
  #load_and_authorize_resource
  
  def index 
    @users = User.all
  end 

  def edit

  end

  def update
    user = params.require(:user).permit([:jmeno,:prijmeni,:email, :admin])
    if @user.update user
      redirect_to users_path, notice: "Uživatel upraven"
    else
      render :edit  
    end  
  end



  private

  def find_user
    @user = User.find(params[:id])
  end
end
