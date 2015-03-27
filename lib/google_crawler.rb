require 'rubygems'
require 'mechanize'

class GoogleCrawler

  def initialize(agent = 'Mac Safari')
    self.mechanize = Mechanize.new(user_agent_alias: agent)
  end

  def search(query)
    @page = mechanize.get("http://www.google.com/search?q=#{query}")
  end

  def click
    @page = mechanize.click(first_result.text)
  end

  def page_title
    @page.title
  end

  def page_content
    @page.content
  end

  private

  attr_accessor :mechanize

  def result(number)
    @page.search("//h3[@class='r']")[number-1]
  end

  def first_result
    result(1)
  end
end