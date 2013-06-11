class Game < ActiveRecord::Base

  has_many :races
  has_many :players, :through => :races
  # scope :top_ten, includes(:games).order(:win_time 'LIMIT 10')
  belongs_to :winner, :class_name => "Player"
  belongs_to :loser, :class_name => "Player"
  
end

