require 'net/http'
require 'uri'
require 'json'

module SocialProfiles
  
  def to_facebook
    "http://www.facebook.com/#{self}"
  end
  
  def to_twitter
    "http://www.twitter.com/#{self}"
  end
  
  def on_twitter?
    url = "http://api.twitter.com/1/users/show.json?screen_name=#{self}"
    json = Net::HTTP.get_response(URI.parse(url)).body
    JSON.parse(json)['error'].nil?
  end
  
end