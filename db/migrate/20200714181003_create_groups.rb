class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps

      t.index :name, unique: true
    end
  end
end
