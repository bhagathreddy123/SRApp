class AddSubjectIdBatchIdToTest < ActiveRecord::Migration
  def change
  add_column :tests, :batch_id, :integer
  add_column :tests, :subject_id, :integer
  end
end

