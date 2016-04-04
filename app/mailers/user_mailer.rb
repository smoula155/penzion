class UserMailer < ApplicationMailer
  default from: 'notifications@penzionwhitezralok.cz'

   def welcome_email(user)
     @user = user
     @url  = 'http://example.com/login'
     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end

   def new_order(user,order)
     @user = user
     @order = order
     mail(to: @user.email, subject: 'Potvrzení o přijetí objednávky')
   end
end
