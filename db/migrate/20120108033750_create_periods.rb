class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :hours
      t.string :quarter
      t.integer :year
      t.references :course

      t.timestamps
    end
    add_index :periods, :course_id
  end

  def down
    drop_table :periods
  end
end
