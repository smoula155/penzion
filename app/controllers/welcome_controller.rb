class WelcomeController < ApplicationController
  def index
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
