class BillboardScraper
  
  def self.scrape_chart(chart)
  	@agent = Mechanize.new {|agent| agent.user_agent_alias = 'Mac Safari' }
  	@chart = chart
  	self.scrape
  end
  
  private
  def self.scrape
		
		chart_date = ""
		@agent.get(@chart[:url]) do |page|
    	chart_date = Date.parse( page.search('#chart-date').text.strip )
  	end
		    
    ci = @chart.chart_instances.find_by_date(chart_date)
    if ci.nil?
      ci = ChartInstance.new(:date => chart_date)
      ci.chart = @chart
      ci.save!
  		
  		# Get ChartInstanceItems
			(@chart.size / @chart.items_per_page).times do |n|
		    begin_at = @chart.items_per_page * n + 1
		  	
		  	# We must scrape each paginated page to retrieve the whole list.
		    @agent.get("#{@chart.url}?begin=#{begin_at}") do |page|
		      page.search('#chart-list>.chart-item-wrapper').each do |chart_item_wrapper|
						cii = ChartInstanceItem.new
						
						cii.title = chart_item_wrapper.search('.item-title').text.strip
						
						artist = Artist.find_or_create_by_billboard_id( chart_item_wrapper.search('.item-artistId').text.strip )
						artist.name = chart_item_wrapper.search('.item-artist').text.strip if artist.name.nil?
						artist.save!
						
		        cii.artist = artist
			        
		        cii.album = chart_item_wrapper.search('.info>p').text.strip if @chart.chart_type == "Singles"

		        cii.position = chart_item_wrapper.search('.position>.rank').text.strip.to_i
		        cii.last_weeks_position = chart_item_wrapper.search('.chart-pos').text.strip.to_i
		        cii.weeks_on_chart = chart_item_wrapper.search('.weeks').text.strip.to_i
		        cii.peak_position = chart_item_wrapper.search('.peak').text.strip.to_i
		        
		        cii.image_url = chart_item_wrapper.search('td>img').first['src'].strip
		        
		        cii.chart_instance = ci
		        cii.save!
		      end
		    end
		  end
    end
  end
end