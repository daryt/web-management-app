class AdminController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_admin!

  #layout 'admin'

  def authenticate_admin!
    unless current_user.present? && current_user.admin?
      flash[:error] = 'Access Denied!'
      redirect_to root_path
    end
  end

end
