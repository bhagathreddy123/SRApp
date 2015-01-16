class WebAdminIdToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :web_admin_id, :integer
  end
end
