require 'rubygems'
require 'nokogiri'
require 'open-uri'

HOME_URL = "http://psroc.phys.ntu.edu.tw/cjp/issues.php"
BASE_DIR = 'downloads/'
BASE_URL = "http://psroc.phys.ntu.edu.tw/cjp/"

# get links to issues on homepage
issues = Nokogiri::HTML(open(HOME_URL)).css('#main_container a')

# get first 3 links(issues)
issues[0..2].each do |issue| 

    # url to specific issue
    page_url = HOME_URL + issue['href'] 

    # create Nokogiri object from page_url; used to scrape web page by css tags
    page = Nokogiri::HTML(open(page_url))

    # create directory for each issue
    issue_name =  page.css('.oneLine_align_left').text
    file_dir = BASE_DIR + issue_name
    Dir.mkdir(file_dir) unless File.exists?(file_dir)

    # get list of papers in issue
    papers = page.css('.td_paper') 

    puts "There are #{papers.length} papers in #{issue_name}:"

    #######################################
    # download and save papers to directory
    #######################################
    papers.each_with_index do |paper, i|
        title = paper.css('.paper_title').text[0..30]
        href = paper.css('a')[0]['href']
        puts "Fetching...file #{i+1}: #{title}"
        local_fname = "#{file_dir}/#{title}.pdf"
        remote_data = open(BASE_URL + href).read
        f = File.open local_fname, 'w'
        f.write remote_data
        f.close
        puts "\t...Success, saved as #{local_fname}"
        sleep 1 
    end
    puts "Downloads Complete (#{issue_name})\n\n"
end