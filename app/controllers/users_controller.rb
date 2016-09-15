class UsersController < ApplicationController
  before_action :signed_in?, only: :destroy

  def destroy
    current_user.destroy
    flash[:success] = 'Your Account deleted successfully!'
    redirect_to new_user_session_path
  end
end
