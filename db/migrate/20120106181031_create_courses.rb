class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.references :teacher

      t.timestamps
    end
    add_index :courses, :teacher_id
  end

  def down
    drop_table :courses
  end
end
