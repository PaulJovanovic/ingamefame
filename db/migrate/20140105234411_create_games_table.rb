class CreateGamesTable < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :name
    end
  end

  def down
    drop_table :games
  end
end
