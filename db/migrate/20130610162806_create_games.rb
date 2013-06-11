class CreateGames < ActiveRecord::Migration
  def change 
    create_table :games do |t|
      t.string :winner
      t.string :loser
      t.float :win_time
      t.string :url
      t.timestamps
    end
  end
end
