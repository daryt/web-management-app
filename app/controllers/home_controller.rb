class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  def index
    if current_user.role == "admin"
      @users = User.where("role <> ?", User.roles[:admin])
      @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
    end
  end

  def welcome_page

  end

end
