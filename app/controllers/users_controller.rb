class UsersController < ApplicationController

before_action :set_find_id, only: [:edit, :update, :show, :destroy]
  
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:success] = "New user created !"
        redirect_to user_path(@user)
    else
        render 'new'
    end
      
  end
    

  def show
  end

  def edit
  end 

  def update 
    if @user.update(user_params)
      redirect_to home_path
    else
      
      render "edit"
      
    end 
  end 

  def destroy
    @user.destroy
    redirect_to home_path
  end 

  private
  def user_params
      params.require(:user).permit(:email, :password)
  end 

  def set_find_id
    
    @user = User.find(params[:id])
    
  end
end