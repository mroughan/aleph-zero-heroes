---
title: "The Coolness of the MCU"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-02-17
description: "Why should you (as a mathematician, statistician or data
scientist) care about the Marvel Cinematic Universe?"
categories: ["movies"]
tags: ["Marvel", "MCU"]
# featuredImage: "img/spider_girl_landscape_incredible.jpg" 
cover: "https://i.annihil.us/u/prod/marvel/i/mg/a/10/528d369de3e4f/landscape_incredible.jpg" 
featuredImage: "https://i.annihil.us/u/prod/marvel/i/mg/a/10/528d369de3e4f/landscape_incredible.jpg" 
featuredImageDescription: ": Spider-Girl, provided by Marvel ©"
draft: false
---

# Intro
 
This is a blog about data science and superheroes.  I think there is
some serious data science hidden in the pages of comics, and that's
what we're here to discuss.

I also think math and stats are the under-represented underpinnings of
good data science.  [Drew Conway's](http://drewconway.com/)
data-science Venn diagram expresses that best I think.

<div style="width:40%;text-align:center;margin-left:auto;margin-right:auto;display:block;" >
<a href="http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram">
	<img src="https://static1.squarespace.com/static/5150aec6e4b0e340ec52710a/t/51525c33e4b0b3e0d10f77ab/1364352052403/Data_Science_VD.png"	alt="data-science Venn Diagram" >
 </a>
</div>
 
Hacking and domain knowledge without mathematics is Drew's *Danger Zone*.

I've read and watched superhero comics and movies for years, so I have
just a little domain expertise. I'm going to do some coding here --
mostly in [Julia](https://julialang.org/) -- you can decide if it
counts as hacking skills. 

The third crucial part is the math component, which leads to my
title: [aleph zero](https://en.wikipedia.org/wiki/Aleph_number) is
(mathematically speaking) the cardinality of the set of natural
numbers, which is a pretty mathsy way of saying "infinity". So the
name, aleph-zero-heroes, loosely translates as *infinite heroes*, a
named inspired by my first topic, the Marvel Cinematic Universe (MCU)
and its six infinity gems. And the symbol we use for infinite
cardinalities is the Hebrew letter aleph, so aleph-zero is written 
{{< raw >}}\(\displaystyle \aleph_0.\){{< /raw >}}

Why superheroes? I'll give some more background in the
["about page"](/posts/description/) of the blog, but broadly speaking, stories,
legends, myths, and fictions form a key part of the human experience,
and so understanding these better will never be wasted time. The
Marvel Universe is particularly interesting because of it vast scope. 

In honour of the six infinity gems, I plan to get started with some
pieces about Marvel's *Cinematic* Universe (a tiny fraction of all
that Marvel have published).  The authors of this cinematic franchise
have wrought something remarkable both in the superhero genre, and
movies in general. And whether its underlying structure was unconscious
or deliberate, it's also mathematically interesting. Or maybe it is so
successful *because* it is mathematically interesting.

# The Marvel Cinematic Universe (MCU)

First the basics: the core of the MCU is the the series of 20 movies
(as of Feb 2019), starting with Iron Man in 2008, and ending in The
Avengers: Infinity War. There are more movies planned for the
immediate future though. The full list is given below. If you're a fan
you probably don't need me to tell you the list, but I will
[discuss the code for extracting this info from OMDb in my next post](/posts/post_julia1/),
and provide the data there for those who want it. And you can look up details of their financial
success of the movies at
[Box Office History for Marvel Cinematic Universe Movies](https://www.the-numbers.com/movies/franchise/Marvel-Cinematic-Universe#tab=summary).


{{< raw >}}
<div align=center> 
<table> 
<thead><tr><th class="rowid">#</th><th style="text-align:left;">Title</th><th align="center">Release Year<sup><a href="#fn1" id="ref1">1</a></sup></th><th>Phase</th><th>Runtime (mins)</th><th>IMDb Rating</th><th>Metascore</th></tr></thead>
<tbody>
<tr><td class="rowid">1</td><td style="text-align:left;">Iron Man</td><td>2008</td><td>1</td><td>126</td><td>7.9</td><td>79</td></tr>
<tr><td class="rowid">2</td><td style="text-align:left;">Iron Man 2</td><td>2010</td><td>1</td><td>124</td><td>7.0</td><td>57</td></tr>
<tr><td class="rowid">3</td><td style="text-align:left;">The Incredible Hulk</td><td>2008</td><td>1</td><td>112</td><td>6.8</td><td>61</td></tr>
<tr><td class="rowid">4</td><td style="text-align:left;">Thor</td><td>2011</td><td>1</td><td>115</td><td>7.0</td><td>57</td></tr>
<tr><td class="rowid">5</td><td style="text-align:left;">Captain America: The First Avenger</td><td>2011</td><td>1</td><td>124</td><td>6.9</td><td>66</td></tr>
<tr><td class="rowid">6</td><td style="text-align:left;">The Avengers</td><td>2012</td><td>1</td><td>143</td><td>8.1</td><td>69</td></tr>
<tr><td class="rowid">7</td><td style="text-align:left;">Iron Man 3</td><td>2013</td><td>2</td><td>130</td><td>7.2</td><td>62</td></tr>
<tr><td class="rowid">8</td><td style="text-align:left;">Thor: The Dark World</td><td>2013</td><td>2</td><td>112</td><td>7.0</td><td>54</td></tr>
<tr><td class="rowid">9</td><td style="text-align:left;">Captain America: The Winter Soldier</td><td>2014</td><td>2</td><td>136</td><td>7.8</td><td>70</td></tr>
<tr><td class="rowid">10</td><td style="text-align:left;">Guardians of the Galaxy</td><td>2014</td><td>2</td><td>121</td><td>8.1</td><td>76</td></tr>
<tr><td class="rowid">11</td><td style="text-align:left;">Guardians of the Galaxy Vol. 2</td><td>2017</td><td>3</td><td>136</td><td>7.7</td><td>67</td></tr>
<tr><td class="rowid">12</td><td style="text-align:left;">Avengers: Age of Ultron</td><td>2015</td><td>2</td><td>141</td><td>7.4</td><td>66</td></tr>
<tr><td class="rowid">13</td><td style="text-align:left;">Ant-Man</td><td>2015</td><td>2</td><td>117</td><td>7.3</td><td>64</td></tr>
<tr><td class="rowid">14</td><td style="text-align:left;">Captain America: Civil War</td><td>2016</td><td>3</td><td>147</td><td>7.8</td><td>75</td></tr>
<tr><td class="rowid">15</td><td style="text-align:left;">Black Panther</td><td>2018</td><td>3</td><td>134</td><td>7.4</td><td>88</td></tr>
<tr><td class="rowid">16</td><td style="text-align:left;">Spider-Man: Homecoming</td><td>2017</td><td>3</td><td>133</td><td>7.5</td><td>73</td></tr>
<tr><td class="rowid">17</td><td style="text-align:left;">Doctor Strange</td><td>2016</td><td>3</td><td>115</td><td>7.5</td><td>72</td></tr>
<tr><td class="rowid">18</td><td style="text-align:left;">Thor: Ragnarok</td><td>2017</td><td>3</td><td>130</td><td>7.9</td><td>74</td></tr>
<tr><td class="rowid">19</td><td style="text-align:left;">Avengers: Infinity War</td><td>2018</td><td>3</td><td>149</td><td>8.5</td><td>68</td></tr>
<tr><td class="rowid">20</td><td style="text-align:left;">Ant-Man and the Wasp</td><td>2018</td><td>3</td><td>118</td><td>7.1</td><td>70</td></tr>
<tr><td class="rowid">21</td><td style="text-align:left;">Captain Marvel<sup><a href="#fn2" id="ref2">2</a></sup></td><td>2019</td><td>4</td><td>128</td><td class="likemissing"></td><td class="likemissing"></td></tr>
<tr><td class="rowid">22</td><td style="text-align:left;">Avengers: Endgame<sup><a href="#fn2" id="ref2">2</a></sup></td><td>2019</td><td>4</td><td class="likemissing"></td><td class="likemissing"></td><td class="likemissing"></td></tr>
<tr><td class="rowid">23</td><td style="text-align:left;">Spider-Man: Far From Home<sup><a href="#fn2" id="ref2">2</a></sup></td><td>2019</td><td>4</td><td class="likemissing"></td><td class="likemissing"></td><td class="likemissing"></td></tr>
</tbody>
<tfoot><tr><th class="rowid"></th><th>Total/Average</th><th></th><th></th><th>2691</th><th>7.5</th><th>68</th></tr></tfoot>
</table>
</div>
{{< /raw >}}

The movies are already the
[most successful movie franchise ever](http://mentalfloss.com/article/70920/10-highest-grossing-movie-franchises-all-time). They
have almost grossed more than the two next most successful
franchises (*Harry Potter* and *Star Wars*) combined. the only other
franchise with more films is *James Bond*, which has 26 movies (and
comes 4th in the revenue list), but they have been making Bond movies
since 1962, and the MCU dates only from 2008. The rate of production
of movies in the MCU has been more than five times that of the Bond
series. And three more movies will be released this year, followed by
(most likely) another three in 2020 so Bond won't keep his spot for
long. The franchise has been so successful that I expect there will be
another decade at least to come, so maybe another 30 movies. Can you
imagine a movie franchise of 50 movies?

So the MCU is successful, who cares?  Why look at what are often
considered just escapist ephemera? I talk about this in more detail in
this blog's ["about page"](/posts/description/), but to summarise: it is
cogently argued in Harari's book *Sapiens* that the modern Home
Sapiens is set apart from our cousins by the ability to tell
stories. Stories, myths, legends, narratives, or fictions -- whatever
names you use -- allow us to build social constructs larger than
[Dunbar's number](https://en.wikipedia.org/wiki/Dunbar%27s_number)
(around 150). Stories allow us to change and adapt as a species more
quickly than our genes possible could. Stories let us plan ahead, and consider
hypothetical situations -- fictions.
 
Stories have made us the dominant species on the planet in the blink
of an eye (on evolutionary time scales). So, to follow the reasoning
further, it is not just the cleverness, or intellectual value of a
story that it important, but also its reach. Popular fiction, often
ignored by serious academics, is vastly more important than serious
thinkers would have you believe. And what is the most popular fiction
on the planet at this point? Well, we could argue that the MCU fits
that bill.

The MCU also extends far beyond this set of movies to a truly amazing
set of media including: 

  + Graphic novels (the films are based on a large corpus of such, but
    there are also direct
    [tie ins](https://en.wikipedia.org/wiki/Marvel_Cinematic_Universe_tie-in_comics)
    that specifically link to the movies -- often preludes to the
    movies).
 
  + Novelisations of the movies, tie-in novels and guidebooks.

  + Short films: [the Marvel one-shots](https://en.wikipedia.org/wiki/Marvel_One-Shots), e.g., "The Consultant", ....

  + [TV series:](https://en.wikipedia.org/wiki/List_of_Marvel_Cinematic_Universe_television_series)
    e.g., "The Defenders" (a series of 5 interwoven sub-series),
    "Agents of SHIELD", "Agent Peggy Carter", "Cloak and Dagger", ...

  + Theme park exhibits.

  + Video and board games.

  + The usual merchandising, e.g., toys, posters, and so on. 

The MCU involves countless *(aleph-one for those who care)* writers
and artists, all connecting into one universe of interconnected plot
lines.

And this doesn't even include other Marvel movies and content, e.g.,
the X-Men series, and the series of previous Spider-Man movies, both
notable successes in their own right.

The MCU is remarkable both for its scope, but also because despite
obsessive attention from dedicated fans, there are relatively few
consistency gaffs<sup><a href="#fn3" id="ref3">3</a></sup>, though there are a few: 
 
+ The technology of the tapes Quill has (from his Mum) predate his
  abduction by Yondu (in 1988).
+ They fluff the
  [notional timing of Spider-Man: Homecoming](https://screenrant.com/avengers-spider-man-homecoming-time-jump-director/)
  relative to the other movies.
+ Captain America's shield does a cameo in Iron Man 2, at the same
  time as it is supposedly frozen in the ice.

Plus a few more. But I can't imagine doing better myself. 

# MCU Literature

There is also a vast literature written about the MCU by journalists,
fans and even academics, up to an including one
[university course](http://www.ubalt.edu/news/news-releases.cfm?id=2086)
at the University of Baltimore. I've read a lot, but definitely not
everything. Here's a quick list of links to other people's analysis of
the MCU and comics in general. 

  + [What each Avenger says the most](https://towardsdatascience.com/i-analyzed-marvel-movie-scripts-to-learn-what-each-avenger-says-most-2e5e7b6105bf)
  + [Marvellous Hypocrites: Sexism in the Marvel Cinematic Universe](https://gvsufeministvoices.wordpress.com/2017/04/23/marvelous-hypocrites-sexism-in-the-marvel-cinematic-universe/) 
  + [Gender and comics](https://pudding.cool/2017/07/comics/?ex_cid=SigDig)
  + [Race and the MCU](https://www.forbes.com/sites/anharkarim/2018/10/10/the-marvel-cinematic-universe-is-61-white-but-does-that-matter/#565b3f1c4482)
  + [Avengers: Infinity War represents the past, present, and future of the Marvel Cinematic Universe](https://www.vox.com/culture/2018/4/23/17224988/avengers-infinity-war-marvel-cinematic-universe-mcu-explained)
  + [Secrets of the Marvel Universe](https://www.vanityfair.com/hollywood/2017/11/marvel-cover-story)
  + [Marvel Universe looks almost like a real social network](https://arxiv.org/abs/cond-mat/0202174)

# Why JUST the MCU?

There is no need to tell me that the picture at the start of this
article -- Spider-Girl -- doesn't come from the MCU, but from the
larger Marvel Universe. Given the number of commentaries on gender
bias in comics and the MCU, maybe there should be a Spider-Girl
movie. I'd definitely watch it.

Regardless, I'm going to start with the MCU. And what's more, I'm
looking at the movies (the "cinematic" part of the universe). I'd like
to look at more, but there is so much stuff out there that even
cataloguing it isn't easy. And as part of this work I'm going to have
to sit down and watch everything again. Not that I mind that, but the
current movies alone represent more than 44 hours of viewing. If I
tried to add in, even just *Agents of SHIELD* I wouldn't have time to
sleep. (That's a joke. Who has time to sleep anymore?)  But maybe we
can make some side-trips, for a good cause later on.

I guess that isn't a good enough excuse though, and I will look at the
whole corpus of Marvel or DC or something else at some point, but the
MCU is appealing scientifically because it avoids some of the problems
of the wider 'verse, for instance:

+ The same person may adopt multiple hero personas over time (Julia
  Carter is first Spider-Woman and then Arachne). 

+ The same hero persona may be embodied in different people who take
  on the mask and the mantle of that hero (Captain America was given
  life by Steve Rogers, William Naslund and Jeff Mace).
  
+ Reboots: stories, origins, and events have been rewritten by various
  authors to update them for current audiences, take account of
  technological developments in the real world, or allow authors to
  express their artistic, social or ethical ideas. But reboots create
  huge problems in, for instance, constructing timelines. One approach
  adopted is to say events happen in parallel universes, but this
  really doesn't help analysis. And sometimes universes cross-over as well.
  
+ Time travel, a common theme of many sci-fi and comics stories can
  lead to very complex relationships.
  
+ Although datasets exist for many comics, these are often very coarse
  grained, for instance the
  [Marvel Chronology Project](http://www.chronologyproject.com/)
  records which characters appear in which comics, but little else. 
  
All of these issues are (so far) mostly absent from the MCU. Not
that it is trivial to analyse the MCU, even so. 
  
#  Summary
 
So that's the quick version of what I want to do with this blog, and
why I think the MCU is an interesting starting point. No maths
today. More later, though I am not planning to dump anything too hard
on you.

Next week, I plan to work on a timeline of the MCU, but with a twist,
so stay tuned.

---

Footnotes:

  1. {{<raw>}}<div id="fn1" class="footnote">

  The items in the table are not in "release year" order. They are in the
  order they are set in the MCU timeline (more on this next week).
  
  <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div>
  {{</raw>}}

  2. {{<raw>}}<div id="fn2" class="footnote">
  
  Not released at the time of writing.
  
  <a href="#ref2" title="Jump back to footnote 2  in the text.">↩</a></div>
  {{</raw>}}

  3. {{<raw>}}<div id="fn3" class="footnote">
  
  There are plenty of physics/chemistry/biology mistakes in comics and
  the MCU. Let's not go down that road. It doesn't go anywhere I want
  to go.
  
  <a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
  {{</raw>}}
