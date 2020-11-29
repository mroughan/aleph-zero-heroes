--- 
title: "Rating the Discworld Books"
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-11-30
lastmod: 2020-11-30
description: "The best and worst of the Discworld novels and the problems with 5 star ratings systems"
categories: ["books"]
tags: ["Terry Pratchett", "Ratings", "Rankings", "Discworld"]
cover: "img/discworld_cyanotype_small.png" 
featuredImage: "img/discworld_cyanotype.png"
featuredImageDescription: ", The Colour of Magic Character Network"
dropCap: false
draft: false
toc: true
spoilers: false 
---

{{% blockquote author="Sir Terry Pratchett, Foreword to 2nd edition of Colour of Magic." %}} 
Since this is a reprint by popular demand -- gosh -- of the first book in
a series that will, eventually, contain at least ten, there’s a very
good chance that you already know what happens after this book, which
is more than I did when I wrote it. 
{{% /blockquote %}} 

# Intro

By now, I've had a couple of forays into rating and ranking:

+ ["Borda Beats Batman"](/posts/borda_beats_batman/) created a meta-list of the top-10 Batman graphic novels.
+ ["Top-10 Caped Crusader Creators"](/posts/caped_crusader/) looked at the best Batman writers.

Any rating or ranking system[^1] has problems -- it oversimplifies a
complex question. But as a society we do love a top-10 list.

I thought I would illustrate one of those problems here by comparing
my ratings with those from
[Goodreads](https://www.goodreads.com/). And I am on a Discworld
marathon at the moment, so I will try it out of the works of Sir Terry
Pratchett (STP). If you want, you can just skip to the
[results](/posts/pratchett_ratings/#results). 

# Meta-ratings, Borda counts and elections

I talked about forming meta-ratings from a set of rankings
[before](/posts/borda_beats_batman/). I like the approach because it
takes a step away from the idea of asking individuals to "rate"
items. It's much harder to get consistent ratings from people, than it
is to ask them "Do you prefer A to B?" That's why an optometrist
doesn't show you six lenses and ask you to rate them from 1-10,
she just asks you "Better or worse?"

If you take enough "Better or worse?" answers you can then create
your own rating. That's what I am doing. I am taking a bunch of peoples'
**ranked** lists, e.g., their top 10, and using these to create my own
meta-rating (and hence my own ranking as well). 

The process is a lot like an election. We seek to combine individual
preferences into a collective decision. 

Having just been through one of the most interesting elections in
living memory, i.e., Trump v Biden, this seems something worth
commenting on. A lot of people on both sides of the fence have
complained that the US system for electing the president is unfair. In
2016 the system elected Trump despite him losing the popular vote. In
2020 Biden won, but Trump is still calling foul.

It's worth saying again that any election system must have
flaws. There's math that proves it.  *Arrow's Impossibility Theorem*
shows that every possible election system can lead to a result that
someone can call unfair. Kenneth Arrow (1921-2017) proved in his
revolutionary theorem that a few simple properties that everyone could
agree would make an election fair can't co-exist together in a real
system.

Having said that, there have been centuries of effort devoted to
deriving better systems, and the one I am using here -- a modified
Borda count -- has a long precedent going back to a French
mathematician -- Jean-Charles, Chevalier de Borda -- from the 18th
century. My modification is described
[here](/posts/borda_beats_batman/).

Essentially, I take a set of ranked lists (in this case the 41
Pratchett Discworld novels), and a book ranked number 
{{< raw >}}\( n \){{< /raw >}} receives 
{{< raw >}}\( 1/n^\alpha \){{< /raw >}} points.
When we total the points we get a rating. When we sort the books in
ratings-order, we get a ranking.


# Data and Code

## Input Ranking Data

Our input data is a set of ranked lists of the 41 Pratchett Discworld
novels. Just as in the [Batman data](/posts/borda_beats_batman/) the
data isn't perfect:

+ most people don't rank all of the books;
+ the rankings are based on different peoples' (or groups') tastes;
+ some people only provide a "to read" list with no ranking;
+ the lists were published at different times, some before the latest
  novels were finished.

One of the great things about the modified Borda count is that it
deals with all of those issues.

The ranking data I have used is [here](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Pratchett/Ratings). Each file includes a
source. In total there are 11 inputs.  Note that Goodreads itself is
one of the sources, but that

1. it has no more precedence than any of the other rankings; and 
2. I only use the ranking data, not the actual scores. 

Each file includes a comment at the start giving its source URL, as
well as the year in which it was published.

The [Julia](https://julialang.org/) code to create the meta-ranking
from these is essentially the same as the
[code for Batman](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Code). It
isn't very profound code, but it does include all the other types of
meta-rating procedures I've talked about before. And I plan to add a
few more in the future. 

## Goodreads ratings

I want to compare my ratings to a "standard" and I don't know a better
one than Goodreads[^2]. The scores there are an average of in some
cases hundreds of thousands of users' scores. 

Goodreads kindly collects a
[list of all the Discworld books here](https://www.goodreads.com/series/40650-discworld). The
listing includes all of the discworld novels, plus a number of other
Discworld books such as *The Science of Discworld* and its sequels
(though I am just looking at the novels here).

The other great thing they do is provide an API to access their data
(for [non-commercial uses](https://www.goodreads.com/api/terms)). I
guess they were thinking of app developers when they created this, but
it's terrific for data scientists; so thanks hugely!!!

It's a godsend because scraping Goodreads web pages isn't easy -- they
are fairly complex. The API, on the other hand, is pretty simple. 

My Julia code starts from a
[list of the Discworld books](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Pratchett/Ratings/book_data.csv). Careful
with this file -- it has lots of comments in it, indicated by a
"#". Most good CSV readers (including `CSV.jl`) will allow you to
ignore these when reading the file.

The titles of the books are used to construct the Goodreads
query. However, the titles contain characters such as exclamation
marks, e.g., "Guards! Guards!" These are reserved for special meanings
in a URL so we have to replace them with an encoding, e.g., "!" goes
to "%21". You can find out more about this at
https://en.wikipedia.org/wiki/Percent-encoding or just try out this
Julia function. It's ugly. I should do this with an array and input
the data from an encoding file, but I wanted it to be stand alone and
for it to be blindingly clear how it works (and it doesn't have to be
fast). Not it assumes that the input hasn't been partially encoded
already or the first replacement may mess it up (in math terms the
function is not *idempotent*).
	  
```julia
function convert_to_url( s::AbstractString ) # convert reserved symbols into codes
    s = replace( s, "%" => "%25") # need to do this one first
    s = replace( s, "+" => "%2B") # need to do this one 2nd
    s = replace( s, " " => "+")
    s = replace( s, "!" => "%21")
    s = replace( s, "#" => "%23")
    s = replace( s, "\$" => "%24")
    s = replace( s, "&" => "%26")
    s = replace( s, "'" => "%27")
    s = replace( s, "(" => "%28")
    s = replace( s, ")" => "%29")
    s = replace( s, "*" => "%2A")
    s = replace( s, "," => "%2C")
    s = replace( s, "/" => "%2F")
    s = replace( s, ":" => "%3A")
    s = replace( s, ";" => "%3B")
    s = replace( s, "=" => "%3D")
    s = replace( s, "?" => "%3F")
    s = replace( s, "@" => "%40")
    s = replace( s, "[" => "%5B")
    s = replace( s, "]" => "%5D")
    return s
end
```

Once we have the titles converted to URL strings we construct the
query string using the following code. Note I separate it into two
steps: the base is the same for any of my queries, and the final URL
incorporates the specifics for a particular query:

```julia
url_base = "https://www.goodreads.com/book/title.xml?key=$(goodreads_key)"
url = "$(url_base)&author=$(author)&title=$(title)&format=xml"
```

Then we query Goodreads using the following code:
```julia
using HTTP
try
    global r = HTTP.get(url)
catch
    println("     $url failed.")
end
```
The response body `r.body` is XML, which I then parse (more on how to
do that in a future post). 

From the XML I extract everything I can, and it's all summarised in
[this file](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/Ratings/goodreads_summary.csv),
but for the moment I am only using the `Rating` field. The file
includes everything on the Goodreads list, not just the novels, but I am
only playing with them here. 

# Results

## Meta-ratings of the books

OK, you stuck with it for this long, so here are the results. First is
a list of my meta-ratings for each book. The following figure shows
the books with their ratings sorted from top to bottom. You might have
to resize your browser to see everything or if you mouse over a bar
you can see the actual results. The graph (created with the
[PlotlyJS](https://plotly.com/) package in Julia) can also be zoomed
if you want.

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 60;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "9950c71b-b015-40d0-9947-7bad981d410c")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': '-5vh'
    })
    .node();
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"range":[0.0,6.7],"title":"Score","autorange":false},"hovermode":"closest","paper_bgcolor":"rgba(0,0,0,0)","legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"margin":{"l":300,"b":55,"pad":4,"r":0,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":14},"tickfont":{"color":"rgb(0, 0, 0)","size":14},"title":""},"hoveron":"fills"},"frames":[],"data":[{"showlegend":false,"mode":"markers","x":[0.667023576398617,0.7066369390687983,0.8784213792976873,0.9689651057678028,1.047011104889752,1.0548263912482077,1.239163848376003,1.2619686273966775,1.2809287858434009,1.3177169471503043,1.3381206208329237,1.4178836825015082,1.6079817075938359,1.7343522463795547,1.7533898495229203,1.851352978156463,1.9205990220595446,1.9505983640855993,1.9644271210611408,1.9738701025950842,2.1090191444087543,2.112320251668289,2.1269227380275044,2.2365910953504375,2.2563772953727876,2.283898600815359,2.4002512372172475,2.403113646113362,2.471546312277249,2.816529443322,3.111294391008867,3.4396243180009285,3.4869606506815165,3.9063462808413294,4.117175362799208,4.155481482152582,4.32649250831556,4.494603002144201,4.766071570710673,5.935507766020464,6.3526445728007515],"y":["The Shepherd's Crown","Raising Steam","Snuff","I Shall Wear Midnight","Eric","Wintersmith","The Amazing Maurice and his Educated Rodents","Unseen Academicals","A Hat Full of Sky","The Last Hero","Sourcery","Making Money","The Last Continent","Moving Pictures","Soul Music","The Light Fantastic","The Wee Free Men","Pyramids","Equal Rites","Maskerade","Jingo","Thud!","Carpe Jugulum","Hogfather","The Fifth Elephant","Monstrous Regiment","Witches Abroad","Interesting Times","The Truth","The Colour of Magic","Feet of Clay","Lords and Ladies","Wyrd Sisters","Men at Arms","Mort","Reaper Man","Thief of Time","Going Postal","Guards! Guards!","Night Watch","Small Gods"],"type":"bar","name":"","hoverinfo":"x+text","text":["The Shepherd's Crown","Raising Steam","Snuff","I Shall Wear Midnight","Eric","Wintersmith","The Amazing Maurice and his Educated Rodents","Unseen Academicals","A Hat Full of Sky","The Last Hero","Sourcery","Making Money","The Last Continent","Moving Pictures","Soul Music","The Light Fantastic","The Wee Free Men","Pyramids","Equal Rites","Maskerade","Jingo","Thud!","Carpe Jugulum","Hogfather","The Fifth Elephant","Monstrous Regiment","Witches Abroad","Interesting Times","The Truth","The Colour of Magic","Feet of Clay","Lords and Ladies","Wyrd Sisters","Men at Arms","Mort","Reaper Man","Thief of Time","Going Postal","Guards! Guards!","Night Watch","Small Gods"],"orientation":"h","marker":{"color":"rgb(8, 48, 107)","symbol":"circle","size":9}}]};
  Plotly.newPlot(gd, plot_json);  
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();
  
</script>

<noscript>Your browser does not support JavaScript!</noscript> 

<br> 

You'll probably find you disagree with some of the details here -- I
did. But overall I was really pleased. And at the very least I can now
recommend, to friends who haven't read any Pratchett, where they might
like to start, i.e., with *Small Gods* rated at 6.35. *Small Gods* also has the
advantage that it is a stand-alone novel, not a sequel.

The lowest rating is *The Shepherd's Crown*. More on that later.

## Patterns

Once we have ratings we can start to look for patterns. STP wrote for
a LONG time -- for almost four decades (1983-2015) -- so we can look
at trends via the average ratings per decade.

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 60;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "9950c71b-b015-40d0-9947-7bad981d410c")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': '-5vh'
    })
    .node();
	
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickvals":[1980,1990,2000,2010,2020],"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":""},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"font":{"size":20},"bgcolor":"rgba(255, 255, 255, 0)","x":0.8},"barmode":"group","margin":{"l":100,"b":55,"pad":4,"r":0,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Rating"},"hovermode":"closest","bargroupgap":0.1},"frames":[],"data":[{"marker":{"color":"rgb(234, 153, 153)"},"x":[1985.0,1995.0,2005.0,2015.0],"hovertext":[1980,1990,2000,2010],"y":[2.786,2.663,2.394,0.805],"type":"bar","name":"Decade average","opacity":0.7,"width":9.0},{"x":[1983.0,1986.0,1987.0,1987.25,1988.0,1988.25,1989.0,1989.25,1990.0,1990.25,1991.0,1991.25,1992.0,1992.25,1993.0,1994.0,1994.25,1995.0,1996.0,1996.25,1997.0,1998.0,1998.25,1999.0,2000.0,2001.0,2001.25,2001.25,2002.0,2003.0,2003.25,2004.0,2004.25,2005.0,2006.0,2007.0,2009.0,2010.0,2011.0,2013.0,2015.0],"mode":"markers","hovertext":["The Colour of Magic","The Light Fantastic","Mort","Equal Rites","Wyrd Sisters","Sourcery","Guards! Guards!","Pyramids","Moving Pictures","Eric","Reaper Man","Witches Abroad","Small Gods","Lords and Ladies","Men at Arms","Interesting Times","Soul Music","Maskerade","Feet of Clay","Hogfather","Jingo","Carpe Jugulum","The Last Continent","The Fifth Elephant","The Truth","Thief of Time","The Last Hero","The Amazing Maurice and his Educated Rodents","Night Watch","Monstrous Regiment","The Wee Free Men","Going Postal","A Hat Full of Sky","Thud!","Wintersmith","Making Money","Unseen Academicals","I Shall Wear Midnight","Snuff","Raising Steam","The Shepherd's Crown"],"y":[2.816529443322,1.851352978156463,4.117175362799208,1.9644271210611408,3.4869606506815165,1.3381206208329237,4.766071570710673,1.9505983640855993,1.7343522463795547,1.047011104889752,4.155481482152582,2.4002512372172475,6.3526445728007515,3.4396243180009285,3.9063462808413294,2.403113646113362,1.7533898495229203,1.9738701025950842,3.111294391008867,2.2365910953504375,2.1090191444087543,2.1269227380275044,1.6079817075938359,2.2563772953727876,2.471546312277249,4.32649250831556,1.3177169471503043,1.239163848376003,5.935507766020464,2.283898600815359,1.9205990220595446,4.494603002144201,1.2809287858434009,2.112320251668289,1.0548263912482077,1.4178836825015082,1.2619686273966775,0.9689651057678028,0.8784213792976873,0.7066369390687983,0.667023576398617],"type":"scatter","name":"Individual ratings","opacity":0.7,"marker":{"color":"darkred","opacity":0.9,"size":12}}]};
  Plotly.newPlot(gd, plot_json);  
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();
  
</script>

<noscript>Your browser does not support JavaScript!</noscript> 

<br> 



The trend shows some features most fans won't find surprising. He
always had his hits and "misses" (even the misses weren't bad), but
his standard overall was notably consistent over the first three
decades, the 80s, 90s and 00s.

But in the final decade the ratings decline. Sadly STP contracted a
rare form of
[Alzheimer's (posterior cortical atrophy) in 2007](https://www.theguardian.com/books/2015/mar/15/a-butt-of-my-own-jokes-terry-pratchett-on-the-disease-that-finally-claimed-him). Although
he was still amazingly productive, and a wonderful writer, it must
have been much harder for him particularly during the years near his
death in 2015.

We can look at other patterns as well. The Discworld books are loosely
grouped into
[subseries](https://en.wikipedia.org/wiki/Discworld#/media/File:Discworld_Reading_Order_Guide_3.0_(cropped).jpg). My
[book_data.csv](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Pratchett/Ratings/book_data.csv)
file also lists the subseries for each book, so we can also plot these
averages. Again there aren't too many surprises here: the series based
around Death, the Watch, and the Witches are often cited as his best.

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 60;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "9950c71b-b015-40d0-9947-7bad981d410c")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': '-5vh'
    })
    .node();
	
  var plot_json = {"layout":{"xaxis":{"tickangle":-30,"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":""},"paper_bgcolor":"rgba(0,0,0,0)","bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"font":{"size":20},"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":{"l":130,"b":130,"pad":4,"r":0,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Average Rating"},"bargroupgap":0.1},"frames":[],"data":[{"x":["Ancient Civilisations","Death","City Watch","Witches","Industrial Revolution","Rincewind","One-off","Wizards","Tiffany Aching"],"hovertext":["Ancient Civilisations","Death","City Watch","Witches","Industrial Revolution","Rincewind","One-off","Wizards","Tiffany Aching"],"y":[4.152,3.318,3.134,2.565,2.273,1.769,1.762,1.498,1.178],"type":"bar","name":"DS 1","opacity":0.7,"marker":{"color":{"color":"orange","opacity":0.5}}}]};	
  Plotly.newPlot(gd, plot_json);  
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();
  
</script>

<noscript>Your browser does not support JavaScript!</noscript> 

<br> 

We might get a minor surprise by how well the *Ancient Civilisations*
subseries does here, but there are only two books in this group,
and *Small Gods*, the highest rated book, is one of them so we can see
that as a small sample effect. 

The one surprise for me was that the Tiffany Aching books rate
poorly. I liked this series. The problem, I think, is that 3 of 5 of
these books are from STP's last decade. And as I commented earlier,
this was an era when writing was more of a challenge for him.

## Comparing our ratings with Goodreads

Finally, I want to do the comparison that I started out thinking
about: my meta-ratings compared to Goodreads. The following plot shows
each book on the two scales. Mouse over them to see the titles.

<script>
    gd = (function() {
  var WIDTH_IN_PERCENT_OF_PARENT = 100;
  var HEIGHT_IN_PERCENT_OF_PARENT = 60;
  var gd = Plotly.d3.select('article')
    .append('div').attr("id", "9950c71b-b015-40d0-9947-7bad981d410c")
    .style({
      width: WIDTH_IN_PERCENT_OF_PARENT + '%',
      'margin-left': (100 - WIDTH_IN_PERCENT_OF_PARENT) / 2 + '%',
      height: HEIGHT_IN_PERCENT_OF_PARENT + 'vh',
      'margin-top': '-5vh'
    })
    .node();
	
  var plot_json = {"layout":{"xaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Goodread's rating"},"paper_bgcolor":"rgba(0,0,0,0)","hovermode":"closest","height":500,"yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"My rating"},"plot_bgcolor":"rgba(0,0,0,0)","bargroupgap":0.1,"bargap":0.15,"legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"font":{"size":20},"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"barmode":"group","margin":{"l":100,"b":55,"pad":4,"r":50,"t":30}},"frames":[],"data":[{"x":[3.99,3.97,4.22,4.02,4.12,3.89,4.31,3.9,3.93,3.75,4.26,4.21,4.3,4.16,4.36,4.14,4.02,4.07,4.27,4.58,4.15,4.13,3.98,4.25,4.24,4.23,4.18,4.02,4.5,4.19,4.26,4.37,4.28,4.33,4.21,4.22,3.97,4.31,4.14,3.99,4.36],"mode":"markers","hovertext":["The Colour of Magic","The Light Fantastic","Mort","Equal Rites","Wyrd Sisters","Sourcery","Guards! Guards!","Pyramids","Moving Pictures","Eric","Reaper Man","Witches Abroad","Small Gods","Lords and Ladies","Men at Arms","Interesting Times","Soul Music","Maskerade","Feet of Clay","Hogfather","Jingo","Carpe Jugulum","The Last Continent","The Fifth Elephant","The Truth","Thief of Time","The Last Hero","The Amazing Maurice and his Educated Rodents","Night Watch","Monstrous Regiment","The Wee Free Men","Going Postal","A Hat Full of Sky","Thud!","Wintersmith","Making Money","Unseen Academicals","I Shall Wear Midnight","Snuff","Raising Steam","The Shepherd's Crown"],"y":[2.816529443322,1.851352978156463,4.117175362799208,1.9644271210611408,3.4869606506815165,1.3381206208329237,4.766071570710673,1.9505983640855993,1.7343522463795547,1.047011104889752,4.155481482152582,2.4002512372172475,6.3526445728007515,3.4396243180009285,3.9063462808413294,2.403113646113362,1.7533898495229203,1.9738701025950842,3.111294391008867,2.2365910953504375,2.1090191444087543,2.1269227380275044,1.6079817075938359,2.2563772953727876,2.471546312277249,4.32649250831556,1.3177169471503043,1.239163848376003,5.935507766020464,2.283898600815359,1.9205990220595446,4.494603002144201,1.2809287858434009,2.112320251668289,1.0548263912482077,1.4178836825015082,1.2619686273966775,0.9689651057678028,0.8784213792976873,0.7066369390687983,0.667023576398617],"type":"scatter","name":"DS 1","opacity":0.9,"marker":{"color":"darkred","opacity":0.9,"size":12}}]};
  Plotly.newPlot(gd, plot_json);  
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();
</script>

<noscript>Your browser does not support JavaScript!</noscript> 

If the two approaches to rating were fundamentally the same[^3], we
would expect to see a diagonal line. We don't. There are quite a few
books that sit near that theoretical line (roughly from *Eric* up to
*Night Watch*), but there are also a few clusters that don't.

That fact lies at the heart of why I think Goodreads (and all ratings
systems like them) are flawed. Goodreads relies on its participants
voting with common standards, but we don't have such a thing. Your
five stars might be my three. And there are systematic problems in
star systems: inflation, expectation, subjectivity, etc., etc.

We can see this most clearly with the *The Shepherd's Crown*. This was
STP's last book. It was published after his death. His long-time
assistant Rob Wilkins stated publicly in the afterword:

{{% blockquote  author="Rob Wilkins, afterword of *The Shepherd's Crown*" %}} 
*The Shepherd's Crown* has a beginning, a middle, and an end, and all
the bits in between. Terry wrote all of those. But even so, it was,
still, not quite as finished as he would have liked when he died. 
{{% /blockquote %}} 

I haven't read it and I won't for a while for reasons I outlined
[here](/posts/pratchett_discworld/). People I trust have told me it
definitely isn't his best novel, and that isn't surprising. He didn't
get a chance to polish it, and I guess that shows us how important is
the old adage "write easy, edit hard."

So my meta-rating of 0.67 at the bottom of the list of all the ratings
seems reasonable, but on Goodreads the book is scored at a strong
4.36.  How come?

It's as simple as this. Readers love STP. I know I do[^4]. Almost
everyone who read *The Shepherd's Crown* knew where it came from. They
knew the story about his illness. And many of them rated the book not
based on its quality as a book, but on their feelings about STP. They
gave it a nostalgia rating. Many of them said so explicitly. Here are
just a few quotes from the reviewers:

{{% blockquote  author="Goodreads review, 4 stars" %}} 
If you are new to Discworld or Terry, don't start with this one. He
was very ill and this was, I think it's safe to say, not written well,
but by Jingo it was told well. 
{{% /blockquote %}} 


{{% blockquote  author="Goodreads review, 5 stars" %}} 
This is really a four-star book but I am giving it five anyway because
it was his last and because he was a wonderful author who gave me an
incredible amount of enjoyment over the years. 
{{% /blockquote %}} 


{{% blockquote  author="Goodreads review, 5 stars" %}} 
Ignore the star rating. Like many other people reading the last book
of a deeply loved and missed author, objectivity is impossible. 
{{% /blockquote %}} 


{{% blockquote  author="Goodreads review, 5 stars" %}} 
This really isn't a five star book, but I can't bring myself to give
Terry Pratchett's final Discworld novel anything but five stars.  
{{% /blockquote %}} 

{{% blockquote author="Goodreads review, 4 stars" %}} It feels wrong
to give this a star rating, because my response to it – like that of
all Pratchett's regular readers – is far more nuanced and conflicted
than that. In terms of actual quality, it's no higher than a three,
but the emotional response it elicited from me deserves a five.  {{%
/blockquote %}}

I totally support everyone who did this. I probably would do so
myself. But there's the rub. If people rate based on their own
criteria (be it nostalgia or any other feature) rather than purely on
quality, then this is one (just one) indication that these types of
scores aren't a rational foundation upon which we can build useful
meta-ratings.

Another example of ratings not actually rating the thing you want is
*Hogfather*. This gets a very strong 4.58 in Goodreads, but only 2.23
in my meta-rating. My guess about this one comes down to the
[TV mini-series](https://www.imdb.com/title/tt0765458/). Personally,
that series was so good it overwrote my memory of the book. It has
some of my favourite actors: Marc Warren, Tony Robinson, Ian
Richardson and Nigel Planer, and they put together a wonderful
movie. Pratchett himself has a cameo. I can't say this for sure, but
it seems very likely that often we rate a book more highly if we
enjoyed it on the screen.

What do you do instead? Well, I just showed you. Get users to provide
rankings not ratings. A ranking is a more robust, more consistent way
to get user input. 

At its simplest, just ask "Better or worse?"  Don't ask readers to
give a number, just ask them, for instance, "Was this book better or
worse than *Equal Rites*?" Ask enough questions like that, and we can
build a much more accurate picture of which Discworld books people
really liked.

# Conclusion

This didn't happen when I wrote the last post about STP, but reading
the comments people wrote about him left me close to tears (again). I
don't weep, or cry or otherwise strongly emote as a general rule. But
some things are just bad. The loss of STP is one of them. He is
sorely missed.

Apart from that, the point I am leading up to (or maybe ran past in
the mist) is that I don't believe the methodology behind most modern
ratings is valid or useful. They assume too much about people that
just isn't true. We use ratings more and more. Every web page[^5],
every online service, every ride share company, and every online
social network lets you give stars, or likes, or some indication of
value.  Even universities now ask students to rate their teachers on a
regular basis.  But they are (almost) all meant to be an absolute
score, and none are. If we swapped to relative metrics we would get
much more informative results.

# Links

# Acknowledgements

A quick thanks again to Goodreads for making their data accessible. 

Just a quiet thanks to the people who have been helping me edit these
blogs, notably my wife. 

---
 
**Footnotes**

[^1]: Formally a *ranking* is just an ordering of a set of items,
      whereas a *rating* is a numerical score assigned to each
      item. Often they are confused because a ranking can be thought
      of as a score (e.g., from 1-10) and a rating automatically
      implies a ranking. But there are subtle differences, notably, a
      ranking has no absolute scale (1 is better than 2, but when
      comparing two lists we have no information about whether the two
      1's are comparable. Also, a ranking conveys nothing about how
      close two participants are, they could be neck and neck or miles
      apart. 

[^2]: I didn't say Goodreads' ratings were good. It's often assumed
      that with so many inputs the output must be valid, but I think
      there are some problems with such scores. The problems in that
      type of rating system are one of the topics here. But at least
      this one is better than any other I am aware of. 

[^3]: Goodreads rates from 1-5 and my ratings aren't bounded, so they
      will never be identical, but one could be related to the other by a
      simple linear transform, in which case they are essentially
      identical except for "units". 

[^4]: You know what I mean. Don't get weird about this. 

[^5]: But not this one.
