class RemoveSizeAndItemsPerPageFromChart < ActiveRecord::Migration
  def self.up
  	remove_column :charts, :size
  	remove_column :charts, :items_per_page
  end

  def self.down
  	add_column :charts, :size
  	add_column :charts, :items_per_page
  end
end
