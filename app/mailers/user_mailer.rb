class UserMailer < ApplicationMailer
  default from: 'notifications@penzionwhitezralok.cz'
  DEFAUL_ADRESS = 'whitezralok@atlas.cz'
  #whitezralok@atlas.cz

   def welcome_email(user)
     @user = user
     @url  = 'http://example.com/login'
     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end

   def elaorated_order(order)
     @order = order
     @user = @order.user
     mail(to: @user.email, subject: 'Potvrzení o přijetí objednávky')
   end

   def new_order(order)
     @order = order
     mail(to: DEFAUL_ADRESS, subject: 'Přišla nová objednávka')
   end

   def finished_order(order)
     @order = order
     @user = @order.user
     mail(to:  @user.email, subject: 'Potvrzení o zaplacení objednávky')
   end

   def email_from_contact(email,name,phone,text)
     @name = name
     @email = email
     @phone = phone
     @text = text
        mail(to: DEFAUL_ADRESS, subject: 'Nová zpráva z webu penzionu')
   end
end
