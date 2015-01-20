class WebAdmin::ProfilesController < ApplicationController
 
  def change_password
    @web_admin = WebAdmin.find(params[:id])
  end
  
  def reset_password
    @web_admin = WebAdmin.find(params[:id])
    @password = params[:web_admin][:password]
    @password_confirmation = params[:web_admin][:password_confirmation]
    @web_admin.errors.add(:password, "Is required") if (params[:web_admin]).nil? or params[:web_admin][:password].to_s.blank?
    if @web_admin.reset_password!(@password, @password_confirmation)
      sign_in(:web_admin, @web_admin ,:bypass => true)
      flash[:notice] = 'Password has reset successfully.'
      redirect_to change_password_web_admin_profile_path
    else
      render :action => 'change_password'
    end
  end 
  
  def reset_email
    @web_admin = WebAdmin.find(params[:id])
    if @web_admin.update(profile_params)
      redirect_to web_admin_dashboards_path
    else 
      render :action => 'change_email'
    end
  end
  
  private
  
  def profile_params
    params.require(:web_admin).permit!
  end
end


