class CreateChartInstances < ActiveRecord::Migration
  def self.up
    create_table :chart_instances do |t|
      t.datetime :date
      t.integer :chart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chart_instances
  end
end
