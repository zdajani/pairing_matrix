module StudentsHelper
  attr_accessor :day_pairs
    
    def output_day_pairs(students, session)
      day_pairs = (generate_pair_arrays(students)[session - 1])
      day_pairs.each do |pairs|
        generate_pairs(pairs.first.id, pairs.last.id, session)
      end
    end

    private
    
    def generate_pair_arrays(students)
      students = get_student_list(students)
      pivot_student = students.shift
      pairing_sessions_collection = []
      (students.length).times do
        students.rotate!
        pairing_sessions_collection << generate_pairing_session(pivot_student, students)
      end
      pairing_sessions_collection
    end

    def get_student_list(students)
      student_array = []
      students.each do |student|
        student_array << student
      end
      student_array
    end
    
    def generate_pairing_session(pivot_student, students)
      [[pivot_student, students.first]] + (1...((students.length)+1) / 2).map do |j|
         [students[j], students[(students.length) - j]]
      end
    end
    
    def generate_pairs(pair_1, pair_2, session)
      Pair.create student_id: pair_1, assigned_pair_id: pair_2, session_number: session
      Pair.create student_id: pair_2, assigned_pair_id: pair_1, session_number: session
    end
end