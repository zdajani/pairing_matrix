class Sorter
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def self.call(students, session)
    new( students ).output_day_pairs(session)
  end
  

  def output_day_pairs(session)
    day_pair = []
    day_pair = generate_pair_arrays[session - 1]
    day_pair.each_slice(2).each_with_object [] do |(student_1, student_2), pair_arrays|
      pair_arrays << generate_pairs( pair_1, pair_1 )
    end
  end

  def total_number_of_pairing_sessions
    number_of_students - 1
  end

  def generate_pair_arrays
    students = get_student_list
    pivot_student = students.shift
    pairing_sessions_collection = []
    (number_of_students).times do
      students.rotate!
      pairing_sessions_collection << generate_pairing_session(pivot_student, students)
    end
    pairing_sessions_collection
  end
  
  private

  def get_student_list
    student_array = []
    students.each do |student|
      student_array << student
    end
    student_array
  end
  
  def number_of_students
    students.length
  end
  
  def generate_pairing_session(pivot_student, students)
    [[pivot_student, students.first]] + (1...(number_of_students / 2).map do |j|
       [students[j], students[number_of_students - j]]
    end
  end
  
  def generate_pairs pair_1, pair_2
    Pair.create student_id: pair_1.id, assigned_pair_id: pair_2.id
    Pair.create student_id: pair_2.id, assigned_pair_id: pair_1.id
  end
end
