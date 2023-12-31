class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
   # @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page:3)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def edit
  #  @user = User.find(params[:id])
  end

  def update
  #  @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to users_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
