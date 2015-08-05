require 'rails_helper'

describe Sorter do

  students = {1 => [3],
              2 => [4],
              3 => [1],
              4 => [2]}

  let(:sorter) { Sorter.new students }

  context 'it takes in a hash of students with pairs' do
    it 'can read in a hash' do
      expect(sorter.students).to eq students
    end

    it 'can output a list of students' do
      expect(sorter.get_student_list).to eq [1,2,3,4]
    end

    it 'can see a student\'s previous pair' do
      expect(sorter.get_previous_pairs(2)).to eq [4]
    end

    it 'can output a series of combonations of pairs' do
      expect(sorter.all_pair_arrays).to eq [[[1, 3], [4, 2]], [[1, 4], [2, 3]], [[1, 2], [3, 4]]]
    end

    it 'can, given a day from 1, return the pairing array for that day' do
      expect(sorter.output_day_pairs(students, 2)).to eq [[1,4], [2,3]]


    end
  end
end
