class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root
    else
      render 'edit'
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|git
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.username}!"
        redirect_to(user_path(@user))
      else
        render 'new'
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
