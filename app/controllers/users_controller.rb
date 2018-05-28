class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def new
		@user = current_user
    	@users = User.all
    	@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if
			@user.update(user_params)
	    	redirect_to user_path(@user.id)
	    else
	    	flash[:notice] = '名前は2文字以上、20文字以内・自己紹介は50文字以内にしてください。'
	    	render :edit
	    end
	end



	private
	def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
	end
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless @user == current_user
	end
end
