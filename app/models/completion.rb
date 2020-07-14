class Completion < ApplicationRecord
  belongs_to :educational, polymorphic: true
  belongs_to :user
end
