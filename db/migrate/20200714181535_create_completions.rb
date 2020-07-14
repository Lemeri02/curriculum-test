class CreateCompletions < ActiveRecord::Migration[6.0]
  def change
    create_table :completions do |t|
      t.references :educational, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
      t.index %i[user_id educational_id educational_type], unique: true, name: 'completions_on_uniq_completion'
    end
  end
end
