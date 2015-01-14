class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.integer :user_id
      t.integer :admin_id
      t.string :status
      t.timestamps
    end
  end
end
