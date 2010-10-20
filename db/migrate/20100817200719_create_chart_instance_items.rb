class CreateChartInstanceItems < ActiveRecord::Migration
  def self.up
    create_table :chart_instance_items do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :image_url
      t.integer :position
      t.integer :chart_instance_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chart_instance_items
  end
end
