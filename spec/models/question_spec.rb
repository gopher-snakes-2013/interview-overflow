require 'spec_helper'

describe Question do

	it {should validate_presence_of(:title)}
	it {should validate_presence_of(:description)}
  it {should have_many(:comments)}

end