class ApplicationController < ActionController::Base
  # Devise redirection after sign in
  def after_sign_in_path_for(resource)
    events_path
  end
end
