--- 
title: "Best Batman Books (or Borda Beats Batman)"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-08-22
lastmod: 2020-01-07 17:30:27
description: "Arrow’s Impossibility Theorem; Borda counts; the Condorcet paradox and
a Meta-list of the Top-10 Batman Graphic Novels ever."
categories: ["comics"]
tags: ["Batman", "DC", "Ranking"]
cover: "img/batman_eq_ed.svg" 
featuredImage: "img/batman_eq_ed.svg" 
featuredImageDescription: "Batman equation"
dropCap: false
draft: false
toc: true
spoilers: false 
---

{{% blockquote author="Grant Morrison, Supergods: What Masked Vigilantes, Miraculous Mutants, and a Sun God from Smallville Can Teach Us About Being Human " %}} 
These characters were like twelve-bar blues ... Given the basic parameters of Batman, different creators could play very different music.
{{% /blockquote %}}

# Intro
 
I have been delinquent on two counts (if not more):

1. So far I have looked almost entirely at Marvel, and left DC on the
floor, and
2. I haven't been keeping up my Batman reading.

I thought I should catch up on both counts, starting by checking out
some top-10 lists to work out what Batman story to read next. But they don't
seem to agree. What do you do when you have a set of contradictory
rankings?

It turns out there is an entire theory about that, wrapped up in the
theory of elections. I've used those ideas to compile a meta-top-10
list (*meta* is used here because this is a list formed from other
lists, much as a meta-analysis in statistics combines the results of
multiple individual studies to provide a pooled estimate). My
meta-list is given in [Table 1](#table1).

<div class="ui large right floated image" id="table1">
{{% csv_table src="/static/csv/batman_final_top_10.csv" 
       caption="Table 1: Meta-Top-10 list" colStyle="text-align:right;" %}} 
</div> 

There is much more in what follows that explains where this comes from
-- it isn't just my opinion being expressed here! This list is
synthesized from the lists of 30 other people or groups, and the full list
of graphic novels being ranked includes nearly 100 titles that
appeared on someone's top-N list at some time. It's kind of crazy that
there is so much variation in people's choices, and yet we can still
find patterns.

The techniques that are used in compiling a meta-list are interesting 
because they touch on a strange paradox that lies at the conjunction
of Mathematics and the theory of Elections. It's usually discussed
under the name *Arrow's Impossibility Theorem* after its creator.

# Arrow's Impossibility Theorem

People care deeply that elections should be fair, but it has often
been noticed that no matter how fair we try to make a system of
voting, sometimes weird things happen. For instance, it is often noted
that a winning candidate has lost the "popular" vote. That is, they
would have lost if a simple majority election was held. It is often
thought that "if only we had a different, better system, we could
avoid such tragic outcomes." 

Kenneth Arrow (1921-2017) showed that this was an impossible dream. He
won the Nobel  Prize in Economics (with John Hicks) in 1972 for his
work.  

Elections have been studied mathematically for nearly a thousand
years. The topic is named variously "social choice theory" or
"election theory". The idea (in an election) is to understand how
individual preferences can be converted to an overall ranking, which
is exactly what I want to do today. 

Unfortunately, Arrow showed that there is no perfect system. His
theorem is reminiscent of the quip: 

> faster, cheaper, better -- pick two.

Arrow started by describing a set of (mathematical) properties that
we want our voting/ranking system to have. Arrow had a set of four
properties, each of which seemed obviously desirable<sup><a href="#fn1"
id="ref1">1</a></sup>. Arrow showed that you couldn't have all of these
properties at once in **any** system.

That's a *very* powerful result. It says that every election system
can have results that seem unfair to someone. It also means there is
no unique system for calculating ranks that everyone can agree on. So
I am going to try four different systems, starting with one of the
most common: a Borda count.

# Borda and Friends


### System 1: Borda

A "Borda" count is a great example of
[Stigler's law of eponymy](https://en.wikipedia.org/wiki/List_of_examples_of_Stigler%27s_law),
which states that 

> No scientific discovery is named after its original discoverer. 

Jean-Charles, Chevalier de Borda (1733-1799) was a French
mathematician who suggested his eponymous method as a means to elect
members to the French Academy, but
[Ramon Llull](https://en.wikipedia.org/wiki/Ramon_Llull) (1232–1315),
a Catalan monk, wrote about the method (and others) around 500 years
earlier<sup><a href="#fn2" id="ref2">2</a></sup>.  Unfortunately,
Borda's name has been used for a long time, and so we are stuck with
it.

The idea of a Borda count is to award points for your rank in any
given list. The standard method awards points corresponding to the
number of other candidates you beat, for instance see
[Table 2](#table2). In an election we only care about who comes
first, and so the person with the top Borda count would win. However,
here we use the scores to determine a new meta-ranking.

Simple Borda counts won't work here. The simple version assumes a
fixed list of candidates, and that every voter lists them all in
descending order. However, the Batman ranking lists 

+ vary in length (e.g., top-5 or top-25); 
+ don't consider the same list of candidate graphic novels; and 
+ some are just a "to read" list, which is unordered. 

<div class="ui large right floated image" id="table2">
{{% csv_table src="/static/csv/borda_example.csv" 
	caption="Table 2: Example scoring from ranks. The scores are the points that the candidate gets for its relative place in this ranking."  colStyle="text-align:right;" %}} 
</div> 


My Borda count has been adapted to these conditions by 

+ presuming that all rankings are selecting from the larger list, and
that unranked candidates are at the bottom (see [Table 2](#table2)); and
+ where a "to read" list has N candidates, we assume they are all
equal Nth on the list. We could have made them equal 1st, but this
really over-weights some candidates by a lot.

### System 2: Dowdall

There are many modifications of the Borda count, often using an
alternative scoring. The Dowdall system (that is reputedly in use in
elections in Nauru) awards {{< raw >}}\( 1/n \){{< /raw >}} points to
the {{< raw >}}\( n \){{< /raw >}}th ranked candidate.  The Dowdall
system has an advantage over Borda for our application. In typical
elections there are only a few candidates, but many voters. Here, I
have a relatively large number of candidate graphic novels (nearly
100) and only 30 input rankings. In this setting the Borda count
doesn't provide very good discrimination between 1st and 2nd place on
a list. It's the difference between say 100 and 99 points. Of course,
the points add up, but the Dowdall system places a higher value on
coming 1st compared to 2nd.
 
### System 3: Power (weighted Dowdall)

You might suspect (I do) that the Dowdall system places *too much*
weight on 1st place. In an election, voters often have a very strong
preference for their top vote but my read of a lot of the top-N graphic
novel rankings is that their authors are less dogmatic about the exact
order. Giving such a strong weight to 1st place might be a little
optimistic. That leads to the next system, my own power-weighted
Dowdall system.
 
A "power" weighting gives 
{{< raw >}}\( 1/n^\alpha \){{< /raw >}} 
points for 
{{< raw >}}\( n \){{< /raw >}} th
place, where 
{{< raw >}}\( \alpha \){{< /raw >}} 
is between 0 and 1. When 
{{< raw >}}\( \alpha = 1 \){{< /raw >}} 
we get the Dowdall
system, but we can tune how much weight 1st place gets by choosing a
smaller value. I
tried a few 
and
eventually settled on the simple choice of 
{{< raw >}}\( \alpha = 1/2\){{< /raw >}}.

[Table 2](#table2) shows the points awarded by the different scoring systems
for a ranked list of candidates. 

### System 4: Condorcet/Copeland

There are an almost infinite number of other election/ranking
systems. I found a really nice table comparing them
[here](https://en.wikipedia.org/wiki/Comparison_of_electoral_systems). I
wanted to do a few more comparisons, but I couldn't spend the time to
implement all of these, so I chose one more. I selected a method that
is both simple and a
[Condorcet method](https://en.wikipedia.org/wiki/Condorcet_method) --
such methods guarantee that if a candidate would win the majority of
the time in any head-to-head comparison, then it would win the
election.  Incidentally Condorcet is another Stiglerism: Llull wrote
about the idea of so-called Condorcet methods first as well.

There are many Condorcet methods: I am using
[Copeland's method](https://www.jstor.org/stable/25054952) because all
I need to do is count the number of head-to-head wins minus losses for
each pair. That's simple, conceptually and computationally.

You might ask "If you have a Condorcet method why try anything else?
Surely that is the best?" I refer you back to Arrow's Theorem from which
we know there must be some downside. Condorcet's problem is
called the
[Condorcet paradox](https://en.wikipedia.org/wiki/Condorcet_paradox). It
was discovered by the Marquis de Condorcet in the late 18th century,
but it was independently discovered by Lewis Caroll, the writer of
*Alice in Wonderland*<sup><a href="#fn3"
id="ref3">3</a></sup>. Condorcet and Carroll (nee Dodgson) noted that
voters' preferences can be cyclic, and hence there may be no Condorcet
winner. I plan to say more on cyclic systems at a later date, so hang
on for that...

There are some other issues. The Copeland system, and others similar
to it calculate a preference matrix comparing each pair of
candidates. For an election with {{< raw >}}\( N \){{< /raw >}}
candidates, this is an  {{< raw >}}\( O(N^2) \){{< /raw >}} data
structure. 
The amount of raw information you have
is {{< raw >}}\( O(R N) \){{< /raw >}} for {{< raw >}}\( R \){{< /raw >}} input rankings (or voters). 

For a typical election the number of voters {{< raw >}}\( R > N \){{< /raw >}} so the
amount of information is large compared to the number of estimates you
need to make.

However, here, {{< raw >}}\( R \){{< /raw >}} is small (30) and
{{< raw >}}\( N \){{< /raw >}} is larger (and potentially much larger
-- imagine we wanted the best graphic novels overall) and so we have
more unknowns than data points. That worries me. There is the danger
of over-fitting to limited data. I'm not saying it can't work, but
let's be wary. 

# Data and Julia Code

I don't want to spend forever talking about data and data cleaning
this time around, but a few words are needed.

First, I chose the lists I am using by the simple expedient of
Googling. I looked for top-N lists, and only included those that were
composed specifically for Batman over a notionally unlimited time
range<sup><a href="#fn4" id="ref4">4</a></sup>. I excluded lists
arising in comments on other lists, i.e., I only went for the list in
a main article. I gave up after adding 30 lists (read: I got tired of
entering data).

[Listal](https://www.listal.com/list/25-greatest-batman-graphic-novels)
says they started their list (in 2005) with a list of more than 150
titles, just looking at graphic novels (collections and trade
paperbacks included). I didn't try to be so comprehensive. I only
ranked those that appeared somewhere in the input rankings. That still
gave me a list of nearly 100 graphic novels to work with.

The input lists and their sources are given in a set of files called
"ranking_NN.csv" hosted at my
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data/InputRankings) (look at the
comments for the sources). The code is set up to make it fairly easy
to add an extra ranking, so I am very open to suggestions. 

However, the original data wasn't particularly easy to work with:

- Names of comics are not given in standard forms
- Some items in the lists are not a "graphic novel" as such, but
  rather a series of comics. I have only included series that have a
  collected form, or one-shot novels.
- Sometimes, there are multiple formats for one storyline, and
  different lists reference different versions.

Consequently, I had to do some manual cleaning of the data to make it
consistent. As noted, my final lists, and their origin are given in
the files. 

Some lists don't rank, they just provide a "to read" list. In those
cases the ranking data is missing, but scoring systems I'm using
can cope with that. 

Finally, the lists were all compiled by different organisations using
different criteria for different purposes at different times. I'm sure
some are trying to sell product, and some are pushing personal views.
They may not have had access to the same Batman corpus.  The goal of a
meta-list is to overcome these issues through the aggregation of many
sources.

BTW, the lists had a lot of overlaps, but many, particularly the
longer lists had personal favs that didn't appear elsewhere. The list
of all comics considered is in
[comic_list.csv](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/comic_list.csv)
along with some meta-data. 

<!-- <div id="myDiv">  <\!-- Plotly chart will be drawn inside this DIV -\-></div>  -->

<!-- <script type="text/javascript" src="img/plot_scores.js"></script> -->

I haven't explained all of the details, but
[Julia](https://julialang.org/) code for Borda and other counts is
included on the
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Code). It
isn't very interesting code (yet) so no direct discussion seems
warranted. It is included so you can try this stuff yourself.

# Results

My top-10 meta-list is given above. A more complete view is given in
the following figure. The figure shows the ratings that each graphic
novel from four different scoring techniques (note that scores are all
normalised onto the range 0-1 so that we can compare them).  Here
"Power" denotes the method I proposed with {{< raw >}}\( \alpha =
0.5\){{< /raw >}}.

You should be able to mouse over the points to get the names and
zooming should work. You should also be able to click on legend<sup><a href="#fn5" id="ref5">5</a></sup>elements to hide them, or double-click to focus on them.  The lines
are there to help track the performance of the top-10 listed above,
and highlight the differences between the scoring methods.
 
<!-- https://www.w3schools.com/cssref/css_units.asp -->
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
  var plot_json = {"layout":{"xaxis":{"showticklabels":false,"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickvals":[1,2,3,4],"tickfont":{"color":"rgb(0, 0, 0)","size":18},"range":[0.7,4.4],"ticktext":["A","","",""],"autotick":false,"autorange":false},"hovermode":"closest","paper_bgcolor":"rgba(0,0,0,0)","legend":{"bordercolor":"rgba(255, 255, 255, 0)","y":1.0,"bgcolor":"rgba(255, 255, 255, 0)","x":1.0},"margin":{"l":50,"b":50,"r":50,"t":60},"plot_bgcolor":"rgba(0,0,0,0)","yaxis":{"titlefont":{"color":"rgb(0, 0, 0)","size":18},"tickfont":{"color":"rgb(0, 0, 0)","size":18},"title":"Normalised Score"},"hoveron":"fills"},"data":[{"marker":{"size":0},"mode":"line","y":[0.9356514788169464,1.0,1.0,1.0],"type":"scatter","name":"1: The Dark Knight Returns","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[1.0,0.949341701742373,0.9984539559790191,0.9869281045751634],"type":"scatter","name":"2: Year One","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.9192645883293366,0.5873074081405929,0.7656270217194818,0.9607843137254902],"type":"scatter","name":"3: The Long Halloween","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.8533173461231015,0.6308856602291794,0.7617512040709598,0.9738562091503268],"type":"scatter","name":"4: The Killing Joke","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.7693844924060751,0.3840684357587226,0.5753333164239743,0.9477124183006536],"type":"scatter","name":"5: Arkham Asylum","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.6003197442046363,0.188700808823609,0.36946248780848345,0.934640522875817],"type":"scatter","name":"6: Hush","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.5055955235811351,0.1780601863420555,0.3234168607593094,0.9215686274509803],"type":"scatter","name":"7: A Death in the Family","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.42246203037569946,0.18866450660512663,0.2836821265081052,0.8954248366013072],"type":"scatter","name":"8: The Court of Owls","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.4216626698641087,0.1162436487821131,0.24368907361065922,0.8954248366013072],"type":"scatter","name":"9: Knightfall, Part One: Broken Bat","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"marker":{"size":0},"mode":"line","y":[0.4172661870503597,0.1194759613537231,0.24300028610653399,0.8823529411764706],"type":"scatter","name":"10: The Black Mirror","opacity":0.7,"hoverinfo":"none","x":[1,2,3,4]},{"showlegend":false,"mode":"markers","x":[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0],"y":[0.9356514788169464,1.0,0.9192645883293366,0.8533173461231015,0.7693844924060751,0.6003197442046363,0.5055955235811351,0.42246203037569946,0.4216626698641087,0.4172661870503597,0.40927258193445243,0.28497202238209435,0.29136690647482016,0.27577937649880097,0.2697841726618705,0.18585131894484413,0.20503597122302158,0.17785771382893686,0.19944044764188648,0.1706634692246203,0.15267785771382894,0.16786570743405277,0.1123101518784972,0.14268585131894485,0.1574740207833733,0.1334932054356515,0.13309352517985612,0.13629096722621903,0.12949640287769784,0.0815347721822542,0.01958433253397282,0.10711430855315747,0.08473221422861711,0.10431654676258993,0.1003197442046363,0.08233413269384493,0.07314148681055156,0.07913669064748201,0.0903277378097522,0.07793764988009592,0.019184652278177457,0.050359712230215826,0.03677058353317346,0.060751398880895285,0.03597122302158273,0.0451638689048761,0.01838529176658673,0.04436450839328537,0.043565147881694646,0.04316546762589928,0.04276578737010392,0.017585931254996003,0.01718625099920064,0.016786570743405275,0.02997601918465228,0.016386890487609912,0.016386890487609912,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.01598721023181455,0.015587529976019185,0.015587529976019185,0.015587529976019185,0.015587529976019185,0.015587529976019185,0.015587529976019185,0.015187849720223821,0.014788169464428458,0.014388489208633094,0.014388489208633094,0.013189448441247002,0.012789768185451638,0.012390087929656275,0.011990407673860911,0.011590727418065548,0.01079136690647482,0.01079136690647482,0.01079136690647482,0.01079136690647482,0.010391686650679457,0.010391686650679457,0.009992006394884092,0.009992006394884092,0.009592326139088728,0.006794564348521183,0.005595523581135092,0.005195843325339729,0.004396482813749001,0.0],"type":"scatter","name":"Borda","hoverinfo":"y+text","text":["The Dark Knight Returns","Year One","The Long Halloween","The Killing Joke","Arkham Asylum","Hush","A Death in the Family","The Court of Owls","Knightfall, Part One: Broken Bat","The Black Mirror","The Man Who Laughs","The Cult","Dark Victory","Batman Black and White","Gotham by Gaslight","Whatever Happened to the Caped Crusader?","Year 100","Birth of the Demon","Strange Apparitions","Red Rain","Death of the Family","JLA: Tower of Babel","Under the [Red] Hood","The Last Arkham","Gothic","Batman Reborn","Earth One Vol. 1","A Lonely Place of Dying","Batman and the Monster Men","Tales of the Demon","Second Chances","Mad Love","Gotham Central Vol. 1: In the Line of Duty","No Man's Land","Prey","Blind Justice","Son of the Demon","Haunted Knight","Venom","R.I.P.","Face the Face","The Greatest Joker Stories Ever Told","The Batman Chronicles Vol. 1","Thrillkiller","The Untold Legend of the Batman","Batman and Son","Cataclysm","Night of the Owls","The Eye of the Beholder","All Star Batman and Robin, the Boy Wonder","Ego","Zero Year","Batman By Azzarello And Risso","Requiem for Damian","Nine Lives","Joker","The Flash: Flashpoint","Robin: Year One","The Greatest Batman Stories Ever Told","Gotham Central Vol. 2: Jokers and Madmen","Endgame","Injustice: Gods Among Us: Year One: Volume 2","Noël","Bruce Wayne: Murderer?","Bruce Wayne: Fugitive","Detective Comics, Volume 5: Gothtopia","Heart of Hush","Batman 75th Anniversary Box Set","Injustice: Gods Among Us: Year One: Volume 1","Batwoman: Elegy","Batman Eternal, Vol. 1","Earth One Vol. 2","Justice League Origin","All Star Ends Of The Earth","The War of Jokes and Riddles","Scarecrow Tales","JLA: Rock Of Ages","Dark Nights: Metal","All Star The First Ally","Injustice: Gods Among Us: Year Three: Volume 1","The Batman in Nine Lives","Legends of the Dark Knight: Shaman","War Games","Justice League VS Suicide Squad","Vengeance Of Bane","Flashpoint: Batman - Knight of Vengeance","KnightsEnd","The Dark Knight Strikes Again","Lovers and Madmen","Knightquest: The Crusade","Gotham County Line","Snow","Absolution","Knightfall, Part Two: Who Rules The Night"],"marker":{"color":"rgb(8, 48, 107)","symbol":"circle","size":9}},{"showlegend":false,"mode":"markers","x":[2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0],"y":[1.0,0.949341701742373,0.5873074081405929,0.6308856602291794,0.3840684357587226,0.188700808823609,0.1780601863420555,0.18866450660512663,0.1162436487821131,0.1194759613537231,0.0924773396926443,0.1409457003450083,0.08305507424666388,0.05698981218429895,0.05246779698791035,0.04779599082244283,0.03884181478512682,0.04190586837929144,0.033974422239534445,0.0413356619225323,0.04481660487800495,0.03244139812875757,0.03750044622139721,0.027862064041694928,0.021883549067261948,0.024891880044237123,0.02190999556928401,0.02124702753921895,0.023332916860029272,0.04492650968441344,0.0734658908363974,0.017317717207054304,0.02352154681430375,0.015670612260165608,0.013646441929738974,0.01837783107193738,0.01742987748169553,0.015080087911819402,0.0107753002123473,0.014262608843696198,0.03598329347088852,0.014326681659705616,0.015055509941812734,0.0069373936851578055,0.012524797160502013,0.009404724429891318,0.017241994788134082,0.007320130779617027,0.006830162186603839,0.006905884605524059,0.00639176923496046,0.010994895227215936,0.00921000963838218,0.007871345446756864,0.0031651971108651936,0.006830162186603839,0.006830162186603839,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00599721557848142,0.00531571380819944,0.00531571380819944,0.00531571380819944,0.00531571380819944,0.00531571380819944,0.00531571380819944,0.00474779566629779,0.004267249546227164,0.0038553528718809123,0.0038553528718809123,0.002910413442498336,0.0026654291459917417,0.0024462326701700523,0.0022489558419305326,0.0020704672830471568,0.0017600523980325906,0.0017600523980325906,0.0017600523980325906,0.0017600523980325906,0.0016242458858387178,0.0016242458858387178,0.001499303894620355,0.001499303894620355,0.0013839728258034048,0.0007723686729862435,0.0005830626256856934,0.0005267824494612059,0.0004228805856621513,0.0],"type":"scatter","name":"Dowdall","hoverinfo":"y+text","text":["The Dark Knight Returns","Year One","The Long Halloween","The Killing Joke","Arkham Asylum","Hush","A Death in the Family","The Court of Owls","Knightfall, Part One: Broken Bat","The Black Mirror","The Man Who Laughs","The Cult","Dark Victory","Batman Black and White","Gotham by Gaslight","Whatever Happened to the Caped Crusader?","Year 100","Birth of the Demon","Strange Apparitions","Red Rain","Death of the Family","JLA: Tower of Babel","Under the [Red] Hood","The Last Arkham","Gothic","Batman Reborn","Earth One Vol. 1","A Lonely Place of Dying","Batman and the Monster Men","Tales of the Demon","Second Chances","Mad Love","Gotham Central Vol. 1: In the Line of Duty","No Man's Land","Prey","Blind Justice","Son of the Demon","Haunted Knight","Venom","R.I.P.","Face the Face","The Greatest Joker Stories Ever Told","The Batman Chronicles Vol. 1","Thrillkiller","The Untold Legend of the Batman","Batman and Son","Cataclysm","Night of the Owls","The Eye of the Beholder","All Star Batman and Robin, the Boy Wonder","Ego","Zero Year","Batman By Azzarello And Risso","Requiem for Damian","Nine Lives","Joker","The Flash: Flashpoint","Robin: Year One","The Greatest Batman Stories Ever Told","Gotham Central Vol. 2: Jokers and Madmen","Endgame","Injustice: Gods Among Us: Year One: Volume 2","Noël","Bruce Wayne: Murderer?","Bruce Wayne: Fugitive","Detective Comics, Volume 5: Gothtopia","Heart of Hush","Batman 75th Anniversary Box Set","Injustice: Gods Among Us: Year One: Volume 1","Batwoman: Elegy","Batman Eternal, Vol. 1","Earth One Vol. 2","Justice League Origin","All Star Ends Of The Earth","The War of Jokes and Riddles","Scarecrow Tales","JLA: Rock Of Ages","Dark Nights: Metal","All Star The First Ally","Injustice: Gods Among Us: Year Three: Volume 1","The Batman in Nine Lives","Legends of the Dark Knight: Shaman","War Games","Justice League VS Suicide Squad","Vengeance Of Bane","Flashpoint: Batman - Knight of Vengeance","KnightsEnd","The Dark Knight Strikes Again","Lovers and Madmen","Knightquest: The Crusade","Gotham County Line","Snow","Absolution","Knightfall, Part Two: Who Rules The Night"],"marker":{"symbol":"cross","size":9}},{"showlegend":false,"mode":"markers","x":[3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0,3.0],"y":[1.0,0.9984539559790191,0.7656270217194818,0.7617512040709598,0.5753333164239743,0.36946248780848345,0.3234168607593094,0.2836821265081052,0.24368907361065922,0.24300028610653399,0.2165811380882035,0.1977788663706862,0.17137706054777324,0.1409046323534592,0.13441304919397773,0.1037886047432377,0.10078628371737988,0.09524880781500408,0.09373674370889362,0.09341007715137059,0.08966839155340575,0.08367195977735749,0.07063281971661285,0.07046989308839934,0.06904045340553563,0.06584049228328254,0.06173407991250753,0.061478919579922596,0.06142743012081485,0.06016178404852399,0.049039799271823406,0.048798592458418506,0.04879439904065407,0.04615591061896379,0.042896825591234956,0.04285385809733859,0.03926478231862821,0.038262210639490264,0.03759681765529085,0.03702412304398413,0.0323104935022986,0.0290236324713176,0.025710254407482185,0.024755790460820475,0.023400098582698693,0.02216196701366301,0.020481087948124376,0.019628396228927522,0.018847787876340852,0.018847507162014315,0.018129647491321087,0.015240466775927542,0.013510733174994453,0.012116435063361972,0.011860423803182833,0.010961517506891366,0.010961517506891366,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009984491588851582,0.009143927525658745,0.009143927525658745,0.009143927525658745,0.009143927525658745,0.009143927525658745,0.009143927525658745,0.008410756294871799,0.007763899399620874,0.007187649936005789,0.007187649936005789,0.005775386426676437,0.005385082250383102,0.005026012057873218,0.004694220598342154,0.004386420090258044,0.0038321825401978478,0.0038321825401978478,0.0038321825401978478,0.0038321825401978478,0.003581421700176446,0.003581421700176446,0.0033458611539049616,0.0033458611539049616,0.003124024803087241,0.0018652436731152933,0.0014419470656583586,0.0013124230651496698,0.0010684840630580726,0.0],"type":"scatter","name":"$alpha=0.5$","hoverinfo":"y+text","text":["The Dark Knight Returns","Year One","The Long Halloween","The Killing Joke","Arkham Asylum","Hush","A Death in the Family","The Court of Owls","Knightfall, Part One: Broken Bat","The Black Mirror","The Man Who Laughs","The Cult","Dark Victory","Batman Black and White","Gotham by Gaslight","Whatever Happened to the Caped Crusader?","Year 100","Birth of the Demon","Strange Apparitions","Red Rain","Death of the Family","JLA: Tower of Babel","Under the [Red] Hood","The Last Arkham","Gothic","Batman Reborn","Earth One Vol. 1","A Lonely Place of Dying","Batman and the Monster Men","Tales of the Demon","Second Chances","Mad Love","Gotham Central Vol. 1: In the Line of Duty","No Man's Land","Prey","Blind Justice","Son of the Demon","Haunted Knight","Venom","R.I.P.","Face the Face","The Greatest Joker Stories Ever Told","The Batman Chronicles Vol. 1","Thrillkiller","The Untold Legend of the Batman","Batman and Son","Cataclysm","Night of the Owls","The Eye of the Beholder","All Star Batman and Robin, the Boy Wonder","Ego","Zero Year","Batman By Azzarello And Risso","Requiem for Damian","Nine Lives","Joker","The Flash: Flashpoint","Robin: Year One","The Greatest Batman Stories Ever Told","Gotham Central Vol. 2: Jokers and Madmen","Endgame","Injustice: Gods Among Us: Year One: Volume 2","Noël","Bruce Wayne: Murderer?","Bruce Wayne: Fugitive","Detective Comics, Volume 5: Gothtopia","Heart of Hush","Batman 75th Anniversary Box Set","Injustice: Gods Among Us: Year One: Volume 1","Batwoman: Elegy","Batman Eternal, Vol. 1","Earth One Vol. 2","Justice League Origin","All Star Ends Of The Earth","The War of Jokes and Riddles","Scarecrow Tales","JLA: Rock Of Ages","Dark Nights: Metal","All Star The First Ally","Injustice: Gods Among Us: Year Three: Volume 1","The Batman in Nine Lives","Legends of the Dark Knight: Shaman","War Games","Justice League VS Suicide Squad","Vengeance Of Bane","Flashpoint: Batman - Knight of Vengeance","KnightsEnd","The Dark Knight Strikes Again","Lovers and Madmen","Knightquest: The Crusade","Gotham County Line","Snow","Absolution","Knightfall, Part Two: Who Rules The Night"],"marker":{"symbol":"rect","size":9}},{"showlegend":false,"mode":"markers","x":[4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0,4.0],"y":[1.0,0.9869281045751634,0.9607843137254902,0.9738562091503268,0.9477124183006536,0.934640522875817,0.9215686274509803,0.8954248366013072,0.8954248366013072,0.8823529411764706,0.8627450980392157,0.8627450980392157,0.8562091503267973,0.8235294117647058,0.8169934640522876,0.7777777777777778,0.7843137254901961,0.7450980392156863,0.7647058823529411,0.7647058823529411,0.738562091503268,0.7450980392156863,0.6013071895424836,0.6078431372549019,0.6993464052287581,0.6601307189542484,0.6470588235294118,0.6666666666666666,0.6535947712418301,0.5359477124183006,0.08496732026143791,0.6601307189542484,0.5359477124183006,0.5424836601307189,0.6078431372549019,0.6143790849673203,0.5751633986928104,0.5816993464052288,0.5555555555555556,0.5751633986928104,0.0718954248366013,0.42483660130718953,0.35947712418300654,0.49673202614379086,0.3464052287581699,0.43790849673202614,0.058823529411764705,0.4444444444444444,0.43137254901960786,0.45751633986928103,0.41830065359477125,0.0915032679738562,0.0718954248366013,0.0718954248366013,0.37254901960784315,0.0718954248366013,0.1437908496732026,0.0718954248366013,0.0718954248366013,0.0718954248366013,0.0784313725490196,0.13071895424836602,0.0718954248366013,0.0718954248366013,0.0718954248366013,0.06535947712418301,0.1568627450980392,0.0718954248366013,0.11764705882352941,0.0718954248366013,0.0718954248366013,0.05228758169934641,0.10457516339869281,0.0915032679738562,0.0784313725490196,0.13725490196078433,0.0784313725490196,0.06535947712418301,0.05228758169934641,0.0392156862745098,0.0718954248366013,0.0718954248366013,0.0718954248366013,0.026143790849673203,0.013071895424836602,0.06535947712418301,0.0,0.11764705882352941,0.10457516339869281,0.0915032679738562,0.0784313725490196,0.06535947712418301,0.05228758169934641,0.0196078431372549],"type":"scatter","name":"Copeland","hoverinfo":"y+text","text":["The Dark Knight Returns","Year One","The Long Halloween","The Killing Joke","Arkham Asylum","Hush","A Death in the Family","The Court of Owls","Knightfall, Part One: Broken Bat","The Black Mirror","The Man Who Laughs","The Cult","Dark Victory","Batman Black and White","Gotham by Gaslight","Whatever Happened to the Caped Crusader?","Year 100","Birth of the Demon","Strange Apparitions","Red Rain","Death of the Family","JLA: Tower of Babel","Under the [Red] Hood","The Last Arkham","Gothic","Batman Reborn","Earth One Vol. 1","A Lonely Place of Dying","Batman and the Monster Men","Tales of the Demon","Second Chances","Mad Love","Gotham Central Vol. 1: In the Line of Duty","No Man's Land","Prey","Blind Justice","Son of the Demon","Haunted Knight","Venom","R.I.P.","Face the Face","The Greatest Joker Stories Ever Told","The Batman Chronicles Vol. 1","Thrillkiller","The Untold Legend of the Batman","Batman and Son","Cataclysm","Night of the Owls","The Eye of the Beholder","All Star Batman and Robin, the Boy Wonder","Ego","Zero Year","Batman By Azzarello And Risso","Requiem for Damian","Nine Lives","Joker","The Flash: Flashpoint","Robin: Year One","The Greatest Batman Stories Ever Told","Gotham Central Vol. 2: Jokers and Madmen","Endgame","Injustice: Gods Among Us: Year One: Volume 2","Noël","Bruce Wayne: Murderer?","Bruce Wayne: Fugitive","Detective Comics, Volume 5: Gothtopia","Heart of Hush","Batman 75th Anniversary Box Set","Injustice: Gods Among Us: Year One: Volume 1","Batwoman: Elegy","Batman Eternal, Vol. 1","Earth One Vol. 2","Justice League Origin","All Star Ends Of The Earth","The War of Jokes and Riddles","Scarecrow Tales","JLA: Rock Of Ages","Dark Nights: Metal","All Star The First Ally","Injustice: Gods Among Us: Year Three: Volume 1","The Batman in Nine Lives","Legends of the Dark Knight: Shaman","War Games","Justice League VS Suicide Squad","Vengeance Of Bane","Flashpoint: Batman - Knight of Vengeance","KnightsEnd","The Dark Knight Strikes Again","Lovers and Madmen","Knightquest: The Crusade","Gotham County Line","Snow","Absolution","Knightfall, Part Two: Who Rules The Night"],"marker":{"symbol":"diamond","size":9}},{"showlegend":false,"mode":"text","textfont":{"color":"black","size":20},"textposition":"bottom center","y":[-0.02,-0.02,-0.02,-0.02],"type":"scatter","hoverinfo":"none","text":["Borda","Dowdall","Power","Copeland"],"x":[1,2,3,4]}]};
  var data = plot_json.data;
  var layout = plot_json.layout;
  Plotly.newPlot(gd, data, layout);
  window.onresize = function() {
    Plotly.Plots.resize(gd);
  };
  return gd;
})();

 </script>

<noscript>Your browser does not support JavaScript!</noscript> 

<br> 

With one exception the scoring methods all chose the same top-10 (the
Dowdall system includes *Batman: The Cult* in preference to *Broken
Bat*<sup><a href="#fn5" id="ref5">5</a></sup>). However, they don't
agree on the ordering. For instance: the positions of 

+ *Year One* and *The Dark Knight Returns*, and
+ *The Long Halloween* and *The Killing Joke*

are reversed by some systems. 

The plot helps understand some of the issues that make each system
good or bad. For instance: 

+ The Dowdall system gives a **lot** of weight to coming first in some
  ranking, and that tends to have an extreme effect. One outcome is
  that the top-10 take up most of the scoring range and all the others
  are compressed into a narrow range at the bottom. That is fine when
  all you want to do is elect the best candidate, but not so good for
  ranking them all.

  <!-- Some clustering down the bottom end makes sense, after all most of -->
  <!-- these have only one mention in any list, so there isn't as much data -->
  <!-- for them as there is up the top. But Dowdall is pushing the limits.  -->
  
+ On the other hand, the Copeland scores don't separate well in any
  part of the range. That gives me less confidence in their
  robustness to noise in the small (relative to a typical election)
  set of input rankings.

The best seems to be either the simple Borda count or my Power-weighted
score. Of course, I prefer my Power-based score. It makes the
closeness of the two top pairs much more obvious.  Your mileage may
vary, probably depending on whether you regard *Year One* or *The Dark
Knight Returns* as the best ever.

# Conclusion

My final list was given [above](#table1).  

You probably disagree with it.  Most of the input lists aren't
consistent, so I don't expect everyone to agree on any given list.

But at the very least there are a top-2:

- *Year One*
- *The Dark Knight Returns*

and then a *next* top-2:

- *The Long Halloween*
- *The Killing Joke*

All the systems of ranking make these pairings and their relative rank
pretty clear. 

Then *Arkham Asylum* is cemented in 5th place.

After that there is a group of 5 that almost all rankings suggest
should fill out the 10, though the ordering varies. 

- *Hush* 
- *A Death in the Family*
- *Knightfall*
- *The Court of Owls*
- *The Black Mirror*

Finally, there are the others, and these I think we can all agree are
great, but they don't get universal support from a wide set of
rankings. If you want to see how they fare in detail, I have a [table](#table3)
below that lists the top-20, and also links to the scores for the full
list.

Who was the best author/illustrator/...? That's a question for next 
time. For the moment I have my reading list, starting with *The Long
Halloween*. 


# Acknowledgements

Thanks go out to Jono Tuke and Giang Nguyen for editing this one.

# Resources

[Julia](https://julialang.org/) code for Borda and other counts is
included on the
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Code). 

My final scoring for the complete list of graphic novels can be
obtained by clicking on the table below. The table lists only the top
20, but the data file has the complete list of nearly 100.

<div id="table3">
{{% csv_table src="/static/csv/batman_meta_ranking.csv" maxLines="20" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_meta_ranking.csv" colStyle="text-align:right;" %}}
</div> 

The ranked lists used as input are in my
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data/InputRankings).
Note that they are CSV files, but with a comment line at the start
indicated by a # (which is used to list the source of each list). I've found
that a lot of CSV readers can easily filter out such lines, so I use
them to provide a little meta-data. 

My overall list of comics, with some more meta-data about each is in the
file
[comic_list.csv](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/comic_list.csv). This
is a work in progress, and I plan to complete and check all of the
data as I need it.

---
 
**Footnotes**


  1. {{<raw>}} <div id="fn1" class="footnote">
  
	  I won't go into the exact properties here. There is a vast
	  amount written about them, and they have been generalised in
	  many ways. Google the theorem and you can find any number of
	  descriptions. 
  
	<a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> 
	{{</raw>}}


  2. {{<raw>}} <div id="fn2" class="footnote">
   
	   The origins of various methods are traced in <a
	   href="https://link.springer.com/article/10.1007/BF01560577" target="_blank"></em>The
	   borda and condorcet principles: Three medieval
	   applications</em>, I. McLean, Social Choice and Welfare April
	   1990, Volume 7, Issue 2, pp 99–108</a>
   
	<a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> 
	{{</raw>}}


  3. {{<raw>}} <div id="fn3" class="footnote">
   
	   Incidentally, there is a cool little network analysis of Alice
	   in <a
	   href="http://www.cs.columbia.edu/~apoorv/Homepage/Publications.html"
	    target="_blank">Apoorv
	   Agarwal, Augusto Corvalan, Jacob Jensen and Owen Rambow,
	   <em>Social Network Analysis of Alice In Wonderland</em>, In the
	   proceedings of Workshop on Computational Linguistics for
	   Literature, NAACL 2012</a>.
  
	<a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
	{{</raw>}}


  4. {{<raw>}} <div id="fn4" class="footnote">
  	  	
		The time ranges are notionally unlimited, but most have a
		upper cut-off imposed by when the list was compiled (the
		meta-data on each list's source includes this date). More
		subtle is the fact that the lists are limited by the corpus of
		comics available to current readers -- many older comics may
		be out of print or otherwise unavailable and are thus
		censored. 
	
	<a href="#ref4" title="Jump back to footnote 4 in the text.">↩</a></div> 
	{{</raw>}}


  5. {{<raw>}} <div id="fn5" class="footnote">

		In the plot and the text I will use abbreviated names for
		Batman graphic novels. The abbreviations should be obvious,
		but the full dataset has the canonical names if needed. 
		
	    On a related note, occasionally the rankings use an ambiguous
	    name which could refer to more than one graphic novel or
	    collection. In those cases I make the best determination I can.
	
	<a href="#ref5" title="Jump back to footnote 5 in the text.">↩</a></div> 
	{{</raw>}}
