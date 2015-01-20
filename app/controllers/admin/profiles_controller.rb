class Admin::ProfilesController < ApplicationController

  def change_password
    @admin = Admin.find(params[:id])
  end

  def reset_password
    @admin = Admin.find(params[:id])
    @password = params[:admin][:password]
    @password_confirmation = params[:admin][:password_confirmation]
    @admin.errors.add(:password, "Is required") if (params[:admin]).nil? or params[:admin][:password].to_s.blank?
    if @admin.reset_password!(@password, @password_confirmation)
      sign_in(:admin, @admin ,:bypass => true)
      flash[:notice] = 'Password has reset successfully.'
      redirect_to admin_dashboards_path
    else
      render :action => 'change_password'
    end
  end
end
