require 'rails_helper'

RSpec.describe StudentsHelper, type: :helper do
  describe 'generate pairs' do
    let(:student) { create(:student) }

    it 'generates pairs' do
      3.times { create(:student) }
      student.output_day_pairs(Student.all, 1)
      expect(Pair.count).to eq 4
    end
  end
end