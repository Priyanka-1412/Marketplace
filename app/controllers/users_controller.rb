class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params #strong params to control input in form

    # respond_to do |format|
      if @user.save  # save user if truthy
        session[:user_id] = @user.id
        redirect_to listings_path
      # Tell the UserMailer to send a welcome email after save
      #   UserMailer.with(user: @user).welcome_email.deliver_now
      #
      #   format.html { redirect_to(root_path, notice: 'User was successfully created.') }
      #   format.json { render json: @user, status: :created, location: @user }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      else
      render :new
      end
    # end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user_path(@current_user.id) # show page
  end

  def listing # action to display post of user
    @user = User.find params[:id]
    @user_list = @user.listings
  end

  def destroy
    user = User.find params[:id]
    user.destroy_all
    redirect_to users_path
  end

  #set strong params for new users and update user details
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :suburb, :postcode)
  end
end
