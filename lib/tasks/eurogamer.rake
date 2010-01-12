STDOUT.sync = true
require 'open-uri'
require 'nokogiri'

namespace :eurogamer do
  desc "Get scores from Eurogamer.net"
  task :get_scores => :environment do
    puts "Importing reviews..."
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE reviews")
    reviewcount = 0
    
    # yes, I got these by hand. These are all the urls with a 2009 review on.
    urls = "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=0",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=50",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=100",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=150",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=200",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=250",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=300",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=350",
           "http://www.eurogamer.net/archive.php?sort=reversechrono&platform=&type=review&author=&start=400"
    urls.each do |url|
      doc = Nokogiri::HTML(open(url))
      tablerows = doc.css("table.articleList tbody tr")
      tablerows.each do |row|
        day, month, year = row.css("td:nth-of-type(4)").inner_text.strip.split("/")
        if year == "2009"
          abstract = row.css("td:nth-of-type(3)").inner_text.strip
          date = Date.new(year.to_i, month.to_i, day.to_i) 
          if row.css("img").any?
            platform = row.css("img").attribute("title").to_s 
          else
            platform = ""
          end
          title = row.css("th a:nth-child(1)").inner_text
          url = "http://eurogamer.net/" + row.css("th a:nth-child(1)").attribute("href").to_s
          reviewer = row.css("th a:nth-child(2)").inner_text
          score = row.css("td.score big").inner_text
        
          # puts "(#{date}) #{title} (#{platform}): #{score} [#{reviewer}] [#{url}]"
          writer = Writer.find(:first, :conditions => {:name => reviewer})
          if !writer
            writer = Writer.create(:name => reviewer)
          end
          Review.create(:written_on => date, :title => title, :platform => platform, :score => score, :writer => writer, :url => url)
          print "."
          reviewcount += 1
        end
      end
    end
    puts
    puts "Imported #{reviewcount} reviews."
  end
  
  desc "Generate slugs for writers"
  task :generate_writer_slugs => :environment do
    Writer.all.each do |writer|
      slug = writer.name.downcase.gsub(" ", "-")
      writer.slug = slug
      writer.save
    end
  end
  
  desc "Generate slugs for reviews"
  task :generate_review_slugs => :environment do
    Review.all.each do |review|
      review.slug = review.to_slug
      review.save
      print "."
    end
  end
  
  desc "Get Metacritic urls"
  task :get_metacritic_urls => :environment do
    Review.all.each do |review|
      querystring = CGI::escape("#{review.title.downcase} #{review.platform}")
      url = "http://www.metacritic.com/search/process?sb=0&tfs=all&ts=#{querystring}&ty=3&x=0&y=0"
      # puts url
      doc = Nokogiri::HTML(open(url))
      links = doc.css("a").select {|link| link.attribute("href").value =~ /.*platform.*/ if link.attribute("href")}
      if links.any?
        review.metacritic_url = links.first.attribute("href").value
        review.save
      end
      print "."
    end
  end
end