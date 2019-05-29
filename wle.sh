#!/bin/bash



# test variables
#verbose='1'

function options(){

	options_text="

		Website Link Extractor - switch options

		-w	input url to extract links from

		-v 	enables verbose output

		-h 	display options

	"
	echo "$options_text"
	exit
}



# process arguments
while getopts 'w:vh?' c
do
	case $c in 
		w) length=$OPTARG;;
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



# use curl to retrieve the raw text of the webpage
respose_raw=$(curl -s -X GET $1)

# extract the hyperlinks
links=$(echo $respose_raw|sed 's/http/\nhttp/g;s/</\n</g;s/ /\n /g;s/"/\n"/g;'|grep 'http')

# echo the list of links to output
echo "$links"


if [ -f /var/lib/website-link-extractor/last-check-output.txt ]
then
	echo "$links" > /var/lib/website-link-extractor/last-check-output.txt
fi











exit
