class UserMailer < ApplicationMailer
  default from: 'Ez2Code'

  def order_email(user, product)
    @user = user
    @product = product
    @url  = 'http://exemplo.com/login'
    mail(to: user.email, subject: 'Order Confirmation from ez2code')
  end
end
