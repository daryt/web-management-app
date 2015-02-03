
module Admin

  class UsersController < AdminController
    respond_to :js, :html, :json
  
    before_filter :find_user, :only => [:show, :update, :edit, :destroy]
  
    def index
      @users = User.all
      @users = Kaminari.paginate_array(@users).page(params[:page]).per(10)
    end
  

    def show
    end

    def edit
    end
  
    def update
      #if @user.update_attributes(params[:user])
      if @user.update(user_params)
        redirect_to root_path, :notice => "User Details updated."
      else
        redirect_to root_path, :alert => "Unable to update user."
      end
    end
  
    def destroy
      unless @user == current_user
        @user.destroy
        redirect_to admin_users_path, :notice => "User deleted."
      else
        redirect_to admin_users_path, :notice => "Can't delete yourself."
      end
    end
  
    private
  
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation, :first_name, :last_name)
    end
    
  end

end
