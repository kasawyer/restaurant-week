class RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(_resource)
    restaurants_path
  end
end
