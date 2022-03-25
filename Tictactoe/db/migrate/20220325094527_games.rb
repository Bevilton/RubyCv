class Games < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.time :time
      t.integer :current_player
      t.string :json_board 
    end
  end
end
