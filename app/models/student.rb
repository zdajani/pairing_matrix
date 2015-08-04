class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :pairs
  has_many :blacklisted_students
  has_many :assigned_pairs, through: :pairs, source: :student
  has_many :blacklisted_by, through: :blacklisted_students
end
