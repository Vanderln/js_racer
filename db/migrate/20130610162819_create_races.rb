class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.references :game
      t.references :player
      t.timestamps
    end
  end
end
