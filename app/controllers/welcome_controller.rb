class WelcomeController < ApplicationController
  def index
    @user = User.first
    UserMailer.welcome_email(@user).deliver_later
  end

  def contact
  end

  def pictures
  	@images = Image.all
  end

  def price_list
    @order = Order.new
  end


end
