module StudentsHelper
  
  def output_day_pairs(students, session)
    generate_pair_arrays(students)[session - 1]
  end

  def number_of_students(students)
    students.length
  end

  def generate_pair_arrays(students)
    students = get_student_list(students)
    pivot_student = students.shift
    pairing_sessions_collection = []
    (number_of_students(students)).times do
      students.rotate!
      pairing_sessions_collection << generate_pairing_session(pivot_student, students)
    end
    pairing_sessions_collection
  end

  def generate_pairing_session(pivot_student, students)
    [[pivot_student, students.first]] + (1...((number_of_students(students)+1) / 2)).map do |j|
       [students[j], students[number_of_students(students) - j]]
    end
  end
  
  def get_student_list(students)
    student_array = []
    students.each do |student|
      student_array << student
    end
    student_array
  end
end
