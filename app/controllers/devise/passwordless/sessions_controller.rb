# frozen_string_literal: true

class Devise::Passwordless::SessionsController < Devise::SessionsController
  def create
    self.resource = resource_class.where(
      ["lower(username) = '#{params['user']['login']}' OR lower(email) = '#{params['user']['login']}'"]
    ).first
    if self.resource
      resource.send_magic_link(create_params[:remember_me])
      set_flash_message(:notice, :magic_link_sent, now: true)
    else
      set_flash_message(:alert, :not_found_in_database, now: true)
    end

    self.resource = resource_class.new(create_params)
    render :new
  end

  protected

  def translation_scope
    if action_name == "create"
      "devise.passwordless"
    else
      super
    end
  end

  private

  def create_params
    resource_params.permit(:login, :email, :token, :remember_me)
  end
end
