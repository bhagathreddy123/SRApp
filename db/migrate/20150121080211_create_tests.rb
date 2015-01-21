class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :exam_name
      t.string :user_id
      t.datetime :exam_date
      t.integer :admin_id
      t.timestamps
    end
  end
end

