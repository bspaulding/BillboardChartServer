class ChartInstanceItem < ActiveRecord::Base
  belongs_to :chart_instance
  
  validates_presence_of [:chart_instance, :title, :artist, :album]
  validates_format_of :itunesTrackViewURL, :with => /\A(http|https)\:\/\/[a-zA-Z0-9\_\-\.]+\.(com|COM)\/[a-zA-Z0-9_#?&=\/\-\.]+\z/
  validates_format_of :itunesPreviewURL, :with => /\A(http|https)\:\/\/[a-zA-Z0-9_#?&=\/\-\.]+\.(m4a|m4p)\z/
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
  
  private
  def get_itunes_data
    case chart_instance.chart.chart_type
    when Chart::CHART_TYPE_SINGLES then
      json = Net::HTTP.get 'ax.itunes.apple.com', "/WebObjects/MZStoreServices.woa/wa/wsSearch?media=music&attribute=songTerm&limit=1&term=#{title.gsub(' ', '+')}"
      itunesResult = JSON.parse(json)["results"][0]
      self.itunesTrackViewURL	= itunesResult["trackViewUrl"]
    when Chart::CHART_TYPE_ALBUMS then
    	json = Net::HTTP.get 'ax.itunes.apple.com', "/WebObjects/MZStoreServices.woa/wa/wsSearch?media=music&attribute=albumTerm&limit=1&term=#{title.gsub(' ', '+')}"
      itunesResult = JSON.parse(json)["results"][0]
      self.itunesTrackViewURL	= itunesResult["collectionViewUrl"]
    end
    
    self.itunesArtworkURL30  = itunesResult["artworkUrl30"]
    self.itunesArtworkURL60  = itunesResult["artworkUrl60"]
    self.itunesArtworkURL100 = itunesResult["artworkUrl100"]
    self.itunesPreviewURL    = itunesResult["previewUrl"]
  end
end
