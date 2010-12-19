# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def itunes_image_tag
    # Grey
    # image_tag("http://images.apple.com/itunesaffiliates/logos/iTunes_bdg88x31.png", :alt => "View In iTunes", :border => "0")
    # Download on iTunes
    image_tag("http://www.apple.com/itunesaffiliates/Buttons-092010/iTunes-Download-English_110x40.png", :alt => "View In iTunes", :border => "0")
  end
  
  def itunes_sm_image_tag
    image_tag("http://www.apple.com/itunesaffiliates/Buttons-092010/iTunes_Badge.gif", :alt => "View In iTunes", :border => "0")
  end
  
  def twitter_share_button(aURL = "http://www.motingo.com/billboardchartserver", text = "Motingo.com")
    args = encode_uri_params  :url => aURL,
                              :text => text,
                              :via => "motingocharts",
                              :related => "anywhere:Billboard Charts, iTunes"
    
    link_to "Share", "http://twitter.com/share?#{args}"
  end
  
  def encode_uri_params(*params)
    params[0].collect {|param| "#{param[0]}=#{CGI.escape(param[1])}"}.join("&")
  end
end
