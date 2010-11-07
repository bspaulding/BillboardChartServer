class AddArtistIdToChartInstanceItem < ActiveRecord::Migration
  def self.up
    add_column :chart_instance_items, :artist_id, :integer
  end

  def self.down
    remove_column :chart_instance_items, :artist_id
  end
end
