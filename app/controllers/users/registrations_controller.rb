class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource_name, resource)
    render json: resource
  end

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Signed up.' }
  end

  def register_failed
    render json: { message: "Signed up failure." }
  end
end
