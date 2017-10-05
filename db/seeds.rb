# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
# # require 'open-uri'
# #
# # open("db/cambios") do |codigos|
# #   codigos.read.each_line do |data|
# #     reference = data.chomp
# #     puts reference
# #     Ticket.where(:ticket_reference => reference).update(:ticket_ticketTypeId => 4)
# #   end
# # end
#
# Event.create!(:event_name => "MKT Fest")
# Event.create!(:event_name => "En Sus Marcas")
#
# # Conferencias
# Conference.create!(:conference_name => "Stand up de Chumel Torres (viernes 6 de oct - 8:00 pm)", :conference_capacity => 50, :event_id => 2)
# Conference.create!(:conference_name => "Networking Night (miércoles 4 de oct - 7:00 pm)", :conference_capacity => 150, :event_id => 2)
# Conference.create!(:conference_name => "Actividad Sorpresa (miércoles 4 de oct - 10:00 am)", :conference_capacity => 50, :event_id => 2)
#
# # Conferencias Magistrales
# Conference.create!(:conference_name => "David Castejón - Branding de Experiencia (viernes 6 de oct. - 10:00am)", :conference_capacity => 500, :event_id => 2)
# Conference.create!(:conference_name => "Under Armour - Branding Deportivo (viernes 6 de oct. - 11:30am)", :conference_capacity => 500, :event_id => 2)
# Conference.create!(:conference_name => "Héctor Fernández de Young & Rubicam México (viernes 6 de oct. - 2:30pm)", :conference_capacity => 500, :event_id => 2)
#
# # Experiencias de Marca
# Conference.create!(:conference_name => "Lalo Rodríguez - Runway Town (miércoles 4 de oct. 2:30 pm)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Aaron Cantú (miércoles 4 de oct. 3:30 pm)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Kidzania (jueves 5 de oct. - 10:00 am)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Experiencia de Marca por Anunciar (jueves 5 de oct. - 10:00 am)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Experiencia de Marca por Anunciar (jueves 5 de oct. - 11:30 am)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "André Delgado de Grupo 5 (jueves 5 de oct. - 11:30 am)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Fernando Herrera de Roastbrief (jueves 5 de oct - 2:30pm)", :conference_capacity => 250, :event_id => 2)
# Conference.create!(:conference_name => "Roberto Lee (jueves 5 de oct. - 4:00 pm)", :conference_capacity => 250, :event_id => 2)
#
# #Talleres
# Conference.create!(:conference_name => "Elevator Pitch (miércoles 4 de oct. - 4:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Storytelling de Zam - Nett (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Yo Soy Marca Registrada (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Taller de V09 (jueves 5 de oct. - 4:00 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Conceptualización La Sociedad (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Altavista Studios (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "The New Agency (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Taller por Anunciar (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
# Conference.create!(:conference_name => "Taller por Anunciar (jueves 5 de oct. - 5:30 pm)", :conference_capacity => 30, :event_id => 2)
#
# # Bloques de speedmeetings
# Conference.create!(:conference_name => "Speed Meetings Bloque 1 (miércoles 4 de oct. - 10:00am)", :conference_capacity => 200, :event_id => 2)
# Conference.create!(:conference_name => "Speed Meetings Bloque 2 (miércoles 4 de oct. - 11:00am)", :conference_capacity => 200, :event_id => 2)
# Conference.create!(:conference_name => "Speed Meetings Bloque 3 (miércoles 4 de oct. - 12:00am)", :conference_capacity => 200, :event_id => 2)
#
#
# Conference.create!(:conference_name => "Branding Deportivo Under Armour (miércoles 4 de oct. - 4:00 pm)", :conference_capacity => 250)
# #
# #
# Ticket.create!(:ticket_reference => "abc1", :event_id => 2)
# Ticket.create!(:ticket_reference => "abc2", :event_id => 2)
# Ticket.create!(:ticket_reference => "abc3", :event_id => 2)
# Ticket.create!(:ticket_reference => "abc4", :event_id => 2)
#
# User.create!(:email => "oaguerrero.95@gmail.com", :password => "abc123", :password_confirmation => "abc123")
