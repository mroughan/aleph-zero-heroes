---
title: "3J's Guide to Alliteration"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-04-24
lastmod: 2019-04-24 11:18:54
description: "J. Jonah Jameson's guide to alliteration in comics. "
categories: ["Comics"]
tags: ["alliteration", "julia", "marvel", "dc"]
cover: "https://i.annihil.us/u/prod/marvel/i/mg/b/d0/5269582835689/standard_large.jpg" 
featuredImage: "https://i.annihil.us/u/prod/marvel/i/mg/b/d0/5269582835689/standard_fantastic.jpg" 
featuredImageDescription: "Image provided by Marvel. © 2019 Marvel"
draft: false
---

# Alliteration

[Alliteration](https://www.litcharts.com/literary-devices-and-terms/alliteration)
is when you use the same initial letter or sound  beginning 
words close together in a sentence or name. For instance: 

+ A **m**iss is as good as a **m**ile,
+ **P**eter **P**arker **p**icked a **p**eck of **p**ickled **p**eppers<sup><a href="#fn1" id="ref1">1</a></sup>,
+ **C**oca-**C**ola, or 
+ **M**arilyn **M**onroe. 

It's "well known" that the names of comic-book heroes are
often alliterative. The *Big Bang Theory* made a thing about it in one
episode (S3E16). Famous examples are

+ J. Jonah Jameson, Jr.,
+ Peter Parker,
+ Bruce Banner<sup><a href="#fn2" id="ref2">2</a></sup>, and
+ Steven Strange.

and the list goes on. Some fans have collected lists of such names at a few places.

+ [Which Marvel characters have alliterative names](https://scifi.stackexchange.com/questions/120217/which-marvel-characters-have-alliterative-names)
+ [Which DC characters have alliterative names](https://scifi.stackexchange.com/questions/120334/which-dc-characters-have-alliterative-names)
+ [CBR's alliterative names list](https://community.cbr.com/showthread.php?30033-Alliterative-names-list)

One explanation for frequent use of alliteration comes direct from
Stan Lee.  Apparently, Stan Lee used alliteration particularly because
he found those names more memorable. To quote:

{{< blockquote author="Stan Lee, from an interview with Emmett Furey, 2006" link="https://www.cbr.com/stan-lees-a-brief-history-of-marvel-with-kevin-smith/" >}}
  It would be hard for you to believe this, because
  I seem so perfect: I have the worst memory in the world, so I finally figured out, if I could give somebody a name,
  where the last name and the first name begin with the same letter,
  like Peter Parker, Bruce Banner, Matt Murdock, then if I could
  remember one name, it gave me a clue what the other one was, I knew
  it would begin with the same letter.
{{< /blockquote >}}


But that doesn't explain it all. Alliteration is also common in
DC-land.  Superman's girlfriends and enemies have a strange
relationship with [L.L.](https://superman.fandom.com/wiki/LL), for
instance:

<div class="ui large right floated image">
  <img src="/img/LLinitials-superman157.jpg">
</div>

+ Lana Lang,
+ Lois Lane,
+ Lex Luther,

<!-- ![Superman](/img/Superman_204_LL_initials.jpg) -->
<!-- ![Superman](/img/action_comics_issue_252_page_30.jpg) -->

A
[rumour](https://www.supermanhomepage.com/comics/comics.php?topic=comics-sfaq#Q33)
says that Joe Shuster (creator of Superman with Jerry Seigel) had a
girlfriend with the initials L.L. But the pattern sounds like it
started as lark and then grew into a game (a longer discussion is
[here](https://www.supermanhomepage.com/comics/comics.php?topic=articles/ll-initials)).

DC didn't just alliterate Superman's clique. What about

+ Wonder Woman, 
+ Captain Cold, and
+ the Teen Titans.

However a good scientist is always sceptical about received wisdom. So
let's test whether alliteration is really unusually common for superheroes.

And yes, I will provide some (longish)
[lists of alliterative names](./#results). If you want to skip
straight there follow the link, and then click on the tables for the
full datasets (the second has more than 1,400 alliterative names). And
I will show who uses alliteration more: Marvel or DC, and tell you
which initial letters are most common for alliterative names.

 
# Analysis

## Data

I looked at two datasets from Kaggle. 

+ The
[Complete Superhero Dataset](https://www.kaggle.com/thec03u5/complete-superhero-dataset), and
<!-- + [Marvel Superheroes](https://www.kaggle.com/dannielr/marvel-superheroes) -->
+ [Superheroes info and stats](https://www.kaggle.com/magshimimsummercamp/superheroes-info-and-stats).

Why two? Well, initially, it was actually three. The third dataset looked
good, but when I started looking in detail it had some very strange
entries, including many characters listed as both DC and Marvel. They
aren't (though they might look that way because of  [cross-over
events](https://en.wikipedia.org/wiki/DC_vs._Marvel)) but we are
interested in the origin of the character, not its extent. 

The two selected datasets both had something interesting to
contribute. The first (DS 1), is a fairly short list at 743 entries,
with 718 unique names. But it lists both the superhero alter ego's name
and the (full) real name (where there is one).

The second dataset (DS 2) is much bigger, with well over 30,000 names,
though there are more duplicates (because the same character appears
in different guises or different alternative universes).  However,
each entry contains only one name, and some characters such as
Spider-Man show up separately as Peter Parker, while others appear
only under one guise.  So it is larger, but not as clean.

Both datasets come as CSV files (which is typical at Kaggle), and so
were easy to input into [Julia](https://julialang.org/) as described
in [this post](/posts/post_julia2/), so I won't include my own links
to datasets, except to note that the second had several files: the one
being used here is called `superheroes_info.csv `.

One caveat: I don't know how these were collected, so they may have
sampling biases. In particular, as we will mention later, the sampling
process may prefer alliterative names, at least in the case of the
smaller dataset.

## Code

We first remove names that include (small) Roman numerals -- these are
repeated versions of the same character and aren't helpful. We also
remove duplicate names that arise because of different variants of
the same character.

Then each name is tested by a small function that does a few things:

1. It removes bracketed pieces (these seem to be comments rather than part of the name);

2. It splits the name into component "words" around spaces or
   hyphens<sup><a href="#fn3" id="ref3">3</a></sup>;

3. It discards empty pieces and stop words (e.g., "of"); and

4. It finds the first letter of each word, the *initial*.

If the name has 2 words, we insist they both start with the same
letter<sup><a href="#fn4" id="ref4">4</a></sup>. If three, we 
insist that at least two match, and if 4 then we
insist at least 3 match. If there are 5 or more words, we don't
consider it (these are rare, and tend to be complicated).

{{% render-code file="static/code/alliteration.jl" language="julia" %}} 

Just a little translation of the Julia code seems warranted.

+ The literals `r"\(.*\)"` and `r"[\s-]+"` are
  [regular expressions](https://www.regular-expressions.info/). Julia
  allows extra codes at the start of the definition of string-like
  literals. In this case the "r" specifies it is a regular expression.

+ The expression `[ words[i][1] for i in findall(length.(words) .> 0) ]`
  is a [list
  comprehension](https://en.wikipedia.org/wiki/List_comprehension); a
  syntactic device for creating new lists or arrays without writing out
  a cumbersome loop. It's an approach that looks a little more like
  the way a mathematician would specify a set. We are using it here to
  get the first letter of each non-trivial element of the array `words`. Julia's
  [comprehensions](https://docs.julialang.org/en/v1/manual/arrays/index.html#Comprehensions-1)
  are reasonably vanilla (compared to Haskell *et al.*) so I won't go
  into more detail here.  
  
+ The function returns a quad-tuple containing true/false as well as
  the number of words (minus stop words), the maximum number of
  duplicates and the most common letter.
  [Tuples in Julia](https://en.wikibooks.org/wiki/Introducing_Julia/Arrays_and_tuples#Tuples)
  are very like immutable arrays, though specified with round
  brackets. We can index into them just as for arrays to get values out,
  but we can't change the array. Mostly they seem to be used to pass
  input and output arguments from functions. We don't actually need
  the brackets in the return syntax, but it makes the elements being
  returned look a little more obvious to me.

The key output is the true/false value telling us whether the name is
alliterative. We use this as a filter on the names in the data frame
and Bob Banner's your uncle<sup><a href="#fn2" id="ref2">2</a></sup>. 

## Results

The simple things first. The proportion of alliterative names in datasets 1
and 2 (DS 1 and DS 2, respectively) are in the following table. 

| dataset               | proportion of alliterative names |
|:--------              |--------------------------------:|
|   DS 1 (full name)    | 8.6% |
|   DS 1 (hero name)    | 6.6% |
|   DS 2                | 6.4% | 

The first is a little different from the other two. The first is based
on the characters "real" name and the second on their hero alter ego's
name. The names in DS 2 are a mix, but often are their real name. So
we might expect DS 2 to look more like the DS 1 full name list. The
reason it doesn't is that the "full names" often include middle names
and extensions that are not usually used (and don't appear in DS
2). For instance, I never knew that Peter Parker is sometimes listed
as "Peter Benjamin Parker", Stephen Strange is sometimes "Stephen
Vincent Strange", and and J. Jonah Jameson sometimes has "Jr." tacked
on the end.

Because we allow that a three-word name is alliterative if only two
initials match, and the longer names allow more matches (we'll show
this mathematically in the next section) and thus the full name
version has more matches. Otherwise the datasets are remarkably close.

Here's the start of the lists. For DS 1 there are 94 heroes with
either an alliterative hero name or full name. 

{{% csv_table src="static/csv/alli_data_names.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Comics/alli_data_names.csv" maxLines="7" colStyle="text-align:left" %}} 

and DS 2, for which we have 1442 names

{{% csv_table src="static/csv/alli_data3_names.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Comics/alli_data3_names.csv" maxLines="7" colStyle="text-align:left" %}} 

You can get the data from my [GitHub](https://github.com/mroughan/AlephZeroHeroesData) by clicking on the tables.

The files also provide the publisher of the respective heroes'
comics. So a simple question we might ask is "did Stan Lee set a trend
in Marvel that led to an unusually high proportion of alliterative
names?" The following plot compares DC and Marvel using the two
datasets. The obvious conclusion is that alliterative names are more
common in DC-land than Marvel-land.

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 70;
  var HEIGHT_IN_PERCENT_OF_PARENT = 50;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "c7df98c5-a5af-41cc-9b43-16958b187a13")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': 0
    })
    .node();
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Publisher"},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"font":{"size":20},"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":10,"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Proportions (%)"},"bargroupgap":0.1},"data":[{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[6.077348066298343,9.375],"type":"bar","name":"DS 1","opacity":0.7,"x":["Marvel","DC"]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[5.907394066409064,7.85092408736826],"type":"bar","name":"DS 2","opacity":0.7,"x":["Marvel","DC"]}]};
  var data = plot_json.data;
  var layout = plot_json.layout;
  Plotly.newPlot(gd, data, layout);
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();

</script>

Stan Lee had a tremendous impact on comics. Maybe he indirectly
influenced DC as well?  That brings us back to the main question; the
one I asked at the start was "is alliteration unusually common for
superheroes?" We have numbers now, but we don't really have any means
of interpreting them.  We can compare Marvel and DC, but is six and a
bit percent a big number or not? What about 8?  It seems significant,
but not huge, however the only way to really understand it is to
compare to names in the real world. Too much data science relies on
cramming a bunch of data through some code without having any baseline
idea of what to expect. So that's what we will will look at next.


# How common are alliterative names in the real world?
 
## Real-world name data

Ideally, we would start with a list of all names (in some region and
time period) and check them all for alliteration.  Lists exist (e.g.,
telephone books), but it's surprisingly hard to get hold of them. Most
name lists that are available freely are of baby names (first names)
and a few have surnames (family names) but the lists with both
together are hidden behind
[user interfaces](https://www.ancestry.co.uk/search/collections/bt/)
that make getting a good sample difficult. See
[this link](https://stackoverflow.com/questions/18391799/database-or-list-of-english-first-and-last-names)
for some discussion. What I could get was from a blog titled
["Two-Letter initials: Which are the most common?"](https://blogs.sas.com/content/iml/2011/01/14/two-letter-initials-which-are-the-most-common.html)

It's pretty close to what we want. It's based on a real dataset from
4,502 employees of SAS (the company). The dataset has the number of
each pair of initials. We have an alliterative name if the two match,
e.g., J.J.

The
[blog](https://blogs.sas.com/content/iml/2011/01/14/two-letter-initials-which-are-the-most-common.html)
has some nice visualisations, but doesn't explicitly calculate the
alliterative percentage: I make it that **6.2%** of pairs correspond
to an alliterative name. 
		    
The results seem to match up really very well with the Marvel-v-DC
plot above. DC is a little higher (7.8% vs 6.2%), but Marvel is spot on,
despite Stan Lee's reputation for alliteration. So it seems the
question might be answered, i.e. alliteration isn't much more common
in comics than in the real world. 
			
However the data only contains 2-letter initials and it isn't
huge. While 4,502 names may seem like a large dataset there are
676 possible pairs of initials so some possible pairings have a very
small number of data points. We need a way to explore the possible
bias in the data, and to extend it to longer names.
		
## The chance of a match 

We can explore the biases in the data using a more artificial
approach.  It won't be as realistic, but it provides a reference point
we will call a *null-model*. Let's assume the letters of names are
distributed in the same manner as letters in a wider corpus of
English, and that first and family names are chosen
independently. These are big assumptions as they presume that parents
don't select either for or against alliteration, but this is a
null-model and not a perfect representation of reality.

Naively, one might assume that the probability of getting the same
letter for the second name is just 1 in 26 because there are 26
letters. But actually, the probability depends strongly on the
distribution of letters. Imagine that the letter Q was chosen 9 times
out of 10 as a first letter, then there would be a probability of
0.81 of getting Q.Q. Already this is much higher, without any chance
of any other pairing, so we need to understand letter frequencies.

Letter frequencies for English have often been compiled. However we
don't want the standard generic letter frequency. We want the
frequencies of first letters or initials, which are quite different.
[Lists of first-letter frequencies](https://en.wikipedia.org/wiki/Letter_frequency#Relative_frequencies_of_the_first_letters_of_a_word_in_the_English_language)
for English are also easily available though.

Then we have to do a little calculation. A little bit of probability is a
good thing for a data-scientist to have in their swag of tools. So
let's work through it. In the lingo of probability, think of the
initial letter of each name as a random variable (or RV) {{< raw
>}}\(\displaystyle X_i\){{< /raw >}} where i is the index into the
list of words in a name. We assume that the RVs are IID (Independent and
Identically Distributed). They aren't, but we're modelling them that way.

We use an abbreviation for probabilities:
{{< raw >}}
\[
p_x = Prob( X_i = x ).
\]
{{< /raw >}}

Then we use the [Law of Total
Probability](https://en.wikipedia.org/wiki/Law_of_total_probability)
to write what we want (the probability the two random variables are
the same) as a set of sub-events, one for each initial letter.
{{< raw >}}
\[\begin{array}{rcl}
   Prob( X_1 = X_2 ) & = & \sum_x Prob( X_2=x | X_1=x ) Prob( X_1 = x ) \\
                     & = & \sum_x Prob( X_2=x ) Prob( X_1 = x ) \\
		     & = & \sum_x p_x^2,
  \end{array}		     
\]
{{< /raw >}}
where we write
{{< raw >}}\(\displaystyle   Prob( X_2=x | X_1=x ) \){{< /raw >}}
to mean the conditional probability that the second initial is x,
given the first one. And we drop the conditioning because the two
random variables are independent. If all of the probabilities are the same, i.e.,
{{< raw >}}\(\displaystyle  p_x = 1/26\){{< /raw >}}
then this gives the intuitive probability of a match of 1 in 26. 

However, now we can calculate the probability the two initials are the
same given any frequency of initial letters.  When we make the
calculation for English word initials we get **7.4%**. This is a
little higher than the estimate from the data above. It is suggestive
that parents are slightly averse to alliterative names. It's also
closer to DC's percentage than to Marvel's (for the larger dataset, DS
2). 

The advantage of this number over the real data is we are no longer
limited by the small data we have, but also we can now generalise this
to consider the probability that three-word names are alliterative.

## Three-name Monty

<div class="ui medium right floated image">
  <img src="/img/venn_diagram.svg">
</div>

We don't have data for three-word names, but the null-model given
above isn't miles off for two-word names, so we'll try to push it a
little more. I called a three-word name alliterative if two initials
matched. Calculating this probability is a little harder, but not
much.  The main point to get your head around is that probabilities
don't simply add. So when we calculate the probability that at least
one pair of three initials matches, we add the probabilities of each
possible matching pair, but then have to subtract the part that has
been over-counted. We can visualise it as a Venn diagram. The event
that a pair matches is the intersection of a pair of circles, but if
we add the areas of each of these regions we triple count the centre
region, so we have to subtract that away. Hence, the calculation is

{{< raw >}}
  \[
  \begin{array}{ll}
  & Prob( X_1 = X_2 \; or \; X_2 = X_3 \; or \; X_1 = X_3) \\
  & =  Prob( X_1 = X_2) + Prob( X_2 = X_3) + Prob( X_1 = X_3)
         - 2 Prob(  X_1 = X_2 = X_3 ) \\
  & = 3 \sum_x p_x^2 - 2 \sum_x p_x^3,
  \end{array}		     
  \]
{{< /raw >}}

where the second summation is derived using conditional probability in the same way we derived the first. 

When we calculate this using the first letter frequencies we get
**20.1%** as the estimate of the proportion of alliterative names,
which is much higher than for two-word names. So if the dataset has a
high proportion of three-word names, it should have a higher
percentage of alliterative names.

If we extend this to three matching initials for four-word names we
get **2.7%**, and for five and more word names it drops to being
insignificant (hence the cut off we used earlier). 
    
<!-- ## Two swings and a miss -->
<!-- Also, superheroes often have two names: their real name and the name of their alter ego. So they get two bites at the cherry. What proportion would hit that, given two chances. -->

## Comparison

So, now we can finally compare the numbers we see in our calculation
with the numbers in the real data. The confusing factor is that the
numbers in the data are a mix-up of names composed of different numbers
of words. So let's separate out the different cases and take a look in
the following plot. Note that the real names bar only appears for
2-word names, because we only have data for these. 

<!-- Here we mix the two name lists of DS 1, because -->
<!-- looking at them by number of words they should disentangle.  -->

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 90;
  var HEIGHT_IN_PERCENT_OF_PARENT = 35;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "b5b17384-8031-4a0a-9992-45c56a2d94fa")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': 0
    })
    .node();
 var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"probability of alliteration"},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":{"l":50,"b":50,"r":50,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"number of words","autotick":false,"autorange":"reversed"},"bargroupgap":0.1},"data":[{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4],"type":"bar","name":"Real (2-word) names","opacity":0.7,"orientation":"h","x":[0.0,0.06197245668600004,0.0,0.0,0.0]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4],"type":"bar","name":"Null-model","opacity":0.7,"orientation":"h","x":[0.0,0.07351885990000002,0.20538173449562608,0.027484489337271226]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4],"type":"bar","name":"Measured proportion (DS 1)","opacity":0.7,"text":[0,76,27,0],"orientation":"h","x":[0.0,0.1310344827586207,0.17532467532467533,0.0]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4],"type":"bar","name":"Measured proportion (DS 2)","opacity":0.7,"text":[0,1251,186,4],"orientation":"h","x":[0.0,0.09377108162806386,0.20350109409190373,0.04]}]};
  var data = plot_json.data;
  var layout = plot_json.layout;
  Plotly.newPlot(gd, data, layout);
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();

</script>

<br>

And the results are interesting. First, for two-word names there does
seem to be an increase in alliteration, though we can't pay too much
attention to the smaller dataset here because it could easily be
innately biased towards alliterative names. However we do see a small
increase in alliteration in DS 2, compared to the real initials data
and the null-model.

However that isn't so evident in 3-word names. There the null-model
(remember we don't have real data for 3-word names) matches
unreasonably well with DS 2, and DS 1 is actually lower. 

The 4-word case appears to match reasonably, but it is based on very
small numbers so we won't say too much about that.

Overall, the results aren't as strongly suggestive of alliteration in
superhero names as I had initially expected, given the received
wisdom. I'll talk about that a little more below, but first, a couple
of little side questions "what letter starts an alliterative name most
commonly, and is it different for superheroes compared to the real
world?"

## What are the most common alliterative letters? 

The following plot shows the top-10 letters that are most common, and
compares that to the null-model and the two-word name data.
    
<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 90;
  var HEIGHT_IN_PERCENT_OF_PARENT = 60;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "3dfaee1c-d0fa-4190-ae1d-7b7b09005796")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': 0
    })
    .node();
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"number"},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":{"l":50,"b":50,"r":50,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"repeated initial letter","autotick":false,"autorange":"reversed"},"bargroupgap":0.1},"data":[{"marker":{"color":{"color":"orange","opacity":0.5}},"y":["m","s","b","c","d","r","a","j","g","h"],"type":"bar","name":"DS 2","opacity":0.7,"orientation":"h","x":[14.850798056904928,10.340041637751561,8.535739070090216,7.356002775850104,7.078417765440666,5.412907702984039,5.135322692574601,5.065926439972242,4.441360166551006,4.302567661346288]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":["m","s","b","c","d","r","a","j","g","h"],"type":"bar","name":"Alliterative real (2-word) names","opacity":0.7,"orientation":"h","x":[13.978494623655907,15.053763440860207,9.677419354838705,9.677419354838705,6.810035842831777,6.09318996361983,2.867383512006928,6.451612903225803,3.584229391218875,2.150537634408601]},{"marker":{"color":{"color":"orange","opacity":0.5}},"y":["m","s","b","c","d","r","a","j","g","h"],"type":"bar","name":"Null-model","opacity":0.7,"orientation":"h","x":[3.826,6.686,4.434,5.238,3.174,2.826,11.682,0.511,1.642,4.2]}]};
  var data = plot_json.data;
  var layout = plot_json.layout;
  Plotly.newPlot(gd, data, layout);
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  }; 
  return gd;
})();

</script>

<br>

We see firstly that the dataset and real-world names are far away from
the null-model, so we will discount the null-model for the purpose of
considering the most common alliterative letter.

There are some similarities between real-world and superhero
alliterative letters. The letter 'M' is at the top of the superhero
list, and it has almost the same frequency as in the real data. The
two lists also share the same top-5 letters in almost the same order.

However, there are also some differences. Alliterative superhero names
are quite a lot less likely to start with 'S' than real names
and more likely to begin  with 'A' or 'H'.

These, however, seem to be quirks, and the general trend is that
alliteration in superhero names follows a similar pattern to that in
the real world. Once again, that suggest that there isn't anything
super-special about the use of alliterative names for superheroes. 


# Alliteration revisited

Alliteration is a little more common for superhero names than in the
real world. I had expected it to be much more common, based on what I
thought I knew. There certainly are many characters from comics with
alliterative names, but the proportion isn't excessive. We can hardly
accuse Stan Lee and his colleagues of
[paroemion](https://en.wikipedia.org/wiki/Paroemion) (overuse of
alliteration). 

Then why do we perceive alliterative names as so common?

Stan Lee had the right idea, but he didn't go far enough. Alliteration
isn't just a memory aid for him. And it isn't just about remembering
the second name (e.g., Parker comes after Peter). It's about
remembering the character wholesale.

The comic universe has literally tens of thousands of characters. It
fits the
[loads and loads of characters](https://tvtropes.org/pmwiki/pmwiki.php/Main/LoadsAndLoadsOfCharacters)
trope. The characters can tend to blur into one and another.  In an
invented universe with so many characters who do we latch onto? Who
do we remember? The answer is that we remember the character with the
memorable name. That could be because the name is easy (e.g., Superman) or
exciting (e.g., Wolverine) or just because it's alliterative.

Memorability is why alliterative names have often been used as
[stage names](http://babynamepondering.blogspot.com/2013/08/alliterative-names.html). It's
why alliterative phrases are used in advertising (e.g. "Maybe it's
..." -- you fill in the rest). It's why alliterative aphorisms survive
("A miss is as good as a mile" makes much less sense than "An ynche in
a misse is as good as an ell" but it is more memorable). Shakespeare
and Dickens did it with flair, as have  a thousand other
authors. Comic-book authors are no different. 

All importantly alliterations stick in our mind better. So it is
natural that we perceive alliteration as more common than it is. 

So my answer is that the data shows that alliteration isn't as
overwhelmingly common in the superhero realm as we might think, but
the characters with alliterative names stick in the memory. Probably
that's why some are more successful as well, leading to them being
more prominent, and this also enhances the perception that superheros have
alliterative names.

Why is alliteration so memorable to us? That's a question that is a
little too deep for me. At least for today! And of course, all of the
discussion and data above is oriented towards the English language and
Western comics. We have yet to discover how universal alliteration is. 

 
---
 
## Footnotes:

1. {{<raw>}} <div id="fn1" class="footnote">

     Forgive the minor name change for obvious reasons.

     <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div>
     {{</raw>}}

2. {{<raw>}} <div id="fn2" class="footnote">

     The Hulk's <em>real</em> name is "Robert Bruce Banner" because Stan got it
     wrong (he wrote Bob Banner in one issue) and changed the name
     afterwards to fit. But everyone I know calls him Bruce<sup><a href="#fn6" id="ref6">6</a></sup>.

     <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div>
     {{</raw>}}

3. {{<raw>}} <div id="fn3" class="footnote">

	The definition of alliteration doesn't usually specify how
	hyphens are treated. Here we treat hyphenated names as two
	words, but acknowledge that this is somewhat arbitrary. For
	instance, hyphenation isn't always standard. Often a name such
	as "Spider-Man" will be commonly written "Spiderman". So
	constructed names that are unhyphenated, e.g., "Daredevil"
	might also be considered alliteration, thanks to the
	conjunction of dare and devil. Alliteration is about the
	sound, and in this sense "Dare Devil" sounds alliterative. We
	have no hope of picking all of these cases here
	though. N.B. Daredevil does make his way into our list, but
	only because "Matt Murdock" is alliterative also.

     <a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div>
     {{</raw>}} 

4. {{<raw>}} <div id="fn4" class="footnote">

     "Clark Kent" is alliterative. Alliteration allows for the same
     sound to be repeated, not just the same letter. It's a lot
     harder, however, to look for the same sound at the start of
     words than the same letter. To do so, we would be delving into
     phonetics.

     <a href="#ref4" title="Jump back to footnote 4 in the text.">↩</a></div>
     {{</raw>}}

5. {{<raw>}} <div id="fn5" class="footnote">

      We dropped repeats from the list. This is problematic: sometimes
      repeats occur because of "reboots" or alternative universe
      versions of characters. There is no need to include these more
      than once. However in other cases the repeated character
      refers to someone else taking the same role (Batman's Robin, for
      instance).

     <a href="#ref5" title="Jump back to footnote 5 in the text.">↩</a></div>
     {{</raw>}}

6. {{<raw>}} <div id="fn6" class="footnote">

     Just a little reference to <a href="https://www.imdb.com/title/tt0084786/">They call me Bruce.</a>
     It's not about the Hulk.

     <a href="#ref6" title="Jump back to footnote 6 in the text.">↩</a></div>
     {{</raw>}}


<!-- This dataset is weird -- it includes Jar Jar Binks. -->


<!-- Is it alliterative if you just repeat the same name twice, e.g., Jack-Jack? -->

