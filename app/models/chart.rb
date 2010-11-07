class Chart < ActiveRecord::Base
  CHART_TYPE_SINGLES = "Singles"
  CHART_TYPE_ALBUMS = "Albums"
  CHART_TYPES = [CHART_TYPE_SINGLES, CHART_TYPE_ALBUMS]
  
  has_many :chart_instances
  
  validates_presence_of :title
  validates_format_of :url, :with => /\A(http|https)\:\/\/[a-zA-Z0-9_\-\.]+\.(com|COM)\/[a-zA-Z0-9_#?&=\/\-\.]+\z/
  validates_inclusion_of :chart_type, :in => CHART_TYPES
  
  def self.update_chart_data
    Chart.all.each { |chart| chart.update_chart_data }
  end
  
  def update_chart_data
    BillboardScraper.scrape_chart(self)
  end
end