class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Session redirection methods
  def after_sign_in_path_for(resource)
    register_tickets_path
  end
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
