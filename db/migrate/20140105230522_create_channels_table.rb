class CreateChannelsTable < ActiveRecord::Migration
  def up
    create_table :channels do |t|
      t.string :name
      t.integer :channelable_id
      t.string  :channelable_type
      t.timestamps
    end

    create_table :channels_users do |t|
      t.integer :user_id
      t.integer :channel_id
      t.integer :views
    end

    add_index :channels_users, [:user_id, :channel_id]
  end

  def down
    drop_table :channels
    drop_table :channels_users
  end
end
