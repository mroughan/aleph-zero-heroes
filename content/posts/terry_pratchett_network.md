--- 
title: "The Colour of Magic by Numbers"
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-11-03
lastmod: 2020-11-03
description: "Creating a narrative network that includes locations for the Colour of Magic."
categories: ["books"]
tags: ["Terry Pratchett", "Named Entity Recognition"]
cover: "img/entity_recognition_test3_small.png" 
featuredImage: "img/color_of_magic_network.png"
featuredImageDescription: ", The Colour of Magic Character Network"
dropCap: false
draft: false
toc: true
spoilers: false 
---

{{% blockquote author="Terry Pratchett, Foreword to 2nd edition of The Colour of Magic, October 1989." %}} 
There are no maps. You can’t map a sense of humor. Anyway, what is a
fantasy map but a space beyond which There Be Dragons? On the
Discworld we know that There Be Dragons Everywhere. They might not all
have scales and forked tongues, but they Be Here all right, grinning
and jostling and trying to sell you souvenirs.
{{% /blockquote %}}

# Intro

I just got back from a walk up Black Hill (not a euphemism), which is
somewhat testing. The summit is only about 300 meters above where I
live, but large parts of the track are like climbing a staircase built
for and by a drunken troll with one leg significantly longer than the
other and a tendency to eat his work.  It made me think about names
though, and more than just the names of characters in stories, it made
me think about names of locations.

<div class="ui medium right floated image">
<img
   src="https://vignette.wikia.nocookie.net/marvel_dc/images/6/61/Gotham_City_0003.jpg/revision/latest?cb=20081011195739" 
   alt="Gotham Map">
</div> 

There is a good argument that a location is often more than just the
context of a work.  Eliot's London in *The Wasteland* has been said to
be "almost another character"[^1]. Tim Burton's Gotham no less plays
the role, albeit silent, of a character. In fact, it has been argued
that it is the most important character after Batman himself[^2].

Fantasy writers perforce build worlds in which their stories are
told. They range from a simple re-envisioning of real-world settings,
to fully fledged worlds as exemplified by Tolkein. His Shire and
Mordor (amongst other locations) convey deep feelings. And the
transformation of the shire at the end of the story holds a particular
horror; much like seeing a beloved character maimed.

Since *The Lord of the Rings* there have been many fantasy epics, but
few have been set in a world with such depth. Maybe Donaldson's *Lord
Foul's Bane* series, or perhaps the Erikson and Esslemont *Malazan*
epic. But no-one does it better than Sir Terry Pratchett (STP).

STP's writing is often funny, and so he is sometimes treated less
seriously, but I've noted [before](/posts/pratchett_discworld/) how
prolific and important STP's writing is. We can see that by comparing
it to some other fantasy sources, as the following Reddit post does.

[![https://i.redd.it/1cuw65qb6g111.jpg](https://i.redd.it/1cuw65qb6g111.jpg)](https://i.redd.it/1cuw65qb6g111.jpg)

STP's Discworld (setting aside his other writing) has 41 novels and is
nearly 4 million words; more than double the *Game of Thrones* and
nearly four times *Harry Potter*'s just over 1 million
words. Discworld adaptations also include half a dozen each (more or
less) of
 
 + graphic novels;
 + TV adaptations;
 + stage adaptations;
 + radio adaptations;
 + board games; and
 + video games;

plus

 + 6 "Mapps", an Atlas and a City-Guide;
 + 4 *Science of the Discworld* books;  and
 + an assortment of Companions, Almanacs, Portfolios, Diaries, Quiz books, Cookbooks and so on.

STP wrote a lot more, but the Discworld series presents a consistent
narrative over a large chunk of a made-up world. Within that there are
certain locations -- most obviously Ankh-Morpork -- that loom
large. So the Discworld is an ideal place to start to see how location
influences a story.

Stories are built from characters and their relationships and we can
look at these as networks. There a bunch of nice examples of network
visualisations for novels:

+ [The Network of Thrones](https://networkofthrones.wordpress.com/); and
+ the [Dune Character Network](https://www.ryanliwag.com/dune-social-network-visualization/);

for TV and Film:

+ [Star Gate and Star Trek](https://pdfs.semanticscholar.org/4197/00e8fddd34a5ead41497c696b67274e1a7a9.pdf);
+ [Star Wars](http://evelinag.com/blog/2015/12-15-star-wars-social-network/); and
+ [Buffy the Vampire Slayer](https://external-preview.redd.it/zA69EJRw_c8MVDMmg_cWiP2joM49-Cty0XAqArqFWko.png?auto=webp&s=400ba5106678f70594a6710ad660e5ce3bb84e1d);

and for the stage: 

+ [Hamlet](https://newleftreview.org/system/dragonfly/production/2019/05/13/4k9ql9wxyf_3020501large.gif). 

And this has also been done for several mythological or classical
texts as well, e.g., the
[Icelandic Sagas](https://medium.com/the-physics-arxiv-blog/medieval-icelandic-sagas-are-social-networks-like-facebook-and-twitter-837b176ade01). It
is common to compare these artificial networks to real social
networks.  However, if locations are so important to a story, why
aren't they included in these networks? My *The Colour of Magic*
(STP's first Discworld novel)
[network](/img/color_of_magic_network.png) at the top of
the page includes locations. The following describes how I created it.


# What's in a name?

Named Entity Recognition (NER) is a now-standard technique in Natural
Language Processing (NLP).  NER seeks not just to find names of
people, but also of organisations, locations and other types of named
entities.  I've seen a **named entity** defined as *a 'real-world
object' that's assigned a name* but this presumes the concept of
'name' is more obvious than named entity. A more useful description is
that a named entity is a (usually singular) thing or person delineated
by a proper name, where a proper name expands the idea of a proper
noun to include multi-word names, e.g., Peter the Great. It's still
not a perfect definition, and so most people resort to examples.  In
the *The Colour of Magic* we have examples like:

+ Rincewind
+ Stren Withel
+ Bravd the Hublander
+ Ankh-Morpork City Watch
+ Wizards’ Quarter
+ Hogswatch Night
+ Archmandrite of B’Ituni

You can see that named entities include entities other than just
people and NER also seeks to classify the names correctly. Common
classifications are into People, Organisations and Locations, plus a
few other categories, but I'm going to make my classification a little
more fine-grained. My primary categories are fairly standard:

+ Persons (including supernatural beings, e.g., Death, and named animals)
+ Locations (including named buildings)
+ Organisations
+ Artefacts (named, created things such as books and songs)
+ Dates (times of day, holidays, named years ...); and 
+ Miscellany (position names, plant names, races ...).

but I'll subdivide them into smaller groupings, e.g., Rincewind is a
Person/Human/Wizard. 

The categories aren't completely disjoint so some value judgements had
to be made. For instance, nationalities (demonyms [^3][^4]) seemed
most associated with 'place' so they went in the Location
category. 

NER is a standard part of NLP toolkits (both the
[NLTK](https://www.nltk.org/) and [Spacey](https://spacy.io/) have it,
as do others) but modern techniques use machine learning and rely on
large [corpora](https://en.wikipedia.org/wiki/Text_corpus) of tagged
text. Unfortunately, those corpora don't have much to do with the type
of text we are looking at. Often they have been based on news texts,
or in some cases scientific literature. However, names in literature
sources are rather different. For instance, novels typically involve a
larger amount of dialogue than, for instance, a scientific text.

Names in fantasy literature are doubly difficult because often they
are made up from whole cloth. STP often uses English common names, but
equally often just makes up a word, sometimes from scratch or
sometimes as a portmanteau like "Rincewind".

STP also uses some pretty strange punctuations, e.g., exclamation
marks as part of a name such as K!sdra or apostrophes as in Re’durat. 

One of the features used to classify names (in English) is
capitalisation, but STP (and others) frequently use capitalisation
for reasons other than names:

+ to emphasise the way a character speaks (see Gladys in Making Money); 
+ where a character who is not very literate is writing; <!-- , e.g., "Like unto thee Staje of a Theater ys the World" -->
+ to emphasise the importance of an **Idea**;  and
+ just for effect, e.g., to create an echo as in "LO, Lo, lo."

And without wanting to criticise STP, he isn't consistent over the
decades. For instance "Hogswatchnight" or "Hogswatch-night" or "Hogswatch Night."

So, finding names isn't as easy as we might hope, beyond just those
problems of everyday English. And English is hard enough. Take the
example of words morphing from proper noun to adjective: in
mathematics we speak of Markov chains (named after Andrey Markov),
where here the name is being used adjectivally, that is, Markov is
being used as a *Proper Adjective*. STP uses adjectival forms
extensively and in extended ways, e.g., the word "Bentless" for a room
lacking a Mr Bent. Neither English nor STP are consistent though;
often proper adjectives slip into common usage, e.g., herculean not
Herculean. Is that a reference to Hercules or not? And that is just
one of the many difficulties presented by English even before we add
the idiosyncrasies of fantasy authors. 

And there is another problem. 

# Names, names, and more names

One of the primary difficulties here is a character may be
referred to by many "names." There are all sorts of reasons:

+ Abbreviations are common. For instance, characters are often
  referred to by just their family or given name. These may be further
  abbreviated, and not all such are just shortenings of words, e.g.,
  Bill for William.

+ Nicknames: often a character will have a nickname, e.g., CMOT
  (Dibbler) or I-Don't-Know Jack.

+ Appellations are often added to a name: e.g., Mr or Mister,
  Archchancellor or Commander. A character's appellations may change
  over time: Captain Vimes becomes Commander Vimes. Other types of
  appellation can refer to an employment -- Vimes of the Watch -- or a
  location. e.g., Duke Mortimer of Sto Helit. 

+ Aliases, noms-de-plume, or sobriquets occur often enough to be
  difficult. The most prolific example is Moist von Lipwig who has a
  long list of aliases such as Mr Trespass Hatchcock and Albert
  Spangler. Other characters have, for instance, stage names such as
  Delores De Syn aka Theda Withel in *Moving Pictures*.
  
+ Accidental mispellingss happen occasionally, e.g., Ly Tin Weedle in
  TLF and Ly Tin Wheedle in most other books. 
  
+ Deliberate mispellingss are more common. Often they are used to
  indicate an accent or other quirk of speech, e.g., Mishter
  Shpangler; or some degree of illiteracy, e.g., in *Equal Rites*: "To
  ther Hed Wizzard, Unsene Universety,...,Esmerelder Weatherwaxe (Mss)
  Wytch."; or to convey the idea of a pre-modern context where spelling
  was not at all uniform[^5], e.g., Vimes notebook: "Itym: Ae smalle
  vegettable shope."

The net effect is that key characters often have many different terms
used for reference. The worst case I've seen so far is Moist von
Lipwig, who has over 20 aliases.

I don't just want to identify sets of words that correspond to a named
entity, I want to know *which* entity, and in the end, there were so many
special cases that I reverted to creating a manual list of aliases.

The list has a second advantage, which is that it can correct some of
the defects in earlier processing where tokenisation or other steps
have incorrectly broken up a sentence.

The main global list identifies all entities in the texts read so
far. Many occur in more than one book, so forming this list wasn't as
onerous as you might expect -- names inserted from one text are often
useful in others.

But that raises one other issue I want to mention, which is that
although STP is very inventive with names, he occasionally reuses a
name, most often just a given name such as Angus, but since characters
may be referred to using just their given name we can't have a purely
global list of names. So each book has its own shorter local list.

Luckily there isn't a huge amount of disambiguation needed, e.g.,
names that are used for more than one character within a book. That
problem only really occurred with titles, e.g., Sergeant, which might
be referring to different sergeants in different parts of a text. In
general, we don't try to disambiguate these so some references are
missing from our list as well.

There is one problematic name --
[Igor](https://wiki.lspace.org/mediawiki/Igor) -- which refers to a
group of likeminded entities who work for mad scientists, vampires or
the Watch. They are nominally separate entities but there is an
uncomfortable level of sharing of body parts, and what is more
problematic here, they share the same name. I still haven't quite
decided what to do with Igor.

# NER in the Discworld

Given the listed issues for NER on fantasy texts, there are pretty big
limits on what we might hope to obtain from automated extraction
without a large training corpus. 

So what have other people done? The "gold" standard is to have a human
tag the text manually. I quoted gold here because people aren't
perfect, particularly on a task like this that can involve some
ambiguity. It's also a very time consuming approach.

I did something a little different. I am using this project to improve
my [Julia](https://julialang.org/) coding, so I wrote a NER routine in
that lovely little language. It uses an old-school approach. Early
on (in the 90s) NER used the rules of English gammar to extract names,
particularly capitalisation of words. It isn't as simple as you might
think -- English rarely is -- and so I don't expect to get amazing
results. However, it can throw up a list of candidates very quickly. I
then manually classify the majority of elements on this list. The
result is that I can tag names from a book in a few hours with a high
level of inclusion.

The approach has the advantage that the manual intervention step
allows me to simultaneously 

1. classify names, and 
2. build a list of aliases. 

There are some excellent resources for checking classifications of the
many instances that are non-obvious even to a human reader: for
instance the
[Discworld Wiki](https://wiki.lspace.org/mediawiki/Main_Page) and
[L-Space](https://www.lspace.org/).

A segment of the resulting data for *The Colour of Magic* is shown in
the table below (click on it to go to the full table or go to the
[GitHub page](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Pratchett/NER)
to get all the information, particularly a list of the sentences in
which a name appears).

<div style="display: inline-block;">
{{% csv_table 
    src="/static/csv/Book01.csv"
	maxLines="12"
    link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/NER/Book01.csv"
    colStyle="text-align:right;" %}}  
</div>

The approach isn't perfect. A character can talk without their name
being mentioned (the Emporium shop keeper in *The Light Fantastic* is
a case in point), and a character may be referred to using a common
noun, e.g., as "Sergeant Colon" in one line, and then as "the
watchman" in another. There are many other special cases that break
some rule or other, but the vast majority of mentions are found.

# Networks

In the
[The Network of Thrones](https://networkofthrones.wordpress.com/) two
characters are linked each time their names (or nicknames) appear
within 15 words of one another. That pulls together several cases:

+ two characters interacting; or 
+ a character talking about another; or
+ combinations of the above for three or more characters.

If we count the number of such co-occurrences, we can form a measure
of the strength of the relationship between two characters. 

In [The Network of Thrones](https://networkofthrones.wordpress.com/)
several thresholds were tried, and 15 was the winner, but also
connections with only 1 or 2 joint references were removed from the
network.  I chose to look at the distance in terms of sentences: a
long or a short sentence including two characters is still linking
them, so I created connections if two names were in the same sentence
regardless of its length.

There are large numbers of named entities in the books (several
hundreds) so to ensure the diagram is understandable, we only show
those with 8 or more mentions (guess why I chose 8). Isolated nodes
are also dropped. 

The layout created above is automated using ```graphplot``` from the
```GraphRecipes.jl``` package in conjunction with
```SimpleWeightedGraphs.jl.```

# Results

You've already seen my first
[network](/img/color_of_magic_network.png), the network for
*The Colour of Magic*, STP's first discworld book. You'll note I
haven't labelled all of the nodes. The nodes were labelled manually so
as to make sure that the diagram wasn't cluttered up with names of
relatively inconsequential characters. I do have a completely
[labelled version](/img/entity_recognition_test3_labelled_01.svg) but
it isn't as pretty. The table below shows a little of the network in
CSV form -- click on it to go to the full network.

<div style="display: inline-block;">
{{% csv_table 
    src="/static/csv/network_Book01.csv"
	maxLines="12"
    link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/NER/network_Book01.csv"
    colStyle="text-align:right;" %}}  
</div>

Why should you care? Well, if I were just a network scientist I would
calculate network metrics, e.g., centrality, for this network, and
that would tell you something, but actually I think the results are
pretty obvious. Rincewind and Twoflower are the main characters and
closely linked. No-one will be surprised.

What we can see in the picture is that there are some key locations
that link together some characters and provide some structure. Chief
amongst these is Ankh-Morpork, STP's iconic city, which builds on
London, Paris, New York and every other great city of our
sphereworld. But we can also see something of the structure of the
story -- it is really four novellas -- and the three named locations:
Ankh-Morpork, the Wyrmberg and Krull can be seen linking together
their parts of the story.

So I think we can see something in this picture, but mostly it's an
excuse to do a new
[T-shirt](https://mathsy.threadless.com/designs/the-colour-of-magic-by-numbers). 

I think the really interesting results lie in comparing networks
between books. One of STP's most interesting characteristics as a
writer is the diversity of approaches he uses in writing. You hear
sometimes that he was repetitive, but I really don't believe that
(except maybe near the end). Pratchett had so many ideas flowing
through his works that a simplistic labelling of his text as generic
fantasy/humour misses the mark by miles.

I hope to display something of this diversity and structure of the
stories in this type of analysis. 

# Conclusion

Quick summary: places in stories are important. Most "character"
networks ignore them. A true narrative network should not. 


# Links

Part of this work was described in a talk at the
[The Pratchett Project Conference](https://drive.google.com/file/d/1EqMZajghiCbWNRc3GiEFLIkOLtsTUmyr/view)
in September 2020. My slides are [here](https://roughan.info/talks/pratchett_project_2020.pdf). The Pratchett Project has
[Twitter](https://twitter.com/PratchettProj) and
[Facebook](https://www.facebook.com/PratchettProject/) pages if you
want to find out more.  

Useful resources:

+ [Discworld Wiki](https://wiki.lspace.org/mediawiki/Main_Page) and
+ [L-Space](https://www.lspace.org/). 
+ [Fandom](https://discworld.fandom.com/wiki/Main_Page)

My Data (so far) 

+ [@GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Pratchett/NER)


# Acknowledgements

Just a quiet thanks for the people who have been helping me edit these
blogs, notably my wife. 

---
 
**Footnotes**

[^1]: "Maps of The Wasteland", Eleanor Cook in Bloom's Guide to the Wasteland, Infobase Publishing, 2007.

[^2]: https://www.vice.com/en_asia/article/a3w8w8/well-sorry-joker-gotham-city-is-the-most-important-character-in-batman

[^3]: A Nationality is more formally called a *demonym*[^6] including not
      just nationalities but any name of a people or tribe in relation
      to a place. Demonyms are often constructed from the place name
      by adding suffixes, e.g., "-ish", or "-ian", but not always,
      e.g., Greek. The construction (in English) of demonyms follows
      [rules](http://www.linglish.net/2008/10/22/so-many-nationality-suffixes/)
      at least as much as English follows rules, but STP made up his
      own countries with their own demonyms. He favoured the suffixes
      "-ian" as in *Ankh-Morporkian* and "-ean" as in *Uberwaldean*
      but uses some others such as Hublandish (and Hublander) and
      Pseudopolitan. There are many other possibilities though, and I
      expect to see many of them in STP's later writing.
 
[^4]: Another technical term -- anthroponymy -- refers to the study of
      proper names of human beings (and I expect we can loosen this to
      include Dwarfs, Trolls, etc.) for the Discworld. More generally,
      *onomastics* is the study of proper names (a proper noun is a
      one-word proper name, but names often involved several
      words). And while we are here, *toponymy*[^7] is the study of the
      proper names of places. The full scope of the term includes
      cosmographical features and in STP's case, we include
      transdimensional locations. Note that place names can also have
      aliases, nicknames and abbreviations just as for the names of
      people.

[^5]: Shakespeare, one of the most decorated constructors the English
      language, himself spelled his name 6 different ways. Even in
      modern times spelling isn't as fixed as we imagine: in the 1976
      Australian census, people claiming themselves as Presbyterian
      used 383 different spellings of the word!

[^6]: A demonym is not the name of a demon.
 
[^7]: A useful reference for nomenclature used in toponymy is the
      [*ICSM Glossary of Generic Terms in Australasia*, 1996.](https://www.icsm.gov.au/sites/default/files/2017-09/glossary_pnames.pdf)

<!-- --todo -->

   
<!--    t shirt (and cyanotype of map) -->
  
<!--    tweet pratchet project ++  -->
   
   
