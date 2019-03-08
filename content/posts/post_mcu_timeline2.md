---
title: "MCU Timeline Part II"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-03-04
description: "The Marvel Cinematic Universe Timeline: Revisited"
categories: ["movies", "timelines"]
tags: ["Marvel", "MCU", "Timelines", "Networks"]
cover: "/img/marvel_graph.dot.svg"
featuredImage: "/img/marvel_graph.dot.svg"
featuredImageDescription: ", my MCU Timeline"
draft: true
---

### My Timeline of the MCU

So, timeline again. The title sounds like a joke, or maybe a recurring
nightmare?

Today, however, my goal is to do just a little bit of math, in the
form of *network science* on the timeline. The conclusion, or at least
the most controversial conclusion is that Guardians of the Galaxy (the
movie) is **not** a team-up movie. We'll get to why, but I need to go
through some pieces first.

If you want to find out how the timeline was generated, have a quick
look at [the previous post on the timeline](../post_mcu2/).

### What do we learn?

In my next blog I want to talk about what we learn about Marvel's
stable of characters from the timeline. This week I want to focus on
what we learn about the movies.

To do that I want to look at a network version of the movies. It's
just a simplification of the timeline to show which movies are
connected by paths. Here it is:

<div style="width:90%;text-align:center;margin-left:auto;margin-right:auto;display:block;" >
<a href="../../img/marvel_graph.dot.svg">
<img src="img/marvel_graph.dot.svg" alt="MCU sequence graph" >
 </a>
 </div>

BTW, although I'm doing most of this in Julia, I did this picture
using [GraphVis](https://www.graphviz.org/). It's one of many cool
toolkits for graph visualisation. I use it, because I'm an old codger,
and I started using it a long time ago (and its hard work to change).
But it is appealingly clean tool to use for to someone whose used to
using the Unix command line.

Once installed, I need only write my graph up in the
[DOT](https://graphviz.gitlab.io/_pages/doc/info/lang.html) syntax,
which is pretty simple. I have a snippet of my graph included below

```
digraph "marvel" {
   "Ant-Man and the Wasp" [color="blue"];
   "Thor" [color="red"];
  ...
   "Thor" -> "The Avengers" [penwidth=3];
   "Thor" -> "Captain America: The First Avenger" [penwidth=1];
   "Thor" -> "Thor: The Dark World" [penwidth=1];
  ...
}
```

and the [full file here](../../data/marvel_graph.dot). The first few
commands define the nodes of the network, and the last few define the
links. 

On the command line, in the directory that holds this file I type

``` >> dot -Tsvg -O marvel_graph.dot ```

There are various tools in GraphVis. The tool `dot` does layout of
directed networks (direction of links is indicated by the arrows, and
the width of links indicates the number of characters on that
path). The picture isn't as "nice" as the timeline because I haven't
manually tidied it up.

This is not the *standard* network that might typically be drawn of
the MCU. In a typical rendition, one would have undirected connection
between any movies that share characters. This would be a much denser
and more complicated network.  The sparsity of this network makes it a
little easier to understand.

There is also information to be gleaned from the network. The
in-degree of a node in the network is the number of arrows pointing
into it, and the out-degree the number pointing out. The following
table gives the in- and out-degrees for each movie. 

{{% csv_table src="static/csv/marvel_graph_degree.csv" %}}
    
The thing you might notice about the in-degrees is that most are
small: 1 or 2. Only a few are larger. We can see that more clearly if
we look at a histogram of the distribution of in-degrees.
  
Distributions 

The outcome is that we can perhaps think of  
 

Categories of movies:

+ origin
+ sequel
+ team-up
+ split-up


team-ups vs origin movies 



### Summary 

complexity stuff should go in next one

this should summarize team ups 

I'm not here to claim that Marvel intended this, or that they employ
rooms full of mathematicians to architect their movies, though I'd
love it if they did. One of the themes that data science is
identifying in a lot of human activity is that we often are recreating
ourselves. In creating something compelling we need to build something
that people can relate to, something human, something complex and
interesting.

Why bother with the analysis, if all we see is a mirror? There are
some practical reasons: companies like Netflix are very interested in
recommending movies to customers. One of (the many) tricks in the swag
bag is to find descriptors for movies that go beyond lose genres like
"action" or "comedy". There is definitely a group of people out there
who prefer a team-up movie to a generic superhero movie -- we only
have to look at the revenues for the Avengers movies vs the rest of
the MCU. Maybe they are just better movies, but maybe they don't just
bring together a group of superheroes, they also bring together an
audience. Data science can help us identify interesting features of
the structure between movies, not just those features of individual
movies, as is more traditional.

We haven't done much mathematics yet. Be patient, I am working up to it. 
