class ChartInstanceItem < ActiveRecord::Base
  belongs_to :chart_instance
	belongs_to :artist
  
  validates_presence_of [:chart_instance, :title, :artist]
  validates_format_of :itunesTrackViewURL, :with => /\A(http|https)\:\/\/[a-zA-Z0-9\_\-\.]+\.(com|COM)\/[a-zA-Z0-9_#?&=\/\-\.]+\z/
  validates_format_of :itunesPreviewURL, :with => /\A(http|https)\:\/\/[a-zA-Z0-9_#?&=\/\-\.]+\.(m4a|m4p|m4v)\z/, :allow_blank => true
  validates_format_of [:image_url, :itunesArtworkURL100, :itunesArtworkURL30, :itunesArtworkURL60], 
                      :with => /\A(http|https)\:\/\/[a-zA-Z0-9_#?&=\/\-\.]+\.(jpg|JPG|jpeg|JPEG|gif|GIF|png|PNG)\z/
  validates_numericality_of [:position, :weeks_on_chart, :peak_position], :greater_than => 0
  validates_numericality_of :last_weeks_position, :greater_than => 0, :allow_nil => true
  
  before_validation_on_create :get_itunes_data
  
  def position=(new_position)
    self[:position] = new_position.to_i
  end
  
  def peak_position=(new_peak_position)
    self[:peak_position] = new_peak_position.to_i
  end
  
  def weeks_on_chart=(new_weeks_on_chart)
    self[:weeks_on_chart] = new_weeks_on_chart.to_i
  end
    
  def last_weeks_position=(new_last_weeks_position)
    self[:last_weeks_position] = (new_last_weeks_position.to_i == 0) ? nil : new_last_weeks_position.to_i
  end
  
  def image_url=(new_image_url)
    self[:image_url] = (new_image_url.include?("billboard")) ? new_image_url : "http://www.billboard.com#{new_image_url}"
  end
  
  def album?
  	self.chart_instance.chart.chart_type == Chart::CHART_TYPE_ALBUMS
  end
  
  def single?
  	self.chart_instance.chart.chart_type == Chart::CHART_TYPE_SINGLES
  end
  
  private
  def get_itunes_data
    itunesResult = itunes_result
		
		if self.single?
	    self.itunesTrackViewURL	= itunesResult["trackViewUrl"]
    elsif self.album?
	    self.itunesTrackViewURL	= itunesResult["collectionViewUrl"]
  	end
  	  
    self.itunesArtworkURL30  = itunesResult["artworkUrl30"]
    self.itunesArtworkURL60  = itunesResult["artworkUrl60"]
    self.itunesArtworkURL100 = itunesResult["artworkUrl100"]
    self.itunesPreviewURL    = itunesResult["previewUrl"]
  end
  
  def itunes_result
		json = Net::HTTP.get 'ax.itunes.apple.com', itunes_api_url( itunes_query_format(self.title, :strict => false) )
		results = JSON.parse(json)["results"]
		
		(results.empty?) ? get_any_itunes_result : results[0]
  end
  
  def get_any_itunes_result(words = self.title.split(' '))
  	if words.count == 0
  		return nil
  	end
  
  	json = Net::HTTP.get 'ax.itunes.apple.com', itunes_api_url( itunes_query_format(words.join(' '), :strict => true) )
		results = JSON.parse(json)["results"]
				
		(results.empty?) ? get_any_itunes_result( words[0..-2] ) : results[0]
  end
  
  def itunes_api_url(query)
  	url = "/WebObjects/MZStoreServices.woa/wa/wsSearch?media=music&limit=1"

  	url += (self.album?) ? "&attribute=albumTerm" : "&attribute=songTerm"

  	url += "&term=#{query}"
  end
  
  def itunes_query_format(string, options)
  	result = ""
  	if options[:strict]
	  	result = string.gsub(/(:|\(|\))/, '').split(' ').uniq.reject {|word| word =~ /(\AEP\z|\ALP\z)/ }.join('+')
	  else
	  	result = string.gsub(' ', '+')
	  end
	  result
  end
end
