class TicketMailer < ApplicationMailer
  default from: 'checknmx@gmail.com'
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'
  def preregister_email(ticket)
    @ticket = ticket
    @barcode = Barby::Code128B.new(@ticket.ticket_reference)
    @png = Barby::PngOutputter.new(@barcode).to_png(margin:20, height: 200, xdim: 2)
    attachments.inline["barcode.png"] = @png
    attachments.inline["mkt.png"] = File.read("#{Rails.root}/app/assets/images/mkt.png")
    attachments.inline["barcode.png"] = @png

    asunto = "Tu boleto para #{@ticket.event.event_name}"
    mail(to: @ticket.ticket_email, subject: asunto)
  end
end
