class Admin::AttendancesController < ApplicationController

  def new
 @user = User.find(params[:id])
    @user.admin_id = current_admin.id
       @attendence = Attendance.new
    render :layout => false
#    @user_id = params[:user_id]
#    @batch_id = params[:batch_id]
#    @subject_id = params[:subject_id]
#    @receiver_id = params[:receiver_id]

  end
  
  def create
    @admin = Admin.find(params[:admin_id])
    @attendence.admin_id = current_admin.id
    @attendence = Attendance.new(params[:attendance])
    @attendence.admin_id = @admin.id
    @attendence.batch_id = params[:batch_id]
    @attendence.user_id = params[:user_id]
    @attendence.subject_id = params[:subject_id]
    @attendence.receiver_id = params[:receiver_id]
    if @attendence.save
      flash[:notice] = "Giving Attendance Successfully"
      redirect_to admin_attendances
    else
      flash[:notice] = "Attendance Given Failure"
      render :new
    end
  end
  
  def index
    @user = User.find(params[:receiver_id])
    @attendence_reports = Attendance.where("receiver_id = #{params[:receiver_id]}")
  end
end
