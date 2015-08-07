require 'rails_helper'

RSpec.describe Pair, type: :model do
  let(:student1) do
    create(:student)
  end
  
  let(:student2) do
    create(:student, email:"fakemail@gmail.com")
  end
  
  it { should belong_to(:student) }
  
end
