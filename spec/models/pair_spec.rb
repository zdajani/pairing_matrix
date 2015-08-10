require 'rails_helper'

RSpec.describe Pair, type: :model do
  it { should belong_to(:student) }
  
  it { should belong_to(:assigned_pair)}
end
