class Artist < ActiveRecord::Base
	has_many :chart_instance_items
end
