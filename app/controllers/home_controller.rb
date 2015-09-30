class HomeController < ApplicationController
  def index
  end
  
  def crawling
    require 'open-uri'
        @want = params[:want]
        @url_article = URI.encode("http://cafeblog.search.naver.com/search.naver?sm=tab_hty.top&where=article&ie=utf8&query=#{params[:want]}+-#{params[:no_want]}")
        @url_post = URI.encode("http://cafeblog.search.naver.com/search.naver?sm=tab_hty.top&where=post&ie=utf8&query=#{params[:want]}+-#{params[:no_want]}")
        article = Nokogiri::HTML(open(@url_article)) #카페
        postt = Nokogiri::HTML(open(@url_post)) #블로그
        

        for i in 1..10
          search = Search.new
          search.url = article.css("#elThumbnailResultArea > li:nth-child(#{i}) > dl > dt > a")[0]['href']
          search.title = article.css("#elThumbnailResultArea > li:nth-child(#{i}) > dl > dt > a")[0].text
          search.save
        end
        for i in 1..10
          search = Search.new
          search.url = postt.css("#elThumbnailResultArea > li:nth-child(#{i}) > dl > dt > a")[0]['href']
          search.title = postt.css("#elThumbnailResultArea > li:nth-child(#{i}) > dl > dt > a")[0].text
          search.save
        end
        
        @search = Search.all
#@test = Search.first.title.split(',')[1] #array 사용시
=begin    
        search = Search.new
        data2 = URI("http://www.detizen.com/contest/#{textnum}")
        field2 = Nokogiri::HTML(open(data2))
        image = field2.css("#Main > section:nth-child(3) > div > div > div.top_info.after > div.poster > img")[0]['src']
        competition.photo = image
        
        competition.url = field2.css("#Main > section:nth-child(3) > div > div > div.top_info.after > div.contest-info > table > tbody > tr:nth-child(9) > td > a")[0]["href"]
       
        competition.save
=end

  end  
end
