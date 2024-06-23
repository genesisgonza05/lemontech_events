# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides reCAPTCHA
      set_minimum_password_length
      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error) # Discard flash to avoid showing it on the next page reload
        render :new
      end
    end
  end
end
