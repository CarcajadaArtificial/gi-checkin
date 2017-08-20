  class Ticket < ApplicationRecord
  def createTickets(typeId, quantity)

  end

  def self.searchReference(param_reference)
    self.where(:ticket_reference => param_reference).first
  end

  def self.searchBadge(param_badge)
    self.where(:ticket_badgeNumber => param_badge).first
  end
end
