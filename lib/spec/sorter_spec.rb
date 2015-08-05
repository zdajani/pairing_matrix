require './sorter'

describe Sorter do

  students = [:michael, :simon, :tim, :john]
  students.each_with_index do |name, id|
    let(name) { double :student, name: name, id: id }
  end

  let(:sorter) { Sorter.new(michael, simon, tim, john) }

  context 'it takes in a hash of students with pairs' do

    it 'can output a list of students' do
      expect(sorter.get_student_list).to eq [:michael, :simon, :tim, :john]
    end

    it 'can output a series of combonations of pairs' do
      expect(sorter.all_pair_arrays).to eq [[[michael, tim], [john, simon]], [[michael, john], [simon, tim]], [[michael, simon], [tim, john]]]
    end

    it 'can, given a day from 1, return the pairing array for that day' do
      expect(sorter.output_day_pairs(students, 2)).to eq [[1,4], [2,3]]


    end
  end
end
