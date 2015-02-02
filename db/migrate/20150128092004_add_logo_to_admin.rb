class AddLogoToAdmin < ActiveRecord::Migration
  def change
  add_attachment :admins, :logo
  end
end

