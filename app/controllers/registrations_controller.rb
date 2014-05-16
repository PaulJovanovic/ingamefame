class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        render json: {success: true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        render json: {success: true}
      end
    else
      clean_up_passwords resource
      render json: {success: false}
    end
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

end