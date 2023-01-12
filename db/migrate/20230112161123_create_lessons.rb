class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.string :status, default: "planned"
      t.datetime :start

      t.timestamps
    end
  end
end
