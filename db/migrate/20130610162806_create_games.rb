class CreateGames < ActiveRecord::Migration
  def change 
    create_table :games do |t|
      t.string :winner
      t.string :loser
      t.integer :win_time
      t.timestamps
    end
  end
end