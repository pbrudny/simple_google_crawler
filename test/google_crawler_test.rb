require_relative 'test_helper'
require_relative '../lib/google_crawler'

describe GoogleCrawler do
  describe 'when initialized with default agent' do
    before do
      @crawler = GoogleCrawler.new
    end

    describe '#search' do
      describe 'searches for "which university"', :vcr do
        before do
          @result_page = @crawler.search('which university')
          VCR.insert_cassette 'which_university'
        end

        it 'returns google results' do
          @result_page.must_be_kind_of Mechanize::Page
        end

        describe '#click' do
          before { @page = @crawler.click }

          it 'has a right site' do
            @crawler.page_title.must_equal 'Which? University - find the best university & degree course'
          end
        end

        after do
          VCR.eject_cassette
        end
      end
    end
  end
end