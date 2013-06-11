class Player < ActiveRecord::Base
  validates_presence_of :initials, :message => "Comply: Enter initials now."
  validates_uniqueness_of :initials, :message => "You are not the one. Please enter different initials"
  validates :initials,  :length => {:minimum => 3, :message => "Please enter three initials" }
  validates :initials,  :length => {:maximum => 3, :message => "Please enter three initials" }
  
  has_many :races
  has_many :games, :through => :races
end
