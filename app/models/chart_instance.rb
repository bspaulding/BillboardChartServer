class ChartInstance < ActiveRecord::Base
  belongs_to :chart
  has_many :chart_instance_items, :dependent => :destroy
  
  default_scope :order => "date ASC"
  
  validates_presence_of :chart
end
