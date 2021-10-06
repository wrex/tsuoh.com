#!/bin/bash

# Parent directory containing all files
SRCDIR=/Users/rex/Public/

# Subdirectory containing the hugo source
SUBDIR=tsuoh.com

# Backup Target: where a copy of all source files will be stored
BUTARGET="ve.doiwalters.com:"

# HTML Target: where to publish the generated website
HTMLTARGET="ve.doiwalters.com:/var/www/tsuoh.com/public_html"

echo
echo changing directory to $SRCDIR
echo
cd $SRCDIR

echo
echo "* * * COPYING $SUBDIR TO $BUTARGET * * *"
echo

echo rsync -avr $SUBDIR $BUTARGET
rsync -avr $SUBDIR $BUTARGET

echo
echo "* * * CD INTO $SUBDIR * * *"
echo

cd $SUBDIR

echo
echo "* * *  BUILDING WEBSITE WITH HUGO * * *"
echo

hugo

echo
echo "* * * PUBLISHING GENERATED HTML FILES * * *"
echo

echo cd public
cd public

echo rsync -avr . $HTMLTARGET
rsync -avr . $HTMLTARGET

