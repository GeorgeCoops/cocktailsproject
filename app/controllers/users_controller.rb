class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid? 
            @user.save 
            redirect_to @user 
        else
            redirect_to new_user_path 
        end
    end 

    def show
        @user = User.find(params[:id])
        @cocktails = @user.cocktails
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :age, :location, :favourite_cocktail, :email, :password, :password_confirmation) 
    end



end
