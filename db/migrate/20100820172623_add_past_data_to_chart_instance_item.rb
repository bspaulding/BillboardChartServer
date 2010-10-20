class AddPastDataToChartInstanceItem < ActiveRecord::Migration
  def self.up
    add_column :chart_instance_items, :last_weeks_position, :integer
    add_column :chart_instance_items, :weeks_on_chart, :integer
    add_column :chart_instance_items, :peak_position, :integer
  end

  def self.down
    remove_column :chart_instance_items, :peak_position
    remove_column :chart_instance_items, :weeks_on_chart
    remove_column :chart_instance_items, :last_weeks_position
  end
end
