require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL = "http://psroc.phys.ntu.edu.tw/cjp/issues.php?vol=52&num=2"
BASE_URL = "http://psroc.phys.ntu.edu.tw/cjp/"

FILE_DIR = "cjp_files"

# create directory for downloaded files
Dir.mkdir(FILE_DIR) unless File.exists?(FILE_DIR)

# create Nokogiri object from page_url; used to scrape web page by css tags
page = Nokogiri::HTML(open(PAGE_URL))

# get links by <a> tag, and then filter by .pdf extension
#links = page.css('a').select { |l| l['href'].end_with? FILE_TYPE if l['href'] }

links = page.css('.td_paper')


puts "There are #{links.length} files."
i = 1
links.each do |link|
  title = link.css('.paper_title').text[0..30]
  href = link.css('a')[0]['href']

 puts title.encoding

  puts "Fetching...file #{i}: #{title}"
  local_fname = "#{FILE_DIR}/#{title}.pdf"

  remote_data = open(BASE_URL + href).read
  f = File.open local_fname, 'w'
  f.write remote_data
  f.close
  puts "\t...Success, saved as #{local_fname}"
  i += 1
  sleep 1


end

puts "Downloads Complete"