class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先指定 gem:deviseメソッド(after_sign_in_path_for)
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # サインアウト後の遷移先指定 gem:deviseメソッド(after_sign_out_path_for)
  def after_sign_out_path_for(resource)
    about_path
  end


  protected
  # nameカラムの保存許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
