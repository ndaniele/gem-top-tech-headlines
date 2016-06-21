#CLI Controller
class TopTechArticles::CLI

  def call
    list_articles
    menu
    goodbye
  end

  def list_articles
    puts "
    TODAY'S TOP TECH HEADLINES(courtesy of cnet.com):
    "
     
    @article = TopTechArticles::Articles.article
    @article.each.with_index(1) do |article, i|
      puts "#{i}. #{article.headline} - by #{article.author}
      " # - #{article.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the article you'd like the URL link to, type list to see all headlines, or type exit"
      input = gets.strip
      
      if input.to_i > 0 
        the_article = @article[input.to_i-1]
        puts "http://www.cnet.com#{the_article.url}
        " #{}"#{the_article.headline} - #{the_article.author} -
      elsif 
        input == "list"
        list_articles
      elsif input == "exit"
      break
      else
        puts "I'm not sure what you want..."
      end
    end    
  end

  def goodbye
    puts "
    THANKS FOR READING TODAY'S TOP TECH HEADLINES! ...stop back in tomorrow!"
  end

end