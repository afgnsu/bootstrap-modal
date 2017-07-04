class UsersController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      #format.html do
      #  flash[:warning] = "Template missing"
      #  redirect_to root_path
      #end
      format.js { render template: 'users/modal.js.erb' }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      #format.html do
      #  flash[:warning] = "Template missing"
      #  redirect_to root_path
      #end
      format.js { render template: 'users/modal.js.erb' }
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name)
  end

end
