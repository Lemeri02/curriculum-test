class Quiz < ApplicationRecord
  has_many :educational_assignments, as: :educational

  validates :name, presence: true, uniqueness: true
end
