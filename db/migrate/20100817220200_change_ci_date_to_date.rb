class ChangeCiDateToDate < ActiveRecord::Migration
  def self.up
    change_column :chart_instances, :date, :date
  end

  def self.down
    change_column :chart_instances, :date, :datetime
  end
end
