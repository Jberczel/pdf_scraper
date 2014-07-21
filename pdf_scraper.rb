require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL = "http://www.federalreserve.gov/releases/lbr/"
FILE_TYPE = '.pdf'
FILE_DIR = "pdf_files"

# create directory for downloaded files
Dir.mkdir(FILE_DIR) unless File.exists?(FILE_DIR)

# create Nokogiri object from page_url; used to scrape web page by css tags
page = Nokogiri::HTML(open(PAGE_URL))

# get links by <a> tag, and then filter by .pdf extension
links = page.css('a').select { |l| l['href'].end_with? FILE_TYPE if l['href'] }

# links = page.css('a').to_a

puts "There are #{links.length} #{FILE_TYPE} files."

# for each of the links create file and save to local directory
links.each_with_index do |link, i| 
  puts "fetching...file_#{i+1}: #{PAGE_URL + link['href']}"
  local_fname = "#{FILE_DIR}/file_#{i+1}.pdf"
  remote_data = open(PAGE_URL + link['href']).read
  somefile = File.open local_fname, 'w'
  somefile.write(remote_data)
  somefile.close
  puts "\t...Success, saved as #{local_fname}"
  sleep 1
end

puts "Downloads Complete"