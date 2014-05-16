class CreateStreamersTable < ActiveRecord::Migration
  def up
    create_table :streamers do |t|
      t.integer :twitch_id
      t.string :name
      t.integer :main_game_id
      t.timestamps
    end
  end

  def down
    drop_table :streamers
  end
end
