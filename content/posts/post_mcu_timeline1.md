---
title: "MCU Timeline Part I"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-03-08
description: "Building a Timeline for the Marvel Cinematic Universe: paths, graphs and automobiles"
categories: ["movies", "timelines"]
tags: ["Marvel", "MCU", "Timelines", "Networks", "Narrative Chart"]
cover: "/img/timeline_landscape.png" 
featuredImage: "/img/timeline_landscape.png" 
featuredImageDescription: ", my <a href=\"/img/timeline_landscape.png\">MCU Timeline</a>"
draft: false
--- 

I talked about the Marvel Cinematic Universe (MCU) and why it's
interesting in a [previous post](/posts/post_mcu1/). Have a read if you
want to get started on this. Today I want to talk about a way of
visualising the relationships between the characters and the movies in
a *timeline* (shown above). 

# Visualising the MCU

How do we visualise something as complex as the MCU? Well, there are a
few other folks who've had a go:

  + <a href="http://dataviz.muth.co/avengers-infinity-war/" target="_blank">Network Visualisation</a>
  + <a href="https://graphics.straitstimes.com/STI/STIMEDIA/Interactives/2018/04/marvel-cinematic-universe-whos-who-interactive/index.html" target="_blank">Who's who guide to the MCU</a>
  + <a href="https://datacolumn.wordpress.ncsu.edu/blog/2016/03/27/marvel-cinema-universe-network-analysis/" target="_blank">Marvel Cinema Universe Network Analysis</a>

These are classic network analyses. A network (maths peeps sometimes
call it a graph) shows the relationships between a set of
entities. These analyses are aiming to establish relationships between
characters, or between movies. From those we can work out *central*
characters, and so on. But I think you already know the central
characters, more or less. Frankly, you can just count the number of
movies each character is in. 

Network analyses are great, and these ones have classier graphics than
I do. But I want to show a little more than just who's who. Time is a
very important element of any narrative, but is sometimes overlooked
in network views of the data. So, inspired by the map of Napolean's
Russian campaign by
[Minard](https://en.wikipedia.org/wiki/Charles_Joseph_Minard) (Tufte
called Minard's figure "one of the best statistical graphics ever",
*Beautiful Evidence*).

{{< figure src="/img/Minard.png"  
           attrlink="https://en.wikipedia.org/wiki/File:Minard.png"
           alt="Minard's graphic of Napolean's losses in the Russian campaign."
		   caption="Minard's graphic of Napolean's losses in the Russian campaign."
>}}

and the "Movie Narrative Charts" of XKCD,

<!-- <figure> -->
<!--   <img src="https://imgs.xkcd.com/comics/movie_narrative_charts.png" -->
<!-- 	   attrlink="https://xkcd.com/657/" -->
<!-- 	   link="https://xkcd.com/657/" -->
<!--        alt="https://xkcd.com/657/"  /> -->
<!--   <figcaption> -->
<!--       <h4><a href="https://xkcd.com/657/">https://xkcd.com/657/</a></h4> -->
<!--   </figcaption> -->
<!-- </figure> -->

{{< figure src="https://imgs.xkcd.com/comics/movie_narrative_charts.png" 
           attrlink="https://xkcd.com/657/"
	       link="https://xkcd.com/657/"
           alt="https://xkcd.com/657/"
		   caption="https://xkcd.com/657/"
>}}

I had a go at a timeline/flow diagram/narrative chart of the MCU (see
above for the picture, and below for some details).

# My Timeline of the MCU

There's a lot I want to say about this timeline. First  some footnotes 
{{< footnote_marker 1 >}}
{{< footnote_marker 2 >}}
{{< footnote_marker 3 >}}
{{< footnote_marker 4 >}}
{{< footnote_marker 5 >}}
{{< footnote_marker 6 >}}
{{< footnote_marker 7 >}}.
Go and read them before you get upset about mistakes. I'm not saying
there aren't any mistakes, just that I some things that look like
mistakes aren't.

There are plenty of people doing timelines for the MCU, ranging from
[Marvel's own](https://www.mpaa.org/2018/11/the-official-timeline-of-all-the-marvel-movies/)
coarse-grained timeline, to amazingly detailed fan sites. Some of
these are almost at the level of telling us what Iron Man (Tony Stark)
had for breakfast today. Here are links to a quite a few:

 + [Marvel's Phase 1 infographic](http://i.annihil.us/u/prod/marvel/i/mg/5/40/4fbaad4f8d5ea.jpg)
 + [The official Marvel timeline (pre-Ant-Man and the Wasp)](https://www.mpaa.org/2018/11/the-official-timeline-of-all-the-marvel-movies/) 
 + [Tiki-Toki's app](https://www.tiki-toki.com/timeline/entry/5395/A-Marvel-Cinematic-Universe-Timeline/)
 + [Fandom's timeline](https://marvelcinematicuniverse.fandom.com/wiki/Timeline) (from the beginning on the Universe onwards)
 + [Business Insider's timeline](https://www.businessinsider.com.au/timeline-of-major-events-in-history-of-the-marvel-cinematic-universe-2018-8?r=US&IR=T)
 + [Collider's timeline](http://collider.com/mcu-timeline-explained/)
 + [The Wiki Discussion](https://en.wikipedia.org/wiki/List_of_Marvel_Cinematic_Universe_films#Timeline)

However, despite the title, I am not just doing another timeline. In
XKCD terms it's a *narrative chart* and I think of it as a *flow
diagram*, and there are other names as well (see [links](#links) at the end of
this), but timeline is easier to explain I think?

The goal of my timeline is to track each of the heroes through the
movies they participate in. So we can see each character's personal
timeline. Each coloured line shows the path of one character (or
sometimes a small group). 

Beyond this the chart has a few other objectives:

+ Horizontal location is indicative of the time at which the movie was
  set<sup><a href="#fn2" id="ref2">2</a></sup>, though I had to take
  liberties in a few places to make it all fit. I tried to make my
  timeline consistent with as many of the timelines above as I can,
  but they aren't all consistent either. Where possible I give
  precedence to Marvel's official timeline, and for detailed placement
  take advice from
  [Collider](http://collider.com/mcu-timeline-explained/), which has
  the lots of detail, and is at least internally consistent. I'm
  suspicious that I should move *Infinity War* into 2018, to be
  consistent with Collider, but for the moment let's stay with the
  official Marvel version where possible.
  
+ Sequences (direct sequels) for a particular hero are horizontally
  aligned, and non-sequences avoid alignment (as much as possible). 

+ The field is vertically separated into *human tech* on the bottom,
  and *magic, gods and space aliens* on the top, though this is a
  coarse discriminator (the Tesseract in the 1st *Captain America* might
  seem to place it with the latter, but this doesn't fit with the
  other placement criteria).

+ Node colours indicate the *phase* of the MCU. The phases are
  disjoint from the point of view of release dates of movies, but not
  so in terms of the timeline.

Ideally, charts like this are laid out by a clever computer program,
but the programmer in this case was only just clever enough to do it
manually. There are tools to draw these (see [links](#links) below),
but graph visualisation with as many constraints as I added isn't easy
at all. Set it up with so many goals and you almost certainly end up
with an [NP-hard](https://en.wikipedia.org/wiki/NP-hardness) problem,
which is likely insoluble in any reasonable amount of time.

I do have some code/data that goes into this.  This
[CSV file](/csv/movie_sequence.csv) gives the information I compiled
(by hand) from the existing timelines, and the table from my
[last post](/posts/post_mcu1/). The data is also shown below:

{{% movie_sequence src="static/csv/movie_sequence.csv" %}}
    
The "setting" year and month refer to my best estimate of where the
movie should be placed in the timeline, given all of the caveats
mentioned above, and the footnotes below.
	
# Building the Picture

The timeline (the picture above) was drawn manually using
[Inkscape](https://inkscape.org/), which is a brilliant tool for
vector graphics. In theory I could automate drawing of these and I
definitely plan to have a go at it, but let's do that later. 

In the [last post](/post/post_julia1.md) I explained how to download
data via Web APIs. I used the same approach, but in addition used
[IMDbPY](https://imdbpy.sourceforge.io/) to download cast data from
IMDb (which doesn't have such a nice API). The raw cast data has some
problems: apart from a couple of spelling mistakes, there is no
consistency on how to name any of the heroes. At the simplest level
this is because heroes have alter egos, but even then, there are
multiple variants used. To keep track of these I have a little file
[full of aliases](../../csv/alias_list.csv). Here's the first few
entries:

{{% csv_table src="static/csv/alias_list.csv"  maxLines="7" colStyle="text-align:left" %}} 

The list doesn't include all named characters (yet), but has most that
appear in more than one movie. 

I use these aliases (via a Julia dictionary -- see my
[last post](/posts/post_julia1/)) to map the cast names in IMDb to a
consistent set of names. I mostly use the standard "superhero"
name. This has limits (in the future it is possible that more than one
person will take the roll of, for instance, Captain America), but it
is acceptible for the current MCU.

There is one problem with this. You **always** need to spend time
cleaning your data. In this case I went through it a few times,
checking details. Most of the problems occurred because my alias list
wasn't complete, and these were easy to fix. But there are a few weirdnesses: 

+ Black Widow appears in *Ragnarok* but is not listed in
  IMDb. Presumably that is because she appears only in a recorded
  video, not live, however the similar appearance of Captain America
  in *Homecoming* is listed. 

+ They
  [ret-conned](https://en.wikipedia.org/wiki/Retroactive_continuity)
  *Iron Man 2*, saying that the kid in the Iron-Man mask is a younger
  Peter Parker, and again this does not appear in IMDb.

+ Phil Coulson is implicitly in *The Incredible Hulk* through the
  Marvel one-shot movie *The Consultant*, whish is essentially an
  extension of the
  [end credits](https://marvelcinematicuniverse.fandom.com/wiki/List_of_Post-credits_Scenes)
  of *The Incredible Hulk*.
  
+ There is, in my list, an alias connecting JARVIS (Stark's AI) to
  Vision because JARVIS becomes Vision. But in the final timeline, I
  chose to place Vision's origin in *Avengers: Age of Ultron*, where
  it fits in the story.

The current code fixes these pieces semi-manually, and unfortunately,
when we are dealing with real data, often there are exceptions that
need a semi-manual fix like this.

After all this, we have a list of movies that each character
participates in, and from these, we use the sequence listed
[here](/posts/post_mcu1/) to put the movies in sequence for each
character, and then we have a path for each.  The first few are listed
below, and the file is [here](/csv/cast_path.csv).

{{% csv_table src="static/csv/cast_path.csv"  maxLines="7" colStyle="text-align:left;" %}} 
 
The "codes" column is a mapping of the movies to the codes I gave in
the sequence listing of the movies. It's a key to allow sorting of the
movies in sequential order, but the strings formed by listing the
codes of the movies in the path will be useful to us when we start to
learn more about these paths in future posts.

Note that the file has paths for many of the characters in the film,
but I only included a selection of the most important heroes{{<
footnote_marker 7 >}} in the timeline.

There is one hiccup still. The appearance of Captain America and The
Winter Soldier in Ant-Man is in an end-credit scene. That is OK, and
happens often in other movies. One of the cutenesses of the MCU
is their clever use of these to lure fans forward. But that end-credit
scene is (uniquely) actually a cut from the next Captain America film
*Civil War*.  Hence it is the only place in the timeline where we get
a non-simple path, i.e., a path with a loop. Once we add that loop, the
timeline is finished (except for endless fiddling to get it to look
OK).

I know I've glossed over details here, in order to make this post a
reasonable length, but I will go through more technical detail in a
subsequent post. Stay tuned.

# Summary 

I want to keep these post to a reasonable length, and this one was
already over my target, so this is really just a description of the
timeline. I have some ideas of what to do with it though, and you will
see them in future posts.

In the mean time, enjoy the timeline. If it get's popular, I aim to post a
link to the raw SVG file, so people can mash with it. So do the usual
social media stuff, if you care.
 
---
 
# Links {#links}

Other narrative charts 
 
+ [Game of Thrones](https://www.reddit.com/r/gameofthrones/comments/1g1yvk/s03e10_narrative_chart_seasons_13_completed/)

+ [Game of Thrones (again)](https://medium.com/@jeffrey.lancaster/the-ultimate-game-of-thrones-dataset-a100c0cf35fb)
 
+ [Lucky Luke, Dr. McNinja and Tintin](http://csclub.uwaterloo.ca/~n2iskand/?page_id=13)
  
+ [Star Wars](https://bl.ocks.org/drzax/81fff35393fb65255621fd0ab8d11bd7)
  
+ [Political Scandal](https://source.opennews.org/articles/automating-xkcd-style-narrative-charts/)

+ [The Thing](http://www.parseerror.com/vis/movie-narrative/the-thing/)

Generating charts

+ [d3-layout-narrative](https://github.com/abcnews/d3-layout-narrative)

+ [Generating Narrative Charts](https://webfocusinfocenter.informationbuilders.com/wfappent/TLs/TL_rel/source/charting_narrative.htm)

+ [Comic Book Narrative Chart](http://csclub.uwaterloo.ca/~n2iskand/?page_id=13)

Other similar concepts <!-- https://blog.ouseful.info/2014/04/07/narrative-charts-tell-the-tale/ -->
 
+ Sankey diagrams

+ Activity timelines

+ Event charts

+ Transaction charts 
 
 
---
 
Footnotes:

  1. {{<raw>}} <div id="fn1" class="footnote">
  
    The timeline is based only on the movies (with small diversion for
    *Agents of Shield*, and taking into account the one shots). If the
    various graphic novels were taken into account there would be
    additions (for instance, *Fury's Big Week* links Nick Fury and
    Black Widow into *The Incredible Hulk*).
	
	<a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> 
	{{</raw>}}

  2. {{<raw>}} <div id="fn2" class="footnote">
  
    The locations are intended to help place the movies in
    time. However, many of the movies cover multiple times: *Doctor
    Strange* takes place over approximately a 1 year period, and
    *Captain America: The First Avenger* is set predominantly in the
    1940s. Additionally many of the movies have flashbacks, and some
    have flash forwards. The positions in the picture are chosen to
    help show the sequence so, for instance, we base the timing of
    Captain America on the modern part of the film (which although it
    is a short part of the movie is the important part from the point
    of view of the sequence).
	
	  <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> 
	  {{</raw>}}

  3. {{<raw>}} <div id="fn3" class="footnote">
  
    We could argue about what it means to "be in" one of the
    movies. Some appearances are only in end credits (Nick Fury in
    *Iron Man*, or the Winter Soldier in *Black Panther*), or via a
    taped video (Captain America in *Spider-Man*, or Black Widow in
    *Ragnarok*), and in some cases these are not even credited. Our
    approach is to include an appearance if the character speaks, but
    not if it is an indirect reference (e.g., we exclude the reference
    to Spider-Man in *Ant-Man*).
	
    Other unusual instances: Bruce Banner is  narrated to in *Iron
    Man 3*, and Peter Parker is ret-conned to be the kid in the Iron Man
    mask in *Iron Man 2*. We also include the one-shot movie "The
    Consultant" as an extended end-credit of The Incredible Hulk (it
    overlaps with the actual end-credit), and it places Coulson in
    that movie's timeline.
	
	  <a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
	  {{</raw>}}

  4. {{<raw>}} <div id="fn4" class="footnote">
  
     Villains are not shown (except for those who change sides), but
     most major villains appear in only one movie and so would not
     appear in any case (Thanos is an obvious exception). This a
     departure from the graphic novel genre where villains often
     reappear. 
	
	  <a href="#ref4" title="Jump back to footnote 4 in the text.">↩</a></div> 
	  {{</raw>}}

  5. {{<raw>}} <div id="fn5" class="footnote">
  
    Most of the appearances create a well-ordered set of movies, i.e.,
    we don't see something in one movie that overlaps a later
    movie. It's a little dicy during *Fury's Big Week* (*Iron Man 2*,
    *The Incredible Hulk* and *Thor* all happen almost in parallel),
    but the only place where we can't maintain a sequence at all is
    the pre-view of the *Winter Soldier* (and Cap and Falcon) in the
    end credits of *Ant-Man*. So in this one instance there is a loop
    in the paths. All others are "simple" paths.
	 
	  <a href="#ref5" title="Jump back to footnote 5 in the text.">↩</a></div> 
	  {{</raw>}}

  6. {{<raw>}} <div id="fn6" class="footnote"> 
  
  A superhero's hero-alter-ego might not exist in their early
  apperances (e.g., Bucky Barnes in *Captain America*). Normally, we
  ignore this and consider them to be largely the same person, plus or
  minus superhero powers. However, there is an exception: Stark's AI
  JARVIS who evolves into Vision. At least naively, JARVIS seems
  qualitatively different from Vision, so his origin is placed in *Age
  of Ultron*.
 	
	  <a href="#ref6" title="Jump back to footnote 6 in the text.">↩</a></div> 
	  {{</raw>}}

  7. {{<raw>}} <div id="fn7" class="footnote">

  Why these characters in particular. The goal was to track the
  superheroes (excluding villains for the most part). And by its
  nature it only sees characters that are in at least 2 movies.  But
  there are borderline cases. Why not your favourite love interest --
  Pepper Potts? Honestly I don't have a good reason except that it was
  starting to get just too complicated. I'll keep trying to integrate
  as many as I can.
	
	  <a href="#ref7" title="Jump back to footnote 7 in the text.">↩</a></div> 
	  {{</raw>}}
  

<!-- {{< footnote 7 >}} -->
<!--   Why these characters in particular. The goal was to track the -->
<!--   superheroes (excluding villains for the most part). And by its nature -->
<!--   it only sees characters that are in at least 2 movies.  But there are -->
<!--   borderline cases. Why not your favourite love interest -- Pepper -->
<!--   Potts -- or Maria Hill. Honestly I don't have a good reason except -->
<!--   that it was starting to get just too complicated. I'll keep trying to -->
<!--   integrate as many as I can. -->
<!-- {{< /footnote >}} -->
  
