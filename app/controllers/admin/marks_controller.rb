class Admin::MarksController < ApplicationController
def test_name
#@mark_report = MarkReport.new  
@test = Test.new 
@batches = Batch.all
@subjects =  Subject.where("batch_id=?",params[:batch_id])
end
 
def index
@tests = Test.all  
end

def create
@test = Test.new(test_params.merge(:subject_id => params[:subject_id]))
 @subjects =  Subject.where("batch_id=?",params[:batch_id])
if @test.save
  redirect_to admin_marks_path
else
  render "new"
end
end


def subject_model
   @subjects =  Subject.where("batch_id=?",params[:batch_id])
end

def destroy
  @test = Test.find(params[:id])
  if @test.destroy
    redirect_to admin_marks_path
  end
end
private

def test_params
  params.require(:test).permit!
end
end
