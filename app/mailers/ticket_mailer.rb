class TicketMailer < ApplicationMailer
  default_from: 'no-reply@checkn.mx'
  def preregister_email(ticket)
    @ticket = ticket
    mail(to: @user.email, subject: 'Tu Boleto para ')
  end
end
