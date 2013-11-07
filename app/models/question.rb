class Question < ActiveRecord::Base
  attr_accessible :title, :description, :votes
  has_many :comments
  validates :title, :presence => true, :length => {:minimum => 5}
  validates :description, :presence => true, :length => {:minimum => 10}
  validates :votes, :numericality => { :only_integer => true }

  def vote!
    self.update_attribute :vote, self.votes+1
  end
end
