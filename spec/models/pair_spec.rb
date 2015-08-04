require 'rails_helper'

RSpec.describe Pair, type: :model do
  it { should belong_to(:student) }
end
