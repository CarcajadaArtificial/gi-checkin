class Conference < ApplicationRecord
  has_many :ticketConferences
  has_many :tickets, through: :ticketConferences
end
