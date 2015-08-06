module StudentsHelper

  attr_accessor :individual_pairs, :day_pairs, :pairs_today


    # def call(students, session)
    #   @students = students
    #   output_day_pairs(session)
    # end
    # 

    def output_day_pairs(students, session)
      
      day_pairs = (generate_pair_arrays(students)[session - 1])
      
      day_pairs.each do |pairs|
        generate_pairs(pairs.first.id, pairs.last.id)
      end
      
      # .each_with_object [] do | pairs, individual_pairs| individual_pairs << (pairs) 
    
      # end
      # individual_pairs.each do |pair| generate_pairs(pair[0], pair[1])
      # end
      
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
    
    private

    def get_student_list(students)
      student_array = []
      students.each do |student|
        student_array << student
      end
      student_array
    end
    
    def number_of_students(students)
      students.length
    end
    
    def generate_pairing_session(pivot_student, students)
      [[pivot_student, students.first]] + (1...((number_of_students(students)+1) / 2)).map do |j|
         [students[j], students[number_of_students(students) - j]]
      end
    end
    
    def generate_pairs(pair_1, pair_2)
      Pair.create student_id: pair_1, assigned_pair_id: pair_2
      Pair.create student_id: pair_2, assigned_pair_id: pair_1
    end
end