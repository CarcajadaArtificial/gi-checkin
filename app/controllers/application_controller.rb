class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Session redirection methods
  def after_sign_in_path_for(resource)
    if current_user.event_id == 3
    impulso_dashboard_tickets_path
    elsif current_user.event_id == 4
    edifica_dashboard_tickets_path
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
