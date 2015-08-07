class Student < ActiveRecord::Base
  include StudentsHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :assigned_pairs, through: :pairs
  has_many :pairs
end
