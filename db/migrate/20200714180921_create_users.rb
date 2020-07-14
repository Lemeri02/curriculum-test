class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :role, default: 'user'

      t.timestamps

      t.index :username, unique: true
    end
  end
end
