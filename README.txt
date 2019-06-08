

           _      
          | |     
 __      _| | ___ 
 \ \ /\ / / |/ _ \
  \ V  V /| |  __/
   \_/\_/ |_|\___|
                  



Website Link Extractor



https://github.com/pinebase/website-link-extractor

# Author: Scott Forsberg
# Contact: contact.scottforsberg@gmail.com

# Release Date: 2019-06-08
# Version: .4



Description

	Extract all of the urls found on a given website.
	Present the urls in a newline delimited list.


Prerequisites

	Bash Shell

	Operating Systems

		Linux

			Centos
			Redhat
			Fedora

	Curl	



Installation

	Download and unzip the program files, then change working directory to them:
	
		# cd website-link-extractor


	Next, run the installation script:

		# ./install.sh


	This will install the following files and folders:

		write protected library files, version specific
			/usr/lib/website-link-extractor/v$version	

		storage for lists of generated words
			/var/lib/website-link-extractor

		man page for wle				
			/usr/local/share/man/man1/wle.1		



Options

	-u	input url to extract links from

	-v 	enables verbose output

	-h 	display options

Usage
	
	Extract urls from webpage: 

	# wle http://website_url.com

	# wle -u http://website_url.com


License 

	This program is licensed under the GPL License, view the LICENSE.md file for more information.





































------------------------------------------------------------------------------------------














# Program:	Word Generator
# Created:	2018-03-15
# Version:	.1
# Language:	Shell

# Author:	Scott Forsberg
# Contact:	contact.scottforsberg@gmail.com
# Website:	https://github.com/pinebase/



Description

Generate words of various lengths and composition. Types include randomly generated words, and compound words made up of smaller terms.



Installation

Change directory to the folder which contains the word generator program. Then, access the program via the "./" command prefix to specify filed located in the current working directory.

example:

cd /home/username/Downloads/word-generator
$ ./wg.sh 



Copywrite

MIT Liscense



Options

		Word Generator - (wg)

		switch options

		-l 	set number of letters per word 5-7
			default is 6

		-r	use real words, combinations of 3 and 4 letter random words

		-v 	enables verbose output

		-w 	set number of words to generate, default is 1

		-? 	display options



		Word Generator Domian Check - (wg-domain-check)

		switch options

		-a	check words found in ~/.word-generator/words_to_check.txt
			default setting
			overrides inididual word input check

		-i 	input word
			example: ./check.sh i test -v

		-v 	enables verbose output

		-? 	display options






