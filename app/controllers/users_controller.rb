class UsersController < ApplicationController
  include UsersHelper
  before_action :logged_in_user, only: [:index,:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def new
    @user = User.new
  end
  
  def destroy
    @user = User.find(params[:id])
    if !@user.apply0.nil?
      Apply.find(@user.apply0).destroy
    end
    if !@user.apply1.nil?
      Applya.find(@user.apply1).destroy
    end
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def flipStatus
    if current_user.username == 'root' && current_user.email == 'root'
      @toChange = !User.find(params[:id]).manageFlag
      User.find(params[:id]).update_attribute(:manageFlag,@toChange)
    end
    redirect_to users_path
  end
  
  def index
    if params[:commit]=="Refresh"
      session[:datefilter] = params[:datefilter]
      session[:userSearch] = params[:userSearch]
    end
    @datefilter = session[:datefilter]
    @userSearch = session[:userSearch]
    timeI = getTime(@datefilter)
    @users=User.all
    
    if current_user.username != 'root' || current_user.email != 'root'
      @users = @users.where({manageFlag: [false,nil]})
    else
      @users = @users.where.not("username like ? and email like ?",
                            "root","root")
    end
    
    if (@userSearch != nil?) && (@users != nil?)
      @users = @users.where("username like ? OR email like ?",
                            "%#{@userSearch}%","%#{@userSearch}%")
    end
    if !timeI==nil?
      @users = @users.find_all{|users| users.created_at.to_i<=timeI[1]&&users.created_at.to_i>=timeI[0]}
    end
    
    if params[:commit]=="CheckAll"
      @checkbox  = Array.new
      @users.each do |user|
        @checkbox << user.id.to_s
      end
    else
      @checkbox = params[:checkbox]
    end
    
    if params[:commit]=="delete"
      @checkbox.each do |user_id_str|
        @userToD = User.find(user_id_str.to_i)
        if !@userToD.manageFlag?
          if !@userToD.apply0.nil?
            Apply.find(@userToD.apply0).destroy
          end
          if !@userToD.apply1.nil?
            Applya.find(@userToD.apply1).destroy
          end
          @userToD.destroy
          @users.delete(@userToD)
        end
      end
      flash[:success] = "Users have been deleted"
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "#{@user.username} was successfully created."
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def show
    id = params[:id]
    @user = User.find(id) # look up movie by unique ID
    if !current_user?(@user)
      render 'home/unauthorized'
      return
    end
    if !@user.apply0.nil?
      @apply0 = Apply.find(@user.apply0)
    end
    if !@user.apply1.nil?
      @apply1 = Applya.find(@user.apply1)
    end
    # if !@user.apply2.nil?
    #   @apply2 = Apply.find(@user.apply2)
    # end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def checkProgress
    @user = User.find(params[:id])
    if !current_user?(@user)
      render 'home/unauthorized'
      return
    end
  end
  
  private
    def user_params
    params.require(:user).permit(:username, :email, :password)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
        # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user_manage?
    end
end