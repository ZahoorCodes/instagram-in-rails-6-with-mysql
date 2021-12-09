class UsersController < ApplicationController
    def show
        # byebug
        @user  = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
    end
end
