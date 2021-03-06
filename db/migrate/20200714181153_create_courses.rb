class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name

      t.timestamps

      t.index :name, unique: true
    end
  end
end
