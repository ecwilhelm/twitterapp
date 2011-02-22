require 'rss'
require 'open-uri'
require 'sinatra'

get %r{/twitter/([\w]+)} do
 feedurl="http://search.twitter.com/search.rss?q=#{params[:captures].first}&rpp=5"
 feedcontent = ""

 open(feedurl) do |s| feedcontent = s.read end

   rss = RSS::Parser.parse(feedcontent, false)

   @feedtitle=rss.channel.title.capitalize
   @feedlink=rss.channel.link
   @title="twitterfeed for " + @feedtitle

   @feeditems=rss.channel.items

   erb :rss
end

