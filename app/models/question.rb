class Question < ActiveRecord::Base
  attr_accessible :title, :description
  has_many :comments
  validates :title, :description, :presence => true


end
