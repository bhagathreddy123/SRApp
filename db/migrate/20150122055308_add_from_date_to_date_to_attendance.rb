class AddFromDateToDateToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :from_date, :datetime
    add_column :attendances, :to_date, :datetime
  end
end
