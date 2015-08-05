class Pair < ActiveRecord::Base
  belongs_to :assigned_pair, class_name: 'Student'
  belongs_to :student
  validates :student_id, presence: true
end
