class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new]
  before_filter :find_user, only: [:new, :create]
  before_filter :filtr_by_rooms, only: :create


  def new
    @order = Order.new
  end


  def create
    @order = Order.new(order_params)
    @user.update_attributes(user_params)
    @order.user_id = @user.id
    @order.status  = Order::STATUS_NEW
    @order.var_symbol = @order.generate_var_symbol
    respond_to do |format|
      if @order.save
        UserMailer.new_order(@order).deliver_later
        flash[:success] = 'Objednávka úspěšně vytvořena.'
        format.html { redirect_to orders_path }
        format.json { render :show, status: :created, location: @message }
      else
        flash[:danger] = @order.errors.messages.map{|a| a.last}.join
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = Order.for_user(current_user.id)
    end
  end

  def edit
    @order = Order.find params[:id]
    @user = @order.user
  end

   def update
   @order = Order.find params[:id]
    respond_to do |format|
      if @order.update_attributes(order_params_update)
        format.js {}
        format.html { redirect_to orders_path, notice: 'Objednávka byla úspěšně upravena' }
        format.json { head :no_content }
      else
        flash[:danger] = @order.errors.messages.map{|a| a.last}.join
        format.html { redirect_to orders_path}
        format.js{}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { head :no_content }
    end
  end

  private

  	def find_user
  		@user = User.new()
  		@user = current_user unless current_user.nil?
  	end

    def order_params
      params.require(:order).permit(:from_date, :to_date, :room_id, :price)
    end
    def order_params_update
      params.require(:order).permit(:from_date, :to_date, :room_id, :price, :status)
    end

    def user_params
      params.require(:user).permit(:email,:jmeno,:prijmeni,:address,:tel)
    end

    def filtr_by_rooms
      room = Room.find_by_id order_params[:room_id]
      case room.typ
        when *Room::BOTTOM_ROOMS
         orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_bottom(order_params[:room_id])
        when *Room::ONE_ROOMS
         orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_room(order_params[:room_id])
        when Room::ROOMS109110
          orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_all_bottom_rooms
        when Room::ROOMSall
          orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date])
        else
          flash[:danger] = 'Neočekávaná chyba'
          return redirect_to :back
      end

      unless orders.blank?
        flash[:warning] = 'V zadaném rozmezí datumů je již tento apartmán rezervován vyberte jinný rozsah!'
        return redirect_to :back
      end
    end
end
