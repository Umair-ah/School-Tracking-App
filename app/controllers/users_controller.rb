class UsersController < ApplicationController

    def index
      @users = User.all.order(created_at: :desc)
    end
  
    def show
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, notice: "User is successfully destroyed!"
    end

    def ban
      @user = User.find(params[:id])
      if @user.access_locked?
        @user.unlock_access!
        flash[:notice] = "User Unbanned"
        redirect_to @user
      else
        @user.lock_access!
        flash[:notice] = "User Banned"
        redirect_to @user

      end
      

    end
  
end