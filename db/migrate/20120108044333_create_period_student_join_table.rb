class CreatePeriodStudentJoinTable < ActiveRecord::Migration
  def up
    create_table :periods_students, :id => false do |t|
      t.references :period, :null => false
      t.references :student, :null => false
    end
    add_index(:periods_students, [:period_id, :student_id], :unique => true)
  end

  def down
    drop_table :periods_students
  end
end
