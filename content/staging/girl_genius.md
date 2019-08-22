--- 
title: "The Genius of Girl Genius"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-08-14
lastmod: 2019-08-21 15:33:50
description: "Adventure, Romance, MAD DATA SCIENCE!"
categories: ["comics"]
tags: ["Girl Genius"]
cover: "img/batman_eq_ed.svg" 
featuredImage: "img/batman_eq_ed.svg" 
featuredImageDescription: "Batman equation"
dropCap: false
draft: true
toc: true
spoilers: false 
---

<!-- https://www.goodreads.com/author/quotes/42122.Phil_Foglio -->

<!-- “As Master Payne escorted her to the waiting coach, a small frown crossed her face. "People keep giving me rings," she confided to him, "But I think a small death ray might be more practical.” -->
<!-- ― Phil And Kaja Foglio, Agatha H and the Clockwork Princess  -->


<!-- “Is this one of those situations that involves "ethics"? 'Cause I'm a cat, you know. I've never been very good at those.” -->
<!-- ― Phil Foglio, Agatha Heterodyne and the Voice of the Castle  -->


Best reason I have hear to propose to someone you just met: 

“Agatha, I've decided. I'm going to marry you for your library.”
― Phil Foglio, Agatha Heterodyne and the Hammerless Bell 

Is Girl Genius large-scale -- well not compared to Marvel or DC. 

Really, it's a little independent web comic. 

So why look at it?

Honestly, I couldn't resist paraphrasing their tagline: Adventure, Romance, MAD DATA SCIENCE!
And I have always loved Phil Folgio's work, back from his days
adapting Robert Aspirin's Mything series in the 80s. You have to
love a writer who throws in little details like a "The King in Yellow
paint-by-numbers book" in the background of a characters belongings. 

Girl Genius started as a web comic, but has been published as a
graphic novels in around 18 volumes, and through several more
conventional novels (no-one should ever call Agatha Heterodyne
conventional though). It's had a continuous history from 2000 to the
present. There are apparently also a few games. 

It has won numerous awards. It's also ground breaking in using a
female character in a role as adventurer and mad scientist. The former
might be becoming more common, but I can't (of the top of my head)
remember another female mad scientist. 

So I want to write about *Girl Genius*, but in a (hopefully uncommon)
turn I don't plan to create a new dataset/code for this one. There are
a come coooool tools out there, and I thought I would just write about
them. 

RegExps in Data Science 

Pattern matching in text 



# Jägerizers

One of the recurring groups in the novels are the Jägermonsters.

Apart from an amusing dedication to hats[^1], the Jägers speak in a
heavily accented version of "English", if you can even call it that. 

For instance

> I would like to buy your hat

would become

> Hy vould like to buy you het 

There are a couple of translators out there. 

 + http://santiago.mapache.org/toys/jager/jagerize.cgi

 + http://home.hiwaay.net/~lkseitz/comics/girlgenius/jt_faq.shtml
 
The tools above were developed independently. One is just a shell
script using SED -- if you don't know what SED is, you haven't
lived[^2] -- accessed through a CGI/web interface. The other is
Javascript.

Both are use fairly direct text replacement, e.g. "hat" is replaced
with "het", but both make heavy use of regular expression.

So that is an excuse to talk about one of the most powerful string
manipulation tools we have at our disposal.

# RegExp primer plus plus

There are lots of tutorials on RegExps. So I don't plan to try to
teach you them in five minutes. I want to:

1. Show you why they are useful, and 
2. Give you a starting point to use them in Julia.

First I do have to tell you a little about them, and I want to start
from a fairly theoretical viewpoint. 

A regular expression is not just a pattern match. It is an instance of
a computer programming language. The languages you are most likely
familiar with: Python or Julia or C, for example are general purpose
languages. They can, in principle, do each others' jobs. A RegExp
lives in a more rarefied space. RegExps cannot do everything that, for
instance, C can do. They are especially designed for pattern
matching. 

The difference is expressed formally through  the Chomsky hierarchy of
formal grammars. In this hierarchy, a language/grammar is described by 

1. it's alphabet of symbols; and 
2. a set of production rules that describe how "sentences" or "programs" can be
   created from the symbols and other programs (writen in this language).

It's a highly abstract model of computer programming languages. In
this hierarchy "recursive enumerable" languages such as Julia sit at
the top, and RegExps sit a the bottom. The higher up you are, the more
you can do, but also the more complex you are to work with. For
instance, we often refer to a Turing machine as a model for
computation. However, a RegExp can be implemented with a Finite state
automaton, and that makes them simple to implement (if less
powerful). 

They turn out to be idea for matching patterns in text. 


The syntax we use for RegExps in many modern languages seems to have
originated in Perl. That's certainly where I learnt it. But Perl's
RegExps have features and ideas that harken back to the early days of
Unix and tools like the afore-mentioned SED. 


## Quick Howto



## Examples in Julia




## Why use RegExps




# A de-Jägerizers


As far as I know, there isn't a Jäger to English converter though. I
took the liberty. 

I used Javascript (so that we can include it here easily). 

I derived my code, however, by inverting the code from ...  using
Julia to create a large corpus of text on which to work. 


The current translators are just doing text replacement. That is, they
recognize a pattern, which may be a single word, 

> hat

a group of words used together

> holy cow

or a component of a word

> "any"

as in "anywhere" -> "hennywhere"

That makes translation easy. We just look for a pattern, and then
substitute the appropriate replacement. Regular expressions are only
use to 

+ reduce the list to something a little easier to deal with, and 
+ avoid cases where two matches might conflict. 





CORPUS of EXAMPLES


We can learn a set of regular expressions for these matches by
creating a data set. 




# Other Girl Genius cool stuff

## Heterodyne Story Generator 

https://www.seventhsanctum.com/generate.php?Genname=hstory


## Annotations

http://www-cs.canisius.edu/~salley/girlgenius/


## Codes


Each novel has a code in it


# 


transcript? 

predictability?

hidden-markov model??


---


Footnotes

1 - The hats thing seems to be a Foglio fetish, e.g.,

> 
“Tarvek: "You call that 'throwing?'"
Gilgamesh: "Hey, at least I got his hat!”
― Phil Foglio 

> 
“Ah! Speak of the devil, and you find her in your hat.”
― Phil Foglio, Agatha Heterodyne and the Clockwork Princess 

> “Any plan where you lose your hat is a bad plan.”
― Phil Foglio, Agatha Heterodyne and the Beetleburg Clank 



2 - The statement about SED is not true. But SED is very useful, and
    part of a larger suite of unix tools that seem simple, but
    together are amazingly powerful. 
