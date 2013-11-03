require 'spec_helper'

describe Comment do
  it { should belong_to(:question) }
  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:content).is_at_least(10) }
end