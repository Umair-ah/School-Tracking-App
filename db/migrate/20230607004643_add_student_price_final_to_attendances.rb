class AddStudentPriceFinalToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :student_price_final, :integer, default: 0, null: false
  end
end
