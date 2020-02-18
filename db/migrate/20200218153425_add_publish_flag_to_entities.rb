class AddPublishFlagToEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :published, :boolean, default: true
    add_column :categories, :published, :boolean, default: true
    add_column :collections, :published, :boolean, default: true
    add_column :exhibitions, :published, :boolean, default: true
    add_column :finding_aids, :published, :boolean, default: true
    add_column :policies, :published, :boolean, default: true
    add_column :services, :published, :boolean, default: true
    add_column :spaces, :published, :boolean, default: true
    add_column :webpages, :published, :boolean, default: true
  end
end
