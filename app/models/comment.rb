class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :question
  validates :content, :presence => true, :length => {:minimum => 10}
end