class CreateCharts < ActiveRecord::Migration
  def self.up
    create_table :charts do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :charts
  end
end
