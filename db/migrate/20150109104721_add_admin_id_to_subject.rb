class AddAdminIdToSubject < ActiveRecord::Migration
  def change
  add_column :subjects, :admin_id, :integer
  end
end
