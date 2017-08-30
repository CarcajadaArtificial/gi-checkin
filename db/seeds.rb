# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

open("db/codigos2") do |codigos|
  codigos.read.each_line do |data|
    ticket_type, reference, event_id = data.chomp.split("	")
    puts ticket_type
    puts reference
    puts event_id
    Ticket.create!(:ticket_ticketTypeId => ticket_type, :ticket_reference => reference, :event_id => event_id)
  end
end
