class UsersController < ApplicationController
    before_action :require_admin, only: [:ban, :destroy]
    before_action :require_admin_or_owner, only: [:edit, :update]

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

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit
        end
    end

    def resend_confirmation_instructions
        @user = User.find(params[:id])
        unless @user.confirmed?
            @user.resend_confirmation_instructions
            redirect_to @user, notice: "Confirmation was resent"
        else
            redirect_to @user, alert: "User Already Exists!"
        end
    end

    private
        def user_params
            @user = User.find(params[:id])
            list_allowed_params = []
            list_allowed_params += [:name] if current_user.admin? || current_user == @user
            list_allowed_params += [*User::ROLES] if current_user.admin?
            params.require(:user).permit(list_allowed_params)
        end

        def require_admin
            unless current_user.admin?
                redirect_to root_path, alert: "You are not allowed to perform this action!"
            end
        end

        def require_admin_or_owner
            @user = User.find(params[:id])
            unless current_user.admin? || current_user == @user
                redirect_to users_path, alert: "You Are Not Authorized to perform this action!"
            end
            
        end
        
end