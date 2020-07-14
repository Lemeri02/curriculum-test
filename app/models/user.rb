class User < ApplicationRecord
  ROLES = %w[admin user].freeze

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :educational_assignments, as: :assignee
  has_many :group_educational_assignments, through: :groups, source: :educational_assignments
  has_many :private_courses, through: :educational_assignments, source: :educational, source_type: 'Course'
  has_many :private_quizzes, through: :educational_assignments, source: :educational, source_type: 'Quiz'
  has_many :group_courses, through: :group_educational_assignments, source: :educational, source_type: 'Course'
  has_many :group_quizzes, through: :group_educational_assignments, source: :educational, source_type: 'Quiz'
  has_many :completions
  has_many :completed_courses, through: :completions, source: :educational, source_type: 'Course'
  has_many :completed_quizzes, through: :completions, source: :educational, source_type: 'Quiz'

  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: { in: ROLES }

  def courses
    (private_courses + group_courses).uniq
  end

  def quizzes
    (private_quizzes + group_quizzes).uniq
  end

  def in_progress_courses
    courses - completed_courses
  end

  def in_progress_quizzes
    quizzes - completed_quizzes
  end

  def admin?
    role == 'admin'
  end
end
