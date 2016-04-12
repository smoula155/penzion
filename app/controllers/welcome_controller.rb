class WelcomeController < ApplicationController
  def index
  end

  def contact
  end

  def conditions
  end

  def pictures
  	@images = Image.all
  end

  def price_list
    @order = Order.new
  end

  def send_mail
    UserMailer.email_from_contact(params[:email],params[:name],params[:phone],params[:text]).deliver_later
    flash[:success] = 'Email byl odeslán.'
    render :index
  end


end
