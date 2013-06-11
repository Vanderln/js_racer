class CreateGames < ActiveRecord::Migration
  def change 
    create_table :games do |t|
      t.integer :winner_id  #should store winner ID... 
      t.integer :loser_id   #should store loser ID (loser_id)
      t.float :win_time
      t.string :url
      t.timestamps
    end
  end
end
