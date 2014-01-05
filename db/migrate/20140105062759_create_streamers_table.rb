class CreateStreamersTable < ActiveRecord::Migration
  def up
    create_table :streamers do |t|
      # twitch id for lookup
    end
  end

  def down
    drop_table :streamers
  end
end
