class Sorter
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def get_student_list
    students.keys
  end

  def get_previous_pairs(student)
    students[student]
  end

  def output_day_pairs(students, session)
    all_pair_arrays[session - 1]
  end

  def all_pair_arrays
    generate_pair_arrays(get_student_list)
  end

  def number_of_students
    students.size
  end

  def total_number_of_pairing_sessions
    number_of_students - 1
  end

  def generate_pair_arrays(students)
    pivot_student = students.shift
    pairing_sessions_collection = []
    total_number_of_pairing_sessions.times do
      students.rotate!
      pairing_sessions_collection << generate_pairing_session(pivot_student, students)
    end
    pairing_sessions_collection
  end

  def generate_pairing_session(pivot_student, students)
    [[pivot_student, students.first]] + (1...(number_of_students / 2)).map do |j|
       [students[j], students[number_of_students - 1 - j]]
    end
  end

end
