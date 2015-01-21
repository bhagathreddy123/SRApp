class AddMaxMarkToTest < ActiveRecord::Migration
  def change
  add_column :tests, :total_marks, :integer
  add_column :tests, :max_marks, :integer
  end
end
