class UsersController < ApplicationController
  before_filter :find_user, only: [:edit,:update]

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def edit

  end

  def update
    user = params.require(:user).permit([:jmeno,:prijmeni,:email,:tel, :address, :admin])
    if @user.update user
      redirect_to users_path, notice: "Uživatel upraven"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end




  private

  def find_user
    @user = User.find(params[:id])
  end
end
