class CreateEducationalAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_assignments do |t|
      t.references :educational, polymorphic: true, null: false, index: { name: 'educational_assignments_on_educational' }
      t.references :assignee, polymorphic: true, null: false, index: { name: 'educational_assignments_on_assignee' }

      t.timestamps
      t.index %i[educational_type educational_id assignee_type assignee_id], unique: true, name: 'educational_assignments_on_uniq_assignment'
    end
  end
end
