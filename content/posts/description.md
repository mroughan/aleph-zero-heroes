---
title: "About"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-02-10
description: "In this blog I plan to explore using data science on large-scale hybrid narratives, in particular narratives about superheroes."
categories: ["About"]  
tags: ["about"]
cover: "/img/about.svg.png" 
featuredImage: "/img/about.svg.png"
featuredImageDescription: ": Aleph is Unicode: 2135" 
draft: false
---

# Aleph-Zero-Heroes

The title of the blog comes from a, perhaps obscure, piece of
mathematics. Mathematically speaking <a href="https://en.wikipedia.org/wiki/Aleph_number" target="_blank">aleph zero</a>
-- which we
write {{< raw >}}\(\displaystyle \aleph_0\){{< /raw >}} -- is the
cardinality of the set of natural numbers, which is a pretty mathsy
way of saying "infinity". So the name, aleph-zero-heroes, loosely
translates as **infinite heroes**. 

I don't just care about superheroes -- more broadly they are a
archetype that comes up frequently in the context of hybrid
narratives, and that is what I want to tap into.

To explain what, why and so on of all this, see below.

+ [Why](#why)
+ [What](#what)
+ [How](#how) 
+ [When](#when)
+ [Where](#where)
+ [Who](#where)

---

## Why? {#why}

The capacity that sets humans apart from the animal kingdom is not our
ability to use tools (there are animals, even birds that also use
tools); or our ability to communicate (many animals speak to each
other); or our ability to form complex social bonds (some animals bond
for life). Human's are unique in our
ability and *desire* to tell stories.
 
Myths, legends, narratives, and fictions allow us to build larger
social constructs than 
<a href="https://en.wikipedia.org/wiki/Dunbar%27s_number" target="_blank">Dunbar's number</a>
(around 150). Stories are part of how we plan ahead. Stories allow us
to change and adapt as a species more quickly than our the genetic
heritage of most species. Stories have made us the dominant species on
the planet is the blink of an eye (on evolutionary time scales).
 
So if stories are what make us who we are, then they are worth
studying. I'm a mathematician by training, but a data scientist in
practice, so that's the approach to the analysis of stories that I am
inevitably going to adopt, and there is an increasing amount of effort
going into "narrative analysis" both of fiction and non-fiction (e.g.,
<a
href="https://www.nytimes.com/2011/06/26/books/review/the-mechanic-muse-what-is-distant-reading.html"
target="_blank">distant reading</a> of historical source
materials). Mathematics, statistics and computer science -- the basis
of data science -- are crucial to that analysis.

I could look at any sort of stories, why focus on superheroes? Because
I'm interested in a particular phenomena --- large-scale hybrids.
I'll describe them in more detail below, but we could have chosen to
do Harry Potter, so why superheroes in particular? I guess that
reflects my personal biases, but also superheroes are a big part of
modern popular culture and have been for longer than Harry Potter. The
idea behind superheroes isn't really a new thing at all, so I see them
as a richer, and more evolved phenomena.

Formally, we might trace the idea back to Nietzsche, but the modern
comic superhero really dates from Jerry Siegel and Joe Shuster in the
30s, right around the time of the invention of the comic book
<a href="https://en.wikipedia.org/wiki/Action_Comics_1" target="_blank">(Superman, Action Comics #1)</a>. The
two things were synergistic.

However, the superhero is just a modernisation of the hero of any
number of myths and legends. Classical mythology is replete with
heroes with special powers. They may not have been "mutants", but they
usually got their powers through good genes --- a typical hero was
often a descendent of a God (or two).

Many comics books take inspiration directly from mythology (Wonder
Woman, Thor, Thanos, ...).  Others create an all-new story (a
radioactive spider bite couldn't be a thing until we had radiation);
even when they arise independently they often evolve towards common
story elements.

+ The hero, goes through a journey, usually hits some nadir, and then
  is reborn. And he takes what he learns in the journey towards his
  eventual victory -- sounds like Iron Man 1 to me?
  
+ Villains of classical mythology are too often victims of their own
  hubris. That sounds like many a mad scientist to me.
  
+ A hero seeks revenge for a murdered father. Is that Batman or
  Orestes?  Of course, Bruce Wayne didn't need to extend his revenge
  to his mother as well. So he was lucky. Really.
  
Other parallels include: 

+ Superman has his Achilles heel. 

+ Achilles warriors were called Myrmidons = Ant-men.

+ Gilgamesh, a demi-god and initially an arrogant king or prince of
  his city state (Thor?) meets a wild-man Enkidu (The Hulk), and
  after fighting each other to a stand still they bond and have
  adventures together. 
  
+ Deadpool -- a cosmic fool if ever there was.

+ Arthur and his round table = the Justice League?

+ And Superman was found in a reed basket on a river bank, or was that
  Moses? 

More important than the parallels of particular characters or stories
is the fact that comics-book heroes serve many of the same functions
as the characters from legend. They provide a shared cultural
experience, important parts of which are aimed at forming common
cultural concepts such as morality by providing super-real role models
and assigning them dilemmas that we can all understand.

And some of the stories are deadly serious. Watchman is Alan Moore's
magnum opus, and a modern *1984*. It's a brilliant story about human
frailty, and the evils of good intentions, and the horror of war, all
wrapped around a satire on caped crusaders.

<!-- A lot of mythology was explanitory -- "where did that earthquake come -->
<!-- from?" and the like. But many more were about the human experience. We -->
<!-- can see that in our language, so much of which evolved from classical -->
<!-- mythological origins. These days they same thing is happening. Popular -->
<!-- culture coins new terms every day, but who doesn't know "Hulk Smash" -->
<!-- ... -->

I don't know if he ever read comics, but I think 
<a href="https://en.wikipedia.org/wiki/Joseph_Campbell" target="_blank">Joseph Campbell</a> would have been at home there. He
understood the parallels between the hero myths of different
cultures. He would have understood the modern parallels as well.

Given their connection to cultural norms comics also form a barometer
for our culture. That might be worrying: comics are well-known to have
strong gender and racial biases (though the situation is improving I
think).

Or the barometer might be encouraging: a common theme in many comics is a
(perhaps guarded) optimism about the future.

And in between there are some interesting cultural quirks: there was a
lot more sex in classical mythology than in the mainstream comics and
their associated movies. Modern heroes are often chaste, or at least
sex happens behind closed doors.  That is perhaps another reflection
of the mix of new puritanism that is a strong undercurrent of the
modern West.

So don't write superheroes off as "escapist". And even if
that's what you want to call 'em, then listen to Neil Gaiman:

> ...escapist fiction is just that: fiction that opens a door, shows the sunlight outside, gives you a place to go where you are in control, are with people you want to be with (and books are real places, make no mistake about that); and more importantly, during your escape, books can also give you knowledge about the world and your predicament, give you weapons, give you armour: real things you can take back into your prison. Skills and knowledge and tools you can use to escape for real.
>
> As JRR Tolkien reminded us, the only people who inveigh against escape are jailers.” 
> ― Neil Gaiman, The View from the Cheap Seats: Selected Nonfiction

However, I don't plan to restrict myself unduly. If I see something
interesting that I think is related, I'm going to look at that,
regardless of lack of superhero content. *Firefly* isn't a series
about superheroes, but if I can, I definitely want to look there. And
there are some non-fiction texts I want to get to eventually, but I
don't want to spoil the surprise.

Finally, I don't know enough of this stuff. I don't know enough about
writing. I don't know enough social science or digital humanities, and
although I was brought up with the Greeks and Romans in my house (and
the Norse next door) there are whole swathes of world mythology I know
only peripherally.  If nothing else, this blog is a chance for me to
learn more.

<!-- https://blogs.tip.duke.edu/insights/2017/05/15/superheroes-and-greek-myths/ -->

<!-- http://johnromaniello.com/modern-mythology-superheroes/ -->

<!-- https://www.theguardian.com/books/2016/may/27/comic-book-superheroes-the-gods-of-modern-mythology -->

<!-- http://www.bbc.com/culture/story/20150819-before-marvel-and-dc-superheroes-of-the-ancient-world -->

<!-- https://www.britannica.com/topic/Orestes-Greek-mythology -->

<!-- https://en.wikipedia.org/wiki/Gilgamesh -->


<!-- http://www.idildergisi.com/makale/pdf/1485861373.pdf -->

## What is that thing you said earlier? {#what}

A story is the sequence of events. A narrative is how you tell
it. Traditional narratives took the form of oral tellings, written
works, theatre, and so on.

A hybrid narrative involves multiple forms of story telling blended
together. We can get an idea by considering simple examples of
old-school hybrids

 + picture books and graphic novels, which combine art and text
 + choose your own adventure books, which combine games with prose

The relatively low-cost, "pulp" nature of comics allowed their authors
and artists to do new things, to experiment. Comics then folded back
into other forms of story telling, the superhero movie genre being the
most obvious. And the web has made it easy to create other hybrids,
increasing the pace of innovation.
 
Why *large-scale* hybrid narratives? It's only recently that it's been
possible to create these. Logistical, technical and economic
constraints have prevented really large-scale hybrids in the
past. Stories this large, that reach millions of people, must be an
interesting reflection on our world.  So in this blog, we are not just
interested in simple hybrid texts, for example a graphic novel. We are
interested in the massive hybrids created in response to popular
demand, and facilitated by technology.

For instance, graphic novels have inspired a new genre of movies --
superhero movies -- and these have become massively popular. But where
once these were single, throw-away movies, now they form their own
ecosystems of movies and other classes of media and don't forget
the vast amounts of fan fiction and commentary. The Marvel Cinematic
Universe (MCU) is a great example of this.

In these ecosystems, novels or graphic novels inspire movies, which in
turn spin off games, and TV series, and traditional novels, and new
graphic novels. The MCU might be the best example, but DC is following
close behind and we can think about the Star Wars or Harry Potter
franchises in the same way. And don't be surprised to see more
following suit. These franchises are worth a *lot* of money. The MCU
movies alone have generated nearly $20 billion. I'm not sure anyone
outside of Marvel knows what the whole franchise is worth. 

It would be careless to then write these off as simple action movies
without thinking a little more deeply about how they mirror our
society, and in turn affect it. 


---

## How {#how}

I work mostly on networks, so that's the type of analysis you will see
a bit of here, but networks touch on everything so there's going to be
bits and pieces from everywhere. 

If you want to see some examples of what people are doing with
networks, have a look at the following:
  
  
+ <a href="https://arxiv.org/abs/cond-mat/0202174" target="_blank">"Marvel Universe looks almost like a real social network"</a>
  in which the authors argue that the network created by linking
  characters who share a comic has many of the characteristics of
  real-life, human social networks. 

+ <a href="https://iopscience.iop.org/article/10.1088/1742-5468/2007/09/P09020/meta" target="_blank">"How to become a superhero"</a>
  is similar, but goes a little further. 

+ <a href="https://link.springer.com/article/10.1140/epjb/e2013-40583-3" target="_blank">"Network analysis of the Íslendinga sögur – the Sagas of Icelanders"</a>
  in which the authors examine the network of characters in the
  Icelandic sagas, again comparing them to real social networks. 

+ <a href="https://iopscience.iop.org/article/10.1209/0295-5075/99/28002" target="_blank">"Universal properties of mythological networks"</a>
  in which the authors compare the networks of characters in a set of
  mythology texts (*Beowulf*, the *Iliad* and the *Táin Bó
  Cuailnge*. Again they find parallels.  These authors have a nice
  <a href="https://yosej.github.io/Ossian_Full_Network/" target="_blank">visualisation</a>
 of one
  of the networks they are dealing with.

+ And *Game of Thrones* is featured in
  <a href="https://networkofthrones.wordpress.com/the-novels/a-game-of-thrones/" target="_blank">"Network of Thrones"</a>
  and <a href="https://shirinsplayground.netlify.com/2018/03/got_network/" target="_blank">"Another Game of Thrones network analysis"</a>
  is perhaps the best known example, because of the popularity of
  *Game of Thrones*, but also because 
  <a href="https://www.kaggle.com/mylesoneill/game-of-thrones" target="_blank">Kaggle released a dataset</a>.

The finding of universal properties in our narratives is a big part of
what motivates this blog, but network analyses are often focused on
empirical measurements of network features, and I am hoping to go a
little further. 

At the same time there is increasing interest in getting to these
corpora without messing around manually: e.g.,

+ <a href="https://aclanthology.info/papers/I13-1171/i13-1171" target="_blank">"Automatic Extraction of Social Networks from Literary Text: A Case Study on *Alice in Wonderland*"</a>

and our own recent effort

+ <a href="https://arxiv.org/abs/1811.01467" target="_blank">"The one comparing narrative social network extraction techniques"</a>

I'm learning <a href="https://julialang.org/" target="_blank">Julia</a> these days, so I thought there was an
opportunity to use this as a project to learn Julia, so expect lots of
this, though some Python or Perl may creep in at some point. If you
don't know anything about Julia then look it up. It's cool!

And I'm a mathematician by training, so there will be some emphasis on
math as we progress, but it's going to take a little while to build,
so we'll start with code and data.

---

## When {#when}

Every couple of weeks, though it may start fast and slow down as a
realise how much work is involved :) 


---

## Where {#where}

Your friendly neighbourhood web browser. And you can follow on {{% twitter %}}  or get a standard
<a href="/posts/index.xml">RSS</a> feed.
 
---

## Who {#who}

I'm a Prof at the University of Adelaide<sup><a href="#fn1"
id="ref1">1</a></sup> (in Adelaide, South Australia), and a Chief
Investigator in <a href="https://acems.org.au/home" target="_blank">
ACEMS (The Australian Research Council Centre of
Excellence for Mathematical and Statistical Frontiers).</a>

---

Footnotes:

  1. <div id="fn1" class="footnote">

     Don't tell them I have a web page -- they'll replace it with a marketing video.

      <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div>
