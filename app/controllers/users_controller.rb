
class UsersController < ApplicationController

  def new
  end

  def create
    if !User.find_by_email(user_signup_params[:email])
       if user_signup_params[:password] == user_signup_params[:password_confirm]
        @user = User.new(user_signup_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
       else
        redirect_to "/"
       end
    else
      render text: "email already assigned to account. Please <a href='sessions/new'>log in.</a>"
    end
  end


  def index
    @users = User.all
  end

  def show
    # @user = User.find(session[:user_id])
    if params[:id] != "show"
      if User.exists?(params[:id])
        @user = User.find(params[:id])
      else
        redirect_to "/"
      end
    else
      @user = User.find(session[:user_id])
    end
  end

  def edit
    @user = User.find(session[:user_id])

  end

  def update
    puts user_update_params
    # if @user = User.find(params[:id])
    #   @user.update_attributes(user_update_params)
    #   redirect_to(:action => 'show', :id => @user.id)
    # else
    #   render('edit')
    # end
  end


  private

  def user_signup_params
    params.permit(:email, :password, :password_confirm)
  end

  def user_update_params
    params.permit(:username, :given_name, :family_name, :email, :address, :phone_number)
  end

end
