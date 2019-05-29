#!/bin/bash




if [ ! -d /var/lib/website-link-extractor/ ]
then
	mkdir /var/lib/website-link-extractor/
fi


if [ ! -d /usr/lib/website-link-extractor/ ]
then
	mkdir /usr/lib/website-link-extractor/
fi


if [ ! -f /var/lib/website-link-extractor/last-check-output.txt ]
then
	touch /var/lib/website-link-extractor/last-check-output.txt
fi


version=$(cat ./version)




if [ ! -d /usr/lib/website-link-extractor/v$version/ ]
then
	mkdir /usr/lib/website-link-extractor/v$version/
fi


pwd=$(pwd)

# copy program files to /var/lib

cp $pwd/* -r /usr/lib/website-link-extractor/v$version/


chmod 755 /usr/lib/website-link-extractor/v$version/wle.sh
chmod 766 /var/lib/website-link-extractor/last-check-output.txt

# install the word generator man page

if [ -f ./manual/wle.1 ]
then
	if [ -d /usr/local/share/man/man1/ ]
	then
		# copy manual file
		cp ./manual/wle.1 /usr/local/share/man/man1/wle-website-link-extractor.1

		# refresh system man pages
		mandb -q
	fi
fi






unlink /usr/bin/wle 2>/dev/nul


ln -s /usr/lib/website-link-extractor/v$version/wle.sh /usr/bin/wle






exit
