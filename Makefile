# Makefile for 
# Copyright (C) 2003 Matthew Roughan roughan@research.att.com
#

HUGO="hugo"
# hugo --buildDrafts, for viewing drafts


all: FORCE
	/snap/hugo/current/bin/hugo -b "http://bandicoot.maths.adelaide.edu.au/public/aleph-zero-heroes/"

install: FORCE
	./rsync_www


# run every time
FORCE:


# /snap/hugo/current/bin/hugo new site aleph-zero-heros
# cd aleph-zero-heros
# edit config
# /snap/hugo/current/bin/hugo new post1.md
