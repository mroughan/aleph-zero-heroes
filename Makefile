# Makefile for 
# Copyright (C) 2003 Matthew Roughan roughan@research.att.com
#

HUGO="hugo"
# hugo --buildDrafts, for viewing drafts


all: FORCE
#	/snap/hugo/current/bin/hugo --cleanDestinationDir --buildFuture --buildDrafts -b "http://bandicoot.maths.adelaide.edu.au/public/AZH/"
	/usr/local/bin/hugo --cleanDestinationDir --buildFuture --buildDrafts -b "http://bandicoot.maths.adelaide.edu.au/public/AZH/"

install: all
	./rsync_www


# run every time
FORCE:


# /snap/hugo/current/bin/hugo new site aleph-zero-heros
# cd aleph-zero-heros
# edit config
# /snap/hugo/current/bin/hugo new post1.md


# snap seems to update version, and something went wrong with later versions and my theme
# so for the moment try
#     https://hostadvice.com/how-to/how-to-install-hugo-on-ubuntu-18-04/
# 0.48 is being used on netlify
# 0.50 - 0.54.0 (up to Feb 1, 2019) seems to still mostly work here
# 0.55.6, 0.57.2, 0.58.2, 0.59.2 breaks tables/html, but inline images and code still work (starting April)
# current (Dec 2019) version is 0.61, which also does bad things with images, and code and some shortcodes
# 
#
# big changes from 0.54 - 0.55
#     {{% as the outer-most delimiter will now be fully rendered -- explains one problem
#           fix:   {{ $_hugo_config := `{ "version": 1 }` }}
#           but prefer {{<
#     .Page on Taxonomy nodes should be used to get, e.g., {{ .Page.Title }}
