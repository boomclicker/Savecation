class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.integer :student_id
      t.string :course_id
      t.float :percentage
      t.string :lettergrade

      t.timestamps null: false
    end
  end
end
