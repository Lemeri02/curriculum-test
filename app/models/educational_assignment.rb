class EducationalAssignment < ApplicationRecord
  belongs_to :educational, polymorphic: true
  belongs_to :assignee, polymorphic: true
end
