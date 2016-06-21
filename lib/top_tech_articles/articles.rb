class TopTechArticles::Articles
  attr_accessor :headline, :url, :author

  def self.article
    #should return the headline attributes from instances of articles"  
    #Scrape c|net and return real info for real articles

    self.scrape_articles
  end

  def self.scrape_articles
    articles = []
    self.scrape_cnet
    #go to c|net
    #extract the properties of top articles
    # - headlines, - by line, -url
    #instantiate an article object

   
  end

  def self.scrape_cnet
    doc = Nokogiri::HTML(open("http://www.cnet.com/"))
    top_stories = doc.css(".fd2016-editorsfavorites .item")

   # all_titles = top_stories.collect { |element| element["title"] }
    #all_url = top_stories.collect { |element| element["href"] }

    #top_stories.collect.with_index(1) { |element, i| #element["title"], element["href"]
    
     # author = element.css('.author a').text.strip
     # headline = element.css('a.mainLink').first['title']
     # url = element.css('a.mainLink').first['href']

      articles = []

      top_stories.each do |element| 
        if !element.css('a.mainLink').first
        else
         articles << article = self.new
          article.author = element.css('.author a').text.strip
          article.headline = element.css('a.mainLink').first['title']
          article.url = element.css('a.mainLink').first['href']
        end
      end



      articles
  end
end