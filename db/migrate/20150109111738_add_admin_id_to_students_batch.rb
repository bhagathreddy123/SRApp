class AddAdminIdToStudentsBatch < ActiveRecord::Migration
  def change
 add_column :students_batches, :admin_id, :integer
  end
end
