class AddItunesDataToChartInstanceItem < ActiveRecord::Migration
  def self.up
    add_column :chart_instance_items, :itunesTrackViewURL, :string
    add_column :chart_instance_items, :itunesArtworkURL100, :string
    add_column :chart_instance_items, :itunesPreviewURL, :string
  end

  def self.down
    remove_column :chart_instance_items, :itunesPreviewURL
    remove_column :chart_instance_items, :itunesArtworkURL100
    remove_column :chart_instance_items, :itunesTrackViewURL
  end
end
