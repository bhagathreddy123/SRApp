class Admin::AttendancesController < ApplicationController

  def add_edit
     @attendance  = Attendance.new  
       @batches = Batch.all
    @subjects =  Subject.where("batch_id=?",params[:batch_id])
     @users = User.where("admin_id=?",current_admin.id)
  end
  
  def list
    @attendances  = Attendance.all
    @batches = Batch.all
    @subjects =  Subject.where("batch_id=?",params[:batch_id])
    @users = User.where("admin_id=?",current_admin.id)
  end
   
  def create
    @attendance = Attendance.new(attendance_params.merge(:subject_id => params[:subject_id]))
    @subjects =  Subject.where("batch_id=?",params[:batch_id])
    if @attendance.save
      redirect_to admin_attendances_path
    else
      render "new"
    end
  end
  
  def index
    # @user = User.find(params[:receiver_id])
    # @attendence_reports = Attendance.where("receiver_id = #{params[:receiver_id]}")
    @attendances = Attendance.all
    @users = User.all
  end
  
  private
  
  def attendance_params
    params.require(:attendance).permit!
  end
  
end
