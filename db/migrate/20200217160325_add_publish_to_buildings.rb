class AddPublishToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :published, :boolean, default: true
  end
end
