class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
