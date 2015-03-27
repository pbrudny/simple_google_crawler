require_relative 'lib/crawler'

crawler = GoogleCrawler.new
crawler.search('which university')
crawler.click
puts crawler.page_content