--- 
title: "MCU Timeline Part III"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-02-20
description: "The Marvel Cinematic Universe Timeline Revisited, Again"
categories: ["movies", "timelines"]
tags: ["Marvel", "MCU", "Timelines", "Networks"]
cover: "/img/timeline_landscape.png" 
featuredImage: "/img/timeline_landscape.png" 
featuredImageDescription: ", my <a href=\"../../img/timeline_landscape.png\">MCU Timeline</a>"
dropCap: false
draft: true
---
 
### Visualising the MCU

How do we visualise something as complex as the MCU? Well, there are a 
few other folks who've had a go:

  + [Network Visualisation](http://dataviz.muth.co/avengers-infinity-war/)
  + [Who's who guide to the MCU](https://graphics.straitstimes.com/STI/STIMEDIA/Interactives/2018/04/marvel-cinematic-universe-whos-who-interactive/index.html)
  + [Marvel Cinema Universe Network Analysis](https://datacolumn.wordpress.ncsu.edu/blog/2016/03/27/marvel-cinema-universe-network-analysis/)
 
These are classic cases of network analysis. A network (maths guys sometimes call it a graph)
shows the relationships between a set of entities. In these, they are
aiming to establish relationships between characters (usually it is
assumed they have a relationship if they share a movie), or between
movies (if the movies share characters).

Network analyses are great, and they have classier graphics than I
do. But I want to show a little more than just who's who. Time is a
very important element of any narrative, but is sometimes overlooked
in network views of the data.


### My Timeline of the MCU

There's a lot I want to say about this timeline. First  some footnotes 
<sup><a href="#fn1" id="ref1">1</a></sup>
<sup><a href="#fn2" id="ref2">2</a></sup>
<sup><a href="#fn3" id="ref3">3</a></sup>
<sup><a href="#fn4" id="ref4">4</a></sup> 
<sup><a href="#fn5" id="ref5">5</a></sup>
<sup><a href="#fn6" id="ref6">6</a></sup>. 
Go and read them before you complain too much.

More generally, despite the title, this is not just a timeline. There
are plenty of people doing timelines for the MCU, ranging from
Marvel's own (somewhat course) timeline, giving the movies at a year
level, all the fan to amazingly detailed fan sites. Some of these are
almost at the level of telling us what Iron Man (Tony Stark) had for
breakfast today. Here are links to a few:

 + [The official Marvel timeline (pre-Ant-Man and the Wasp)](https://www.mpaa.org/2018/11/the-official-timeline-of-all-the-marvel-movies/) 
 + [Tiki-Toki's app](https://www.tiki-toki.com/timeline/entry/5395/A-Marvel-Cinematic-Universe-Timeline/)
 + [Fandom's timeline](https://marvelcinematicuniverse.fandom.com/wiki/Timeline) (from the beginning on the Universe onwards)
 + [Business Insider's timeline](https://www.businessinsider.com.au/timeline-of-major-events-in-history-of-the-marvel-cinematic-universe-2018-8?r=US&IR=T)
 + [Collider's timeline](http://collider.com/mcu-timeline-explained/)

The goal of my timeline is to track each of the heroes through the
movies they participate in. So we can see each character's personal
timeline. Each coloured line shows the path of one character (or
sometimes a small group). 

Beyond this the chart has a few cute features:

+ Vertical location is indicative of the time at which the movie was
  set<sup><a href="#fn2" id="ref2">2</a></sup>, though I had to take
  liberties in a few places to make it all fit. I tried to make my
  timeline consistent with as many of the timelines above as I can,
  but they aren't all consistent either. Where possible I give
  precedence to Marvel's timeline, and for detailed placement take
  advice from
  [Collider](http://collider.com/mcu-timeline-explained/), which has
  the lots of detail, and is at least internally consistent.
  
+ Sequences for a particular hero are vertically aligned.

+ Horizontally, we separate the field into *human tech* on the left,
  and *magic, gods and space aliens* on the right.

+ Node colours indicate the *phase* of the MCU. The phases are
  disjoint from the point of view of release dates of movies, but not
  completely so in terms of the timeline.

Ideally, charts like this are laid out by a clever computer program,
but the programming in this case was only just clever enough to do it
manually. Graph visualisation with as many constraints as I added
isn't easy at all. Set it up with so many goals and you almost
certainly end up with an
[NP-hard](https://en.wikipedia.org/wiki/NP-hardness) problem, which is
likely insoluble in any reasonable amount of time. 

But I do have some code/data that goes into this. Start with the
data. The following gives the information I compiled using the
existing timelines, and the table from my
[last post](/posts/post_mcu1/). Code for sucking in this data, and
playing with it lies below. 

TABLE

LINK TO THE DATA

### Code

This is a simple set of code I've been using to learn how to use Data
Frames in
Julia. [Data Frames](http://www.r-tutor.com/r-introduction/data-frame)
are an idea that comes from the programming language
[R](https://www.r-project.org/). They are really just advanced
tables, but they are both a convenient and clever way to store
tabular data. Why are they clever:

+ They naturally map to the way we often store data (e.g., in CSV or
  spreadsheet files), so input and output are easy.

+ Unlike a simple 2D array, they have column headings, and data can be
  indexed by these, which means adding a column to a dataset is easy,
  and often doesn't require changes to code.

+ They can contain different types of data in different columns, which
  is often useful.

+ They allow for missing data, which is endemic in real datasets, in a
   natural and (hopefully) efficient manner. 

Julia has a package `DataFrames`, and in conjunction with a few other
bits and pieces it's very powerful. So here's a few steps to using
it. BTW, I assume you guys can read the docs and install a
package. Sound fair?



TWO DATASETS

  -- inclusion of characters in movies
       -start with X
	    
		
  -- time sequence of movies		


### Some Math: Distance Metrics

It's about time we did some math I guess. So let's start with
something that may seem a little obscure to start with, and work
towards the timeline. 

Some questions I'd like answered are 

+ How alike or different are the characters? 
+ Are any of them so similar that they are in some sense redundant?
+ Are there obvious teams? 
+ How complex is the space of characters?

I can answer these questions with a simple tool, a *distance
metric*. Distances are something we are all familiar with, but one of
the standard tricks of a mathematician is to take something we all
know, and generalise the heck out of it, until it hardly resembles
itself. I say hardly, but the key to good generalisation is to
preserve the **key** properties that make it a *distance*. In these
case of a distance metric these are that the distance 
 {{< raw >}}\( d(x,y) \){{< /raw >}}
between  
{{< raw >}}\(x\){{< /raw >}} and {{< raw >}}\(y\){{< /raw >}} 
(which are elements of some underlying space or set 
{{< raw >}}\(S\){{< /raw >}}) should satisfy:
{{< raw >}}\[
- 
- 
\]
{{< /raw >}} 
The reasons these properties are needed are easy to explain: 

What is harder is to explain why only these are needed. 


RESULTS

### Clustering

Once we have a distance metric, we can do many things. We can
*cluster* the characters. There are many algorithms for doing
so. Julia has 


RESULTS



### Multi-Dimensional Scaling

MDS in Julia using the `MultivariateStats` package.



### Summary

Contrast with other big framchises

+ Harry Potter
+ Star Wars
+ The Fast and Furious

They all have relatively linear timelines





---

Footnotes:

  1. {{<raw>}} <div id="fn1">
  
    The timeline is based only on the movies (with small diversion for
    Agents of Shield, and taking into account the one shots). If the
    various graphic novels are taken into account there are additions
    (for instance, "Fury's Big Week" links Nick Fury and Black Widow
    into the Incredible Hulk).
	
	<a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> 
	{{</raw>}}

  2. {{<raw>}} <div id="fn2">
  
    The vertical locations are intended to help place the movies in
    time. However, many of the movies cover multiple times: Doctor
    Strange takes place over approximately a 1 year period, and
    Captain America: The First Avenger is set predominantly in the
    1940s. Additionally many of the movies have flashbacks, and some
    have flash forwards. The vertical position of the nodes in the
    picture are chosen to help show the sequence so, for instance, we
    base the timing of Captain America on the modern time (which
    although it is a short part of the movie is the important part
    from the point of view of the sequence).
	
	  <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> 
	  {{</raw>}}

  3. {{<raw>}} <div id="fn3">
  
    We could argue about what it means to "be in" one of the
    movies. Some appearances are only in end credits (Nick Fury in
    Iron Man), or via a taped video (Captain America in Spider-Man, or
    Black Widow in Ragnarok), and in some cases these are not even
    credited. Our approach is to include an appearance if the
    character speaks, but not if it is an indirect reference (e.g., we
    exclude the reference to Spider-Man in Ant-Man).
	
	  <a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
	  {{</raw>}}

  4. {{<raw>}} <div id="fn4">
  
    On the other hand, we include the one-shot movie "The Consultant"
    as an extended end-credit of The Incredible Hulk (it overlaps with
    the actual end-credit), and it places Coulson in that movie's
    timeline.
	
	  <a href="#ref4" title="Jump back to footnote 4 in the text.">↩</a></div> 
	  {{</raw>}}

  5. {{<raw>}} <div id="fn5">
  
    Most of the appearances create a well-ordered set of movies, i.e.,
    we don't see something in one movie that occurs later than another
    movie. It's a little dicy during Fury's Big Week (Iron Man 2, The
    Incredible Hulk and Thor all happen almost in parallel), but the
    only place where we can't maintain a sequence at all is the
    pre-view of the Winter Soldier (and Cap and Falcon) in the end
    credits of Ant-Man. So in this one instance there is a loop in the
    paths. All others are "simple" paths.
	
	  <a href="#ref5" title="Jump back to footnote 5 in the text.">↩</a></div> 
	  {{</raw>}}

  6. {{<raw>}} <div id="fn6">
  
	  Why these characters in particular. The goal was to track the
	  superheroes (excluding villains for the most part). And by its
	  nature it only sees characters that are in at least 2 movies.
	  But there are borderline cases. Why not your favourite love
	  interest -- Pepper Potts -- or Maria Hill. Honestly I don't have
	  a good reason except that it was starting to get just too
	  complicated. I'll keep trying to integrate as many as I can. 
  
	  <a href="#ref6" title="Jump back to footnote 6 in the text.">↩</a></div> 
	  {{</raw>}}
