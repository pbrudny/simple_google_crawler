require_relative 'lib/google_crawler'

crawler = GoogleCrawler.new
crawler.search('which university')
crawler.click
puts crawler.page_content