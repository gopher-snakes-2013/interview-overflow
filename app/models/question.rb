class Question < ActiveRecord::Base
  attr_accessible :title, :description, :votes
  has_many :comments
  validates :title, :description, :presence => true
end
