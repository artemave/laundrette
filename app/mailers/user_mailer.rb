class UserMailer < ActionMailer::Base
  layout 'mailer'

  default from: "system@laundrette.herokuapp.com"

  def orders_due_soon_or_overdue_email(user, orders)
    @user = user
    @orders = orders
    mail to: user.email,
      subject: 'These orders are due soon or overdue'
  end
end
