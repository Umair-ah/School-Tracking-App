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
        respond_to do |format|
            format.html{ redirect_to users_path, notice: "User was successfully destroyed!" }
        end
    end

    def ban
        @user = User.find(params[:id])
        if @user.access_locked?
            @user.unlock_access!
        else
            @user.lock_access!
        end
        redirect_to @user, notice: "User Ban Status: #{@user.access_locked?}"
        
    end
end