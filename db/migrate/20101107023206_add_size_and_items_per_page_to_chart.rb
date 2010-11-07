class AddSizeAndItemsPerPageToChart < ActiveRecord::Migration
  def self.up
    add_column :charts, :size, :integer
    add_column :charts, :items_per_page, :integer
  end

  def self.down
    remove_column :charts, :items_per_page
    remove_column :charts, :size
  end
end
