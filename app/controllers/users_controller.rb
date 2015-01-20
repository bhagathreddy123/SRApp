class UsersController < ApplicationController

  def change_password
    # @admin =ClientAdmin.find(params[:id])
    @user = User.find(params[:id])
  end

  def reset_password
    @user = User.find(params[:id])
    @password = params[:user][:password]
    @password_confirmation = params[:user][:password_confirmation]
    @user.errors.add(:password, "Is required") if (params[:user]).nil? or params[:user][:password].to_s.blank?
    if @user.reset_password!(@password, @password_confirmation)
      sign_in(:user, @user ,:bypass => true)
      flash[:notice] = 'Password has reset successfully.'
      redirect_to homes_path
    else
      render :action => 'change_password'
    end
  end

end

