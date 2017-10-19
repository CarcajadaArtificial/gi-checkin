class TicketMailer < ApplicationMailer
  default from: 'no-reply@checkn.mx'
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'

  def preregister_email(ticket)
    @ticket = ticket
    @barcode = Barby::Code128B.new(@ticket.ticket_reference)
    @png = Barby::PngOutputter.new(@barcode).to_png(margin:0, height: 200, xdim: 3)
    attachments.inline["barcode.png"] = @png
    if @ticket.event.id == 1
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/mkt.png")
    elsif @ticket.event.id == 2
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/esm.png")
    elsif @ticket.event.id == 3
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/impulso.png")
    elsif @ticket.event.id == 4
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/edifica.png")
    end
    attachments.inline["logo2.png"] = File.read("#{Rails.root}/app/assets/images/logo2.png")

    asunto = "Tu boleto para #{@ticket.event.event_name}"
    mail(to: @ticket.ticket_email, subject: asunto)
  end
  def reminder_email(ticket)
    @ticket = ticket
    @barcode = Barby::Code128B.new(@ticket.ticket_reference)
    @png = Barby::PngOutputter.new(@barcode).to_png(margin:0, height: 200, xdim: 3)
    attachments.inline["barcode.png"] = @png
    if @ticket.event.id == 1
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/mkt.png")
    elsif @ticket.event.id == 2
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/esm.png")
    elsif @ticket.event.id == 3
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/impulso.png")
    elsif @ticket.event.id == 4
      attachments.inline["logo_event.png"] = File.read("#{Rails.root}/app/assets/images/edifica.png")
    end
    attachments.inline["logo2.png"] = File.read("#{Rails.root}/app/assets/images/logo2.png")
    asunto = "¡Arranca #{@ticket.event.event_name}!"
    if @conference1 != ""
      @conference1 = "HOLA"
    end
    mail(to: @ticket.ticket_email, subject: asunto)
  end
end
