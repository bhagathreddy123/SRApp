class AddSubjectIdToStudentsBatch < ActiveRecord::Migration
  def change
    add_column :students_batches, :subject_id, :integer 
  end
end
