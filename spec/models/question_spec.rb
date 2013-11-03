require 'spec_helper'

describe Question do
	it { should validate_presence_of(:title)}
  it { should ensure_length_of(:title).is_at_least(5) }
  it { should validate_presence_of(:description)}
  it { should ensure_length_of(:description).is_at_least(10) }
  it { should validate_numericality_of(:votes)}
  it { should have_many(:comments)}
end