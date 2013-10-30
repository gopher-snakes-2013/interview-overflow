class Question < ActiveRecord::Base
  attr_accessible :title, :description

  validates :title, :presence => true
  validates :description, :presence => true


end
