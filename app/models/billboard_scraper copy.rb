class BillboardScraper
  include Singleton
  
  def self.scrape_chart(chart)
  	@chart = chart
  end
  
  private
  def scrape
  	Tidy.path = "/usr/lib/libtidy.dylib"
  	
    browser = Watir::Browser.new
    browser.goto @chart.url
    sleep(10)
    
    chart_date = Date.parse(chart_date_scraper.scrape(browser.html))
    ci = @chart.chart_instances.find_by_date(chart_date)
    if ci.nil?
      ci = ChartInstance.new(:date => chart_date)
      ci.chart = @chart
      ci.save!
  
      chart_items = chart_instance_scraper.scrape(browser.html)
      chart_items.each_with_index do |item, index|
        cii = ChartInstanceItem.create!(results_to_hash(item).merge({ :chart_instance => ci }))
      end
  
      ci.save!
    end
  end
  
  private
  def chart_instance_scraper
    item_scraper = chart_item_scraper
    Scraper.define do 
    	array :chart_items
    	process "#chart-list .module-top-small", :chart_items => item_scraper
    	result :chart_items
    end
  end
  
  def chart_item_scraper
    Scraper.define do 
      process ".rank", :position => :text
    	process "div>h2", :title => :text
      process "div>h3", :artist => :text
      process ".info>p", :album => :text
      process "td>img", :image_url => "@src"
      process ".chart-pos", :last_weeks_position => :text
      process ".weeks", :weeks_on_chart => :text
      process ".peak", :peak_position => :text
      result :position, :title, :artist, :album, :image_url, :last_weeks_position, :weeks_on_chart, :peak_position
    end
  end
  
  def chart_date_scraper
    Scraper.define do
      process "#chart-date", :chart_date => :text
      result :chart_date
    end
  end
  
  def results_to_hash(scraper_result)
    result = {}
    [:position, :title, :artist, :album, :image_url, :last_weeks_position, :weeks_on_chart, :peak_position].each do |field_name_symbol|
        result[field_name_symbol] = scraper_result[field_name_symbol]
    end
    result
  end
end