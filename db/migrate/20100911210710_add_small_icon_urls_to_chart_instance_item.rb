class AddSmallIconUrlsToChartInstanceItem < ActiveRecord::Migration
  def self.up
    add_column :chart_instance_items, :itunesArtworkURL30, :string
    add_column :chart_instance_items, :itunesArtworkURL60, :string
  end

  def self.down
    remove_column :chart_instance_items, :itunesArtworkURL60
    remove_column :chart_instance_items, :itunesArtworkURL30
  end
end
