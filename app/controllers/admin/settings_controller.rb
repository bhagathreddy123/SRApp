class Admin::SettingsController < ApplicationController

  def account_details
    @admin = Admin.find(params[:id])
  end
  
  def logo
    @admin = Admin.find(params[:id])
  end
  
  def update_logo
    @admin = Admin.find(params[:id])
    if @admin.update(logo_params)
      flash[:notice] = "Logo added successfully"
      redirect_to admin_settings_path
    else
      render "logo"
    end
  end
  
  def index
    @admin = current_admin
  end
  
  def update
    @admin = Admin.find(params[:id])
    @password = params[:admin][:password]
    @password_confirmation = params[:admin][:password_confirmation]
    @admin.errors.add(:password, "Is required") if (params[:admin]).nil? or params[:admin][:password].to_s.blank?
    if @admin.update(setting_params)
      sign_in(:admin, @admin ,:bypass => true)
      flash[:notice] = 'Password has reset successfully.'
      redirect_to admin_dashboards_path
    else
      render "account_details"
    end
  end
  
  private
  
  def setting_params
    params.require(:admin).permit!
  end 
  
  def logo_params
    params.require(:admin).permit!
  end
end





   
 