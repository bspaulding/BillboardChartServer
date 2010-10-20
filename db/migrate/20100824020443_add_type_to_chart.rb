class AddTypeToChart < ActiveRecord::Migration
  def self.up
    add_column :charts, :chart_type, :string
  end

  def self.down
    remove_column :charts, :chart_type
  end
end
