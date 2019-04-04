---
title: "Captain America v James Bond"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-03-28
lastmod: 2019-04-04 13:24:50
description: "Going beyond the qualities of individual
              movies to see how the structure of a franchise influences its success; OR
              power-laws in movies."
categories: ["Movies"]
tags: ["MCU", "Bond", "Julia"]
# cover: "https://julialang.org/v2/img/logo.svg" 
cover: "img/lego_cap_v_bond.png" 
featuredImage: "img/lego_cap_v_bond.png" 
featuredImageDescription: ", <a href=\"https://julialang.org/v2/img/logo.svg\">the Julia programming language.</a>"
draft: false 
---

# This is not a conventional fight

Comics fans love crossovers. And a key part of most crossovers is
providing an answer to the "who would win?" question. So who would win
out of Captain America and James Bond? 

They are both meant to be icons of their respective cultures; the US v
the UK; brash individualism v sophisticated charm; red, white and blue
v black tie. Both are physically at the pinnacle or beyond human
ability, but neither has an actual "super" power as such, unless you
count Cap's ability to throw a shield in a trajectory that defies
physics or Bond's
[casual misogyny](https://www.theguardian.com/film/2018/jan/30/times-up-for-james-bond-is-007-too-brutish-for-the-me-too-era)
as superpowers.
 
But this post is not actually about who would win a fight between
Captain America and James Bond. I'm sure everyone has their *own*
opinion, and I don't want to start a fight of my own. 

This blog is about the movie franchises --- it's MCU v Bond. And the
the MCU (Marvel Cinematic Universe) kicks Bond's butt.

A quick recap can confirm that: as of writing, the recorded
[worldwide box-office](https://www.the-numbers.com/movies/franchises)
for the MCU was more than $18 billion, whereas Bond tops out at around
$7 billion. Even adjusted for inflation, the MCU wins handily.

So ...  if the winner is so obvious, then this is a really short post? 

Not really. What I wanted to look at are some of the reasons why the
MCU is so much more than Bond. Obviously part of that story is *just*
the quality of scripts, acting, direction and so on. I'm not really
qualified to comment on those except at the level of personal
preferences.

What I can comment on is how the overall structure of the franchises
differ, and I think that is the critical distinction. The little piece
of magic that elevates the MCU above its rivals.

# The Structure of a Franchise

The obvious pieces of property in a franchise are

+ the movies themselves

+ the characters

and the overall setting in which they live. This latter is important,
but since most modern franchises sit in some variant of the world we
live in, it isn't the detail that matters most I think. 

Bond has 26 movies (inc. non-canon films).  The MCU has only 23
movies (inc. the two yet to appear this year). So superficially Bond
wins on number of films, but the number doesn't tell the story.

The Bond movies are based on about a dozen novels plus some short
stories by Ian Fleming. There are quite a lot of later books by some 8
or 9 other authors, and a relatively recent series of
[comics](https://en.wikipedia.org/wiki/James_Bond_(Dynamite_Entertainment)). Altogether
it's quite a substantial corpus, but it pales before Marvel's. They
have tens of thousands of individual media (mostly comics, but also
novels, histories and so on). So there is a depth to the Marvel
universe that the Bond universe lacks, but Bond makes up for it
perhaps on consistency? The Marvel universe has multiple
timelines/dimensions/planets in every variation they could think
of. It's a crazy, creative soup.  Maybe the structure of the Bond
movies is better because it comes from a single consistent world?

However, when you look at them, the Bond *movies* are only loosely
connected. They share some characters and concepts, but most are not
even traditional sequels. That is, they don't share direct references
to plot elements. There are sub-sequences (for instance the Daniel
Craig sequence of Bond Movies: *Casino Royale*, *Quantum of Solace*,
*Skyfall* and *Spectre*) that are such, but they are almost
independent of the prior movies. Some are also direct remakes (*Never
Say Never Again* and *Thunderball*). John Griswold has
constructed a
["high-level chronology of James Bond's life"](https://books.google.com.au/books?id=uariyzldrJwC&lpg=PA2&dq=Ian+Fleming%27s+James+Bond:+Annotations+And+Chronologies+For+Ian+Fleming%27s+Bond+Stories&pg=PA2&redir_esc=y#v=onepage&q&f=false),
but he notes that there are difficulties even with the Fleming books
by themselves.

> Fleming ... loved to put real events in the his stories even they
>  were out of synchronization with with the story being told.

Other problems include Fleming
[ret-conning](https://en.wikipedia.org/wiki/Retroactive_continuity)
Bond's birth-date for artistic reasons, and in other places he just
seems careless of details.

On the other hand, the MCU (as opposed to the wider Marvel universe)
is linked together by a complex
[timeline](/posts/post_mcu_timeline1/). It isn't entirely consistent
either, but it's a good deal easier to trace than the Bond world.
We'll go into more depth on the structure of the movies in later
posts, but for now something simpler.

The MCU is working with a much larger set of heroes and supporting
characters than Bond. Arguably, there are about 20 heroes in the MCU
and only 1 in the Bond movies. Both have casts of supporting
characters, but again, a fan of the MCU could probably list 20 or 30
important side characters in the MCU, and only
[about a dozen regulars](https://en.wikipedia.org/wiki/List_of_James_Bond_allies)
in the Bond universe (assuming we ignore the seemingly disposable Bond
girls). 

The Bond universe does have a nice set of
[villains](https://en.wikipedia.org/wiki/List_of_James_Bond_villains#Film_villains_by_production),
and actually reuses villains (for instance, the iconic Blofeld) more
than the MCU. This is a little strange -- comics are famous for the
reuse of villains, but the only villains to get much more than one
movie are Loki (who is a bit of a flip-flopper), and Thanos, who is
only in the background in most of his appearances.

However, that is all pretty vague. This is a data-science blog, so let's
try to be a little more quantitative. 

The simplest thing we can do is perhaps to count how many movies each
character appears in. The data comes from IMDb (through
[`IMDbPY`](https://imdbpy.sourceforge.io/) -- see
[this post](/posts/post_julia2/) for more details). The resulting
frequency for each name character are here for
[Marvel](https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_movie_char_n.csv)
and
[Bond](https://github.com/mroughan/AlephZeroHeroesData/blob/master/JamesBond/cast_movie_char_n.csv),
and the top-10 are displayed below.


<!-- <div id="tester2" style="width:80%;margin-left:auto;margin-right:auto;"></div> -->

<!-- <script> -->
<!-- 	TESTER = document.getElementById('tester2'); -->
<!-- 	Plotly.plot( TESTER, [{ -->
<!-- 	x: [1, 2, 3, 4, 5], -->
<!-- 	y: [1, 2, 4, 8, 16] }], { -->
<!-- 	margin: { t: 0 } } ); -->
<!-- </script> -->

<!-- <div id="tester3" style="width:90%;margin-left:auto;margin-right:auto;"></div> -->

<!-- <script> -->
<!-- 	TESTER = document.getElementById('tester3'); -->
<!-- 	var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"number of movies"},"bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"height":500,"margin":{"l":50,"b":50,"r":50,"t":60},"yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"character rank","autotick":false,"autorange":"reversed"},"barmode":"group","bargroupgap":0.1},"data":[{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4,5,6,7,8,9,10],"type":"bar","name":"James Bond","opacity":0.7,"text":["James Bond","Moneypenny","M","Q","Felix Leiter","Blofeld","Bill Tanner","General Gogol","Smithers","Mr. White"],"orientation":"h","x":[26,24,24,23,10,8,4,4,3,3]},{"marker":{"color":"green"},"y":[1,2,3,4,5,6,7,8,9,10],"type":"bar","name":"Marvel","opacity":0.7,"text":["Captain America","Iron Man","Nick Fury","Black Widow","Thor","War Machine","Hulk","Vision","The Winter Soldier","Pepper Potts"],"orientation":"h","x":[10,10,10,9,8,8,8,7,7,7]}]}; -->
<!-- 	Plotly.plot( TESTER, plot_json.data, plot_json.layout ); -->
<!-- </script> -->

<!-- <div id="tester" style="width:90%;margin-left:auto;margin-right:auto;"></div> -->

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 100;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "cc1509b9-4131-47c8-84de-549e6e07ce31")
    .node();
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"number of movies"},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":{"l":50,"b":50,"r":50,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"character rank","autotick":false,"autorange":"reversed"},"bargroupgap":0.1},"data":[{"marker":{"color":{"color":"orange","opacity":0.5}},"y":[1,2,3,4,5,6,7,8,9,10],"type":"bar","name":"James Bond","opacity":0.7,"text":["James Bond","Moneypenny","M","Q","Felix Leiter","Blofeld","Bill Tanner","General Gogol","Mr. White","Charles Robinson"],"orientation":"h","x":[26,24,24,23,10,8,7,6,3,3]},{"marker":{"color":"green"},"y":[1,2,3,4,5,6,7,8,9,10],"type":"bar","name":"Marvel","opacity":0.7,"text":["Captain America","Iron Man","Nick Fury","Black Widow","Thor","War Machine","Hulk","Vision","The Winter Soldier","Pepper Potts"],"orientation":"h","x":[10,10,10,9,8,8,8,7,7,7]}]};
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

You can see each character's position and number by moving your mouse
over the plot (if you have javascript enabled, in particular
[PlotlyJS](https://plot.ly/javascript/)). The two franchises have a
similar number of overall character appearances (618 for the MCU and
584 for the Bond movies), but otherwise they differ tremendously:

+ The Bond movies have a small, core set of characters (the eponymous
  hero plus 'M', 'Q' and Miss Moneypenny) who appear in almost every
  movie, and then the number of movies any other character appears in
  drops very rapidly. 
  
+ The MCU movie characters are in, at most, 10 movies (Iron Man,
  Captain America and Nicky Fury achieve this, though many of Fury's
  appearances are very brief cameos), but the rest of the top 10 are
  not far behind. No.10, Pepper Potts, is still in 7 movies.
  
This difference persists. We can look at the distribution of
appearances per character over all named<sup><a href="#fn1"
id="ref1">1</a></sup> characters. All the usual problems apply to
determining which movie a character appears in, but I have covered
most of that in a [previous post](/posts/post_mcu_timeline1/). Once we
have collated them all we can plot a full distribution of the number
of appearances per character below.  Data for the frequency histogram
counts are available here for
[Marvel](https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_movie_count.csv)
and
[Bond](https://github.com/mroughan/AlephZeroHeroesData/blob/master/JamesBond/cast_movie_count.csv).

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 100;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "cc1509b9-4131-47c8-84de-549e6e07ce31")
    .node();
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"type":"log","tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"number of movies"},"paper_bgcolor":"rgba(0,0,0,0)","legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"margin":{"l":50,"b":50,"r":50,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"type":"log","tickfont":{"color":"rgb(0, 0, 0)","size":18},"range":[-0.04,3.0],"title":"frequency"}},"data":[{"marker":{"color":"orange","symbol":"square","size":9},"mode":"markers","line":{"color":"orange","width":1},"y":[428,8,4,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,1],"type":"scatter","name":"James Bond (empirical)","x":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},{"marker":{"color":"green","type":"circle","size":9},"mode":"markers","line":{"color":"green","width":1},"y":[285,50,20,9,7,3,3,3,1,3],"type":"scatter","name":"Marvel (empirical)","x":[1,2,3,4,5,6,7,8,9,10]},{"mode":"lines","line":{"color":"green","dash":"dot","width":3},"y":[284.2533487002982,52.14190990613262,19.335310059140625,9.564632329189509,5.540669339169512,3.5467655868280454,2.432407416886756,1.7544848617410855,1.315214813800758,1.016350670356571],"type":"scatter","name":"Marvel (fitted)","x":[1,2,3,4,5,6,7,8,9,10]}]};
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

The plot shows the distribution of the number of characters to make a
given number of appearances. The axes are both log-axes, so that we
can see the whole range clearly (there is another reason to use log
axes that we will get into in a second). 

The two empirical distributions are very different. The full
distribution exacerbates the phenomena already described. Bond has a
small set of characters that appear often, and almost every other
character is in only one movie. The MCU has a much more consistent
form.

In fact the form of the MCU distribution is very close to a straight
line on the log-log axes (see the fitted curve). A straight line would
correspond to a *power-law* or *Pareto* distribution. The Marvel data
fits that law (to some extent<sup><a href="#fn2"
id="ref2">2</a></sup>) and the Bond data very much doesn't. Let's look
at why that is interesting.

# Power Laws and Human Behaviour 

A [power-law](https://en.wikipedia.org/wiki/Power_law) is  where one variable -- call it 
{{< raw >}}\(Y\){{< /raw >}} -- is related to another,
{{< raw >}}\(X,\){{< /raw >}} by a
function of the value that looks like
{{< raw >}}\[ Y \propto X^{-s}. \]{{< /raw >}}

For a probability distribution we might have, for instance, a
probability density function that takes the form
{{< raw >}}
\[ f(x) = \frac{\alpha x_m^{\alpha}}{x^{\alpha+1}}, \]
{{< /raw >}}
for {{< raw >}}\(x \geq x_m.\){{< /raw >}} The distribution above is
called the
[Pareto distribution](https://en.wikipedia.org/wiki/Pareto_distribution)
after Vilfredo Pareto an economist and sociologist who first noticed that
the distribution appeared when looking at peoples' incomes.

In our case, we are looking at a variation in which the variable of
interest (the number of movies a character appears in) takes discrete,
integer values. The discrete variant is often called a
[Zipf distribution](https://en.wikipedia.org/wiki/Zipf%27s_law). 

Power-law and Zipfian distributions have some interesting properties:
 
+ Power-laws are commonly associated with the 80-20 rule (80% of
everything is caused by 20% of people), but power-laws generalise this rule,
e.g., in many societies, the top 10% of wealthiest people control
roughly
[half the wealth](https://en.wikipedia.org/wiki/Distribution_of_wealth),
and you can look at other such ratios.

+ Power-laws are *scale invariant*, i.e., when you change the scale,
the law is not changed, e.g., if
{{< raw >}}
\[ f(x) \propto x^{-s}, \]
{{< /raw >}}
and then we scale by a constant {{< raw >}}\(c\){{< /raw >}}
{{< raw >}}
\[ f(c x) \propto c^{-s} x^{-s} \propto x^{-s}, \]
{{< /raw >}}
the law is unchanged. 

+ Power-law distributions can lack standard "moments". The moments
are standard statistical measures of a random variable, e.g., the mean
and variance. For instance, the Pareto distribution with 
{{< raw >}}\(\alpha \leq 2\){{< /raw >}} has *infinite variance*, a phenomena
which breaks a great deal of statistical intuition. For example, the
Central Limit Theorem doesn't apply! That's a big problem because this
theorem underlies a lot of other assumptions made in
statistical or data-science analyses. 

Despite their "weird" properties, we see power-law distributions all over the place:

+ the magnitudes of earthquakes

+ the distribution of incomes

+ word frequencies and other [analyses of media](https://medium.com/@michaeltauberg/power-law-in-popular-media-7d7efef3fb7c). 

In fact they are almost so ubiquitous in nature that the "normal"
distribution is not normal at all! They are particularly common when
examining human behaviour.

One of the places we see them is in human relationships. For instance,
the number of contacts between people in a social network is often 
modelled this way. 

Several data scientists have noticed that power-law distributions
appear in the context of the myths, legends and stories that have
survived to the present. In particular:

+ <a href="https://link.springer.com/article/10.1140/epjb/e2013-40583-3" target="_blank">"Network analysis of the Íslendinga sögur – the Sagas of Icelanders"</a>
  in which the authors examine the network of characters in the
  Icelandic sagas. 

+ <a href="https://iopscience.iop.org/article/10.1209/0295-5075/99/28002" target="_blank">"Universal properties of mythological networks"</a>
  in which the authors compare the networks of characters in a set of
  mythology texts (*Beowulf*, the *Iliad* and the *Táin Bó
  Cuailnge*). 

Both find that when you look at the network structure of (Western)
myths and legends you commonly see power-laws (in the node-degree
distribution). These networks have other features in common with
social networks, but the power-law is the feature I am focused on
today. 

Power-laws have also been noticed in the superhero world before. The
following two references look at the much larger Marvel universe (around 96,000
appearances of over 6,500 characters in about 13,000 comics).
  
+ <a href="https://arxiv.org/abs/cond-mat/0202174" target="_blank">"Marvel Universe looks almost like a real social network"</a>

+ <a href="https://iopscience.iop.org/article/10.1088/1742-5468/2007/09/P09020/meta" target="_blank">"How to become a superhero"</a>
  
They also observe (truncated) power laws in this larger dataset, so it
is not surprising that the MCU emulated it, but there is a deeper idea
in play here. 

It seems that human constructs (stories in particular) that survive
the test of time are complex enough to mimic the real world, for
instance mimicking features such power-law distributions. So it isn't
surprising (to me at least) to see some trace of this in the Marvel
universe, but it fails in the Bond world. We don't see even a trace of
a Pareto-like distribution.

That seems, to me, to be a big difference, and part of what sets the
MCU apart. 

# Fitting curves in Julia

Before finishing, it seems worth a brief note on fitting distributions
in Julia. 

Julia has a nice set of packages for working with probability
distributions and statistics. They mirror, in some respects, the
equivalent packages in R, the programming language of choice for many
statisticians these days. 

My code works by loading the files (see
[Marvel CSV](https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_movie_count.csv)
and
[Bond CSV](https://github.com/mroughan/AlephZeroHeroesData/blob/master/JamesBond/cast_movie_count.csv))
with the histogram data into a data frame, creating a new data frame
of log<sub>10</sub> of the data, and then fitting a linear
model to that data. The syntax for fitting the linear model, and the
approach (using a data frame) is very reminiscent of R, as is the
output.

```julia
julia> using CSV
julia> using DataFrames
julia> using StatsModels
julia> using GLM
julia> 
julia> mcu_hist = CSV.read("cast_movie_count.csv")
julia> mcu_data = DataFrame(X=log10.(mcu_hist[:N]), Y=log10.(mcu_hist[:F]))
julia> mcu_ols = lm(@formula(Y ~ X), mcu_data)
```

The function `lm` fits a *linear model* (it performs simple
least-squares regression) on the log-data. 
Its output is
```julia 
Formula: Y ~ 1 + X

Coefficients:
             Estimate Std.Error  t value Pr(>|t|)
(Intercept)   2.37665  0.126716  18.7557    <1e-7
X            -2.22627  0.175468 -12.6876    <1e-5

``` 
which tells us that the slope of the linear curve (which gives the
exponent in the power law) is -2.2, leading to a power law with
infinite variance, such as we commonly see in real social network
data.

Note, though, that in this work I am fitting to only a few points, so
we should take these results with a very big pinch of salt, except
that they reinforce the findings of the much larger data analyses
mentioned earlier. 

# Summary

So, that's the story for this week. The MCU has at least traces of a
hidden power-law built into its structure, and this is one of the
features that distinguishes it from the more staid and traditional
movie franchises. 

No-one is saying that the
peeps at Marvel sat down and worked this out. It happened (I think)
because they are trying to build something complex and human and
wonderful, and in doing so they naturally mimicked nature. 


---
 
## Footnotes:

  1. {{<raw>}} <div id="fn1" class="footnote">
  
    Here we use the term "named" character to mean a character that
    has a proper name, not just a job description or other place
    holder.
	
	We do so for two reasons, one philosophical and the other
	practical. 
	
	(i) At a practical level, placeholder 'names', e.g., "SHIELD
	Agent" are non-unique<sup><a href="#fn3" id="ref3">3</a></sup>,
	and so identifying these between movies is impossible.
	
	(ii) At a philosophical level, if a character is not important
	enough to the script to be given a name, they are not important
	enough for us to include in our analysis.
	
    Some cases are borderline however. For instance, we exclude
    characters named by reference "X's husband". However, we do allow
    a small number of particular 'unnamed' cases where a well-known
    role was not named in the credits, the most obvious cases being
    several of the Bond girls who were named thing like "Log Cabin
    Girl" (in *The Spy Who Loved Me*).
	
	<a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> 
	{{</raw>}}

2. {{<raw>}} <div id="fn2" class="footnote">
  
  It should be noted that the fit here is to only a few data points,
  and as such must be taken with a pinch of salt. Fits to power-law
  distributions, to be convincing, should cover more than 1 decade
  (we see here only 1). Moreover, the last few data points (e.g., the
  number of characters in 10 movies) do not fit the overall
  law. Ideally a larger data set is needed, but we are constrained
  here by the number of movies produced -- it will be interesting to
  see how this plot evolves. 
	  
	<a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> 
	{{</raw>}}

3. {{<raw>}} <div id="fn3" class="footnote">
  
	  Unfortunately even character names are not always unique. We
	  know of several instances in the Bond movies -- e.g.,  Patricia -- where the
	  same name is used for two different characters. A considerable
	  effort went into resolving names that appeared more than once,
	  checking that they really were the same character. We make no
	  guarantee that the effort was 100% successful though. If you
	  want to check, then the name/alias list for the movies are 
	  <a
	  href="https://github.com/mroughan/AlephZeroHeroesData/">here</a>
	  along with all of the other data. There are two files for each
	  movie `alias_list.csv`, which provides a list of aliases for
	  more important characters, and `extras.csv` which is a list of
	  minor characters that appear in only one movie. A small amount
	  of additional coding is needed to separate character names that
	  are not unique.
	  
	<a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
	{{</raw>}}
