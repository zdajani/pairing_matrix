require 'rails_helper'

RSpec.describe Pair, type: :model do
  let(:student1) do
    create(:student)
  end
  
  let(:student2) do
    create(:student, email:"fakemail@gmail.com")
  end
  
  it { should belong_to(:student) }
  
  
  it "should add student_id's to the table" do
    pair = student1.pairs.create(assigned_pair: student2.id)
    expect(pair).to eq Pair.find(1)
    # expect(pair.assigned_pair).to eq student2.id
  end
end
