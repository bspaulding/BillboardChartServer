class ChartInstance < ActiveRecord::Base
  belongs_to :chart
  has_many :chart_instance_items, :dependent => :destroy
  
  validates_presence_of :chart
end
