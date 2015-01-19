class Admin::MarkreportsController < ApplicationController

def index
 @marks_reports = MarkReport.all
end

def new
@mark_report = MarkReport.new
end
 
def create
@mark_report = MarkReport.new(mark_report_params)
if @mark_report.save
  redirect_to admin_markreports_path
else
  render "new"
end
end

def edit
 @mark_report = MarkReport.find(params[:id])    
end

def update
@mark_report = MarkReport.find(params[:id])   
if @mark_report.update(mark_report_params)
  redirect_to admin_markreports_path
else
  render :edit
end
end

def destroy
@mark_report = MarkReport.find(params[:id])   
if @mark_report.destroy
  redirect_to admin_markreports_path
end
end

private

def mark_report_params
params.require(:mark_report).permit!
end

end
