class HomeController < ApplicationController
  def index
  end
  
  def crawling
    require 'open-uri'
        @search = params[:want]
        @url = URI.encode("http://cafeblog.search.naver.com/search.naver?where=post&sm=tab_jum&ie=utf8&query=#{@search}")
=begin
        field = Nokogiri::HTML(open(data))
        field0 = field.css("ul > li:nth-child(#{j}) > p")[0].text
        title = field.css("ul > li:nth-child(#{j}) > div.main-info.clearfix > h4 > a:nth-child(2)").text
        textnum = field.css("ul > li:nth-child(#{j}) > div.main-info.clearfix > h4 > a:nth-child(2)")[0]['href']
        #dday = field.css("ul > li:nth-child(1) > div.main-info.clearfix > p > span").text
        comdate = field.css("ul > li:nth-child(#{j}) > div.main-info.clearfix > p").text
    
        competition = Competition.new
        competition.title = title
        competition.textnum = textnum
        competition.field = field0
        #competition.d_day = dday
        competition.com_date = comdate
        
        data2 = URI("http://www.detizen.com/contest/#{textnum}")
        field2 = Nokogiri::HTML(open(data2))
        image = field2.css("#Main > section:nth-child(3) > div > div > div.top_info.after > div.poster > img")[0]['src']
        competition.photo = image
        
        competition.url = field2.css("#Main > section:nth-child(3) > div > div > div.top_info.after > div.contest-info > table > tbody > tr:nth-child(9) > td > a")[0]["href"]
       
        
        #competition.content =
        competition.save
=end
  end  
end
