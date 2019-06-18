#!/bin/bash


# set program variables
program_name="url-extractor"
version=$(cat /var/lib/$program_name/current_version)


# program display funtions
function display_options(){

	options_text="

		URL Extractor - options

		version $version

		-u	input url to extract links from

		-v 	enables verbose output

		-h 	display options


			
		https://github.com/pinebase/$program_name
	"
	echo "$options_text"
	exit
}

function display_liscence(){

	display_text=$(cat /usr/lib/$program_name/v$version/COPYING)
	echo "$display_text"
	exit
}


# add --help feature
if [ "$1" == '--help' ]
then
	display_options
fi


# gnu compliant show command output
if [ "$1" == 'show' ]
then
	display_liscence
fi


# check for an inout url
if [ "$1" == '' ]
then
	echo "# enter a url"
	exit
fi


# process arguments
while getopts 'u:vh?' c
do
	case $c in 
		u) url=$OPTARG;;
		v) verbose='1';;
		h) options;;
		?) options;;
	esac
done	

if [ "$1" == '' ];
then
	echo "# input url required"
	exit
fi


# set url variable
if [ "$url" == '' ];
then
	if [ "$1" != '' ];
	then
		url=$1
	else
		exit
	fi
fi


# use curl to retrieve the raw text of the webpage
respose_raw=$(curl -s -X GET $url)

# extract the hyperlinks
links=$(echo $respose_raw|sed 's/http/\nhttp/g;s/</\n</g;s/ /\n /g;s/"/\n"/g;'|grep 'http')

# echo the list of links to output
echo "$links"

# log results of last extraction
if [ -f /var/lib/$program_name/last-check-output.txt ]
then
	echo "$links" > /var/lib/$program_name/last-check-output.txt
fi


exit
