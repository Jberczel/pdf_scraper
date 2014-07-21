##Parsing HTML and downloading pdf links

Simple ruby script, which downloads pdf links on single webpage.

Sample output:
```
jamies-air:pdf_scraper jxberc$ ruby pdf_scraper.rb
There are 12 .pdf files.
fetching...file_1: http://www.federalreserve.gov/releases/lbr/current/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_1.pdf
fetching...file_2: http://www.federalreserve.gov/releases/lbr/20030630/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_2.pdf
fetching...file_3: http://www.federalreserve.gov/releases/lbr/20030331/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_3.pdf
fetching...file_4: http://www.federalreserve.gov/releases/lbr/20021231/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_4.pdf
fetching...file_5: http://www.federalreserve.gov/releases/lbr/20020930/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_5.pdf
fetching...file_6: http://www.federalreserve.gov/releases/lbr/20020630/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_6.pdf
fetching...file_7: http://www.federalreserve.gov/releases/lbr/20020331/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_7.pdf
fetching...file_8: http://www.federalreserve.gov/releases/lbr/20011231/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_8.pdf
fetching...file_9: http://www.federalreserve.gov/releases/lbr/20010930/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_9.pdf
fetching...file_10: http://www.federalreserve.gov/releases/lbr/20010630/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_10.pdf
fetching...file_11: http://www.federalreserve.gov/releases/lbr/20010331/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_11.pdf
fetching...file_12: http://www.federalreserve.gov/releases/lbr/current/lrg_bnk_lst.pdf
  ...Success, saved as pdf_files/file_12.pdf
Downloads Complete
jamies-air:pdf_scraper jxberc$
```
