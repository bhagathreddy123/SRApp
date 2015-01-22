class AddTestIdToMarkReport < ActiveRecord::Migration
  def change
    add_column :mark_reports, :test_id, :integer
  end
end
