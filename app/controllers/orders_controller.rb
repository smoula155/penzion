class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: :index
  before_filter :find_user, only: [:new, :create]
  before_filter :filtr_by_rooms, only: :create


  def new
    @order = Order.new
  end


  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    
    respond_to do |format|
      if @order.save
        flash[:success] = 'Obědnávka úspěšně vytvořena.'
        format.html { redirect_to orders_path }
        format.json { render :show, status: :created, location: @message }
      else
        flash[:danger] = 'Obědnávka nebyla vytvořena!!'
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

  private

  	def find_user
  		@user = User.new
  		@user = current_user unless current_user.nil?
  	end

    def find_exist_user
      if current_user.nil?
        @user = User.new
      else
        @user = User.find current_user.id 
      end  
    end

    def order_params
      params.require(:order).permit(:from_date, :to_date, :room_id, :price)
    end

    def filtr_by_rooms
      room = Room.find_by_id order_params[:room_id]
      case room.typ
        when *Room::ONE_ROOMS
         orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_room(order_params[:room_id])
        when Room::ROOMS109110
          orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_all_bottom_rooms
        when Room::ROOMSall
          orders = Order.from_date(order_params[:from_date]).to_date(order_params[:from_date]).form_all_rooms  
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
