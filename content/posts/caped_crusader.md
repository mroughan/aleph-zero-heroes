--- 
title: "Top-10 Caped Crusader Creators"
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-01-09
lastmod: 2020-01-09 15:21:08
description: "Borda counts, Batman, and and a Meta-list of the Top-10 Creators ever."
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

<!-- “If I have to have a past, then I prefer it to be multiple choice.” -->
<!-- ― Alan Moore, Batman: The Killing Joke -->

<!-- It's not movies and it's not "fine art." The beauty of a comic is that it's clear, direct communication. My work is getting simpler and more cartoony because I'm much more interested in communication now than in any illustrative value. -->
<!-- -- Frank Miller -->

{{% blockquote author="Frank Miller" %}} 
You do Batman right, and he's going to be popular. He's a great character. I was once asked by somebody if writing 'Batman' was like holding a Ming vase or something. And I said, 'No, it's like holding a big-ass diamond that you can't break. You can throw him against the ceiling, against the floor, anywhere, and you just can't break Batman.'{{% /blockquote %}}
 
# Intro

Not so long ago I put together
[a meta top-10 list of the best Batman graphic novels](/posts/borda_beats_batman/).
I needed a reading list. I've done my reading now. It was great! But
the technique I used to create the list is useful for a lot more than just
creating a best novels list. I can also adapt it to look into
favourite Batman creators.

Batman was
[created](https://dc.fandom.com/wiki/Detective_Comics_Vol_1_27) by
writer Bill Finger and artist Bob Kane in 1939[^1], back in the
earliest days of superhero comics (the Phantom predates this by only 6 
years -- here's a
[history](https://blog.retroplanet.com/superhero-comic-book-history/)
if you are interested). Obviously these two creators should take pride
of place, but only the dedicated fans are reading back that far these
days, and their work didn't rate that highly in my earlier [meta-list](/posts/borda_beats_batman/). So
which artists and writers do fans of today really like?

We can answer that using the same approach as before: create a
meta-top-10 from other peoples' top-N lists using a Borda count. Just
in case you want to stop here, the lists are in [Table 1](#table1).


<div id="table1">
{{% csv_table src="/static/csv/batman_meta_ranking_creators.csv"
        maxLines="20"
        link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_meta_ranking_creators.csv"
        caption="Table 1: Meta-Top-10 Batman creators list" 
		colStyle="text-align:right;" %}}
</div> 


The number in brackets gives the total score for each creator. If you
want to learn more about how these lists and the scores they are based
on were derived, and what they mean, read on.
 

# Borda Counts

I discussed Borda counts, Arrow's Impossibility Theorem, and Condorcet
in a [previous post](/posts/borda_beats_batman/). A quick recap is
worthwhile though. I know how hard it is to click back on that link.

Jean-Charles, Chevalier de Borda (1733-1799) was a French
mathematician who suggested his eponymous method as a means to elect
members to the French Academy. The idea of a Borda count is that each
voter writes a list of candidates ranked in their order of preference,
and then points are awarded to each candidate based on their position in
each list. The standard method awards points corresponding to the
number of other candidates you beat, for instance see
[Table 2](#table2). In an election we only care about who comes first,
and so the person with the top Borda count would win. However, here we
use the scores to determine a new meta-ranking.
 
Simple Borda counts won't work here. The simple version assumes a
fixed list of candidates, and that every voter lists them all in
descending order. However, the rank lists I have here:

+ vary in length (e.g., top-5 or top-25); 
+ don't consider the same list of candidate graphic novels; and 
+ some are just "to read" lists, which are unordered. 

<div class="ui large right floated image" id="table2">
{{% csv_table src="/static/csv/borda_example.csv" 
	caption="Table 2: Example scoring from ranks. The scores are the points that the candidate gets for their relative place in this ranking."  colStyle="text-align:right;" %}} 
</div> 

My Borda count has been adapted to these conditions by:

+ presuming that all rankings are selecting from the larger list, and
that unranked candidates are at the bottom (see [Table 2](#table2)); and
+ where a "to read" list has N candidates, we assume they are all
equal Nth on the list. We could have made them equal 1st, but this
really over-weights some candidates by a lot.
+ I have adjusted my weighting: Borda doesn't differentiate enough between first and second place. I found in the last post that a power weighting seems to have a good balance between not enough weighting on first place, and too much (as in the Dowdall system). 
 
A "power" weighting gives 
{{< raw >}}\( 1/n^\alpha \){{< /raw >}} 
points for 
{{< raw >}}\( n \){{< /raw >}} th
place, where 
{{< raw >}}\( \alpha \){{< /raw >}} 
is between 0 and 1. When 
{{< raw >}}\( \alpha = 1 \){{< /raw >}} 
we get the Dowdall system, but we can tune how much weight 1st place gets by choosing a
smaller value. I tried a few  and eventually settled on the simple choice of 
{{< raw >}}\( \alpha = 1/2\){{< /raw >}}.

[Table 2](#table2) shows the points awarded by the different scoring systems
for a ranked list of candidates. 

There are an almost infinite number of other election/ranking
systems. I found a really nice table comparing them
[here](https://en.wikipedia.org/wiki/Comparison_of_electoral_systems). None
are perfect (see Arrow’s Impossibility Theorem) but the approaches
above have an advantage over many other systems: they can be used
to rank other aspects of the items being ranked. All we need do is
accumulate the points under whatever heading is relevant. If we want
to rank writers, we assign each author points based on the rankings of
the novels they authored. 

# Comic Creation and Data

Comics are usually created by a team. Sometimes just a pair: e.g., Bill
Finger and Bob Kane for the original Batman, but these days
there are usually more people involved. The standard breakdown is to
have seperate artists for pencils, inks, colouring and
lettering. A [nice description of these roles is here](https://bookriot.com/2014/11/06/adventures-of-a-comic-book-newbie-talk-to-me-about-writingpencilsinkscolorsletters/), but simply
speaking there are five stages:

+ **Script:** a writer produces the dialogue and some "stage
  direction" about what will happen in the panels. It's called the
  script. 
+ **Pencils:** a sketch of the panel structure and artwork is produced
  by the penciler, following the directions in the script, but
  interpreting it.
+ **Inks:** the inker adds sharp lines, texture and shading, again
  adding a layer of intepretation to the pencils, which essentially go
  away after this stage.  
+ **Colors:** a colorist turns the black and white inks into color
  drawings, choosing the palette and shadings. This can have a big
  impact on mood: making the scene gloomy or jaunty.
+ **Letters:** the letterer places and fills the dialogue balloons,
  choosing fonts and ordering to make the sequence clear.

There are other people involved (flatters, editors, cover artists) but
the list above is those primarily responsible for creating the
content.  And sometimes a single artist does multiple steps.

Naively, the ordering above lists the creators in order of creative
contribution, with the writer having the largest creative input and so
on. But it would be unfair to think that artists further down the
chain are not making important creative decisions; even the
letterer. Inking is not simply tracing over pencilled lines, and
placement of word balloons can have important implications.  And often
the relationship between artists isn't a simple one of
producer/consumer. *Arkham Asylum: A Serious House on Serious Earth*
was written by Grant Morrison but later editions (the 15th and 25th
anniversary editions) include the script he wrote with his
comments. It's extremely interesting to see how Morrison's script was
adapted  by Dave McKean. The style of lettering (by Saladino) is
important as well.

Comic creative credit hasn't always been clear: older comics didn't
always credit all of the participants listed above. And there isn't
always a clear boundary between words and art. Different organisations
have expected different levels of detail at each stage.  At the least,
a writer must think pictorially, and an artist is fleshing out a story
with their pictures. But what I can work with is the official credit
that is given for each graphic novel. The list I have compiled for
Batman is
[here](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data/batman_creators.csv)
with the first few entries shown below in [Table 3](#table3).
 
<div class="ui large" id="table3">
{{% csv_table src="/static/csv/batman_creators.csv"  
	maxLines="5"
    link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_creators.csv"
    caption="Table 3: Batman creators" colStyle="text-align:right;" %}} 
</div>   
 
The list wasn't trivial to obtain -- I couldn't find a single source
of truth for all of this data, and the more complete sources often had
inconsistent page structure making screen scraping tricky. So the list
was built manually. The sources for each entry are included in the
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data).

Many graphic novels have multiple creators for each type of
input. Sometimes they worked together on a single issue, but remember
that many of these were originally published as serials[^2], and often
different creators worked on each issue. So multiple cover artists may
have contributed to a single cover, or each created a single issue
cover. Even a single issue can have multiple variant covers, each with
different artists.  Where the team gets too large I have not included it
here, but I am including groups in my listing, e.g., see Pencils for
*Batman: A Death in the Family*.

The other data I am using -- people's rankings -- are described in the
[previous post](/posts/borda_beats_batman/).


# Results

My meta-top-10 lists are given above, but a more complete view is given
below.  [Table 4](#table4) shows the meta-top-10 creator lists for
each type of creator. In this version, if you hover the mouse over a
particular artist you can see which graphic novels 
contributed to the scores[^3]. That's important because we can see, for instance,
that Dave McKean is number 5 in Pencils, Cover, Inks and Colors, but
they are all because of one novel: *Arkham Asylum*. We can also see
that some creators get their status because of a single novel (e.g.,
Alan Moore) whereas others are involved in many (e.g., John Costanza
as a Letterer). The table is only the top-10, but more complete lists
for each type of creator are included at [GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data).


<div class="ui" id="table4"><table>
  <caption>Table 4: Meta-Top-10 creator lists and scores with
  contributing novels.</caption>
  <tr>
     <th> Script  </th>
     <th> Pencils  </th>
     <th> Cover  </th>
     <th> Inks  </th>
     <th> Colors  </th>
     <th> Letters  </th>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li><li>Batman: The Dark Knight Returns</li><li>All Star Batman and Robin, the Boy Wonder</li></ul></span> Frank Miller (35.74) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Dark Knight Returns</li><li>Batman: The Dark Knight Strikes Again</li></ul></span> Frank Miller (17.85) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Dark Knight Returns</li><li>Batman: Gothic</li></ul></span> Klaus Janson (19.0) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Dark Knight Returns</li><li>Batman: Gothic</li></ul></span> Klaus Janson (19.0) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Dark Knight Returns</li><li>Batman: The Dark Knight Strikes Again</li></ul></span> Lynn Varley (17.85) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li><li>Batman: Hush</li><li>Batman: The Long Halloween</li><li>Batman: Dark Victory</li></ul></span> Richard Starkings (36.78) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Hush</li><li>Batman: The Long Halloween</li><li>Batman: Dark Victory</li><li>Batman: Haunted Knight</li></ul></span> Jeph Loeb (24.11) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li></ul></span> David Mazzucchelli (17.62) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li></ul></span> David Mazzucchelli (17.62) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li></ul></span> David Mazzucchelli (17.62) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li><li>Batman: Legends of the Dark Knight: Shaman</li></ul></span> Richmond Lewis (17.83) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li><li>Batman: The Dark Knight Returns</li><li>Batman: Son of the Demon</li><li>Batman: Legends of the Dark Knight: Shaman</li><li>Batman: A Lonely Place of Dying</li><li>Batman: The Cult</li><li>Batman: Gothic</li><li>Batman: Prey</li></ul></span> John Costanza (31.56) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li><li>Batman and Son</li><li>Batman and Robin: Batman Reborn</li><li>JLA: Rock Of Ages</li><li>Batman: R.I.P.</li><li>Batman: Gothic</li></ul></span> Grant Morrison (14.41) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Long Halloween</li><li>Batman: Dark Victory</li><li>Batman: Haunted Knight</li></ul></span> Tim Sale (17.5) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Long Halloween</li><li>Batman: Dark Victory</li></ul></span> Tim Sale (16.69) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Long Halloween</li><li>Batman: Dark Victory</li><li>Batman: Haunted Knight</li></ul></span> Tim Sale (17.5) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Long Halloween</li><li>Batman: Haunted Knight</li></ul></span> Gregory Wright (14.36) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year One</li><li>Batman: The Last Arkham</li><li>Batman: Haunted Knight</li><li>Batman: The Dark Knight Strikes Again</li><li>Batman: Noël</li><li>Batman: Blind Justice</li><li>Batman & Dracula: Red Rain</li><li>Batwoman: Elegy</li></ul></span> Todd Klein (23.44) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li></ul></span> Alan Moore (13.48) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li></ul></span> Brian Bolland (13.48) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li></ul></span> Brian Bolland (13.48) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li></ul></span> Brian Bolland (13.48) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Killing Joke</li></ul></span> John Higgins (13.48) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li></ul></span> Gaspar Saladino (10.21) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li><li>Batman: The Black Mirror</li><li>Batman: Endgame</li><li>All Star Batman Vol. 3: The First Ally</li><li>All Star Batman Vol. 2: Ends Of The Earth</li><li>Dark Nights: Metal</li></ul></span> Scott Snyder (10.54) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li></ul></span> Dave McKean (10.21) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li></ul></span> Dave McKean (10.21) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li></ul></span> Dave McKean (10.21) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Arkham Asylum</li></ul></span> Dave McKean (10.21) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman and the Monster Men</li><li>Batman: Earth One Vol. 1</li><li>Batman: Earth One Vol. 2</li><li>Justice League VS Suicide Squad</li><li>Batman: The Man Who Laughs</li></ul></span> Rob Leigh (6.87) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li><li>Batman: The Cult</li></ul></span> Jim Starlin (9.41) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Hush</li><li>All Star Batman and Robin, the Boy Wonder</li><li>Justice League Origin</li></ul></span> Jim Lee (7.36) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Hush</li></ul></span> Jim Lee (6.61) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Hush</li><li>All Star Batman and Robin, the Boy Wonder</li></ul></span> Scott Williams (7.08) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Hush</li><li>Batman and Robin: Batman Reborn</li><li>All Star Batman and Robin, the Boy Wonder</li></ul></span> Alex Sinclair (8.38) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li></ul></span> Richard Starkings/Jimmy Betancourt/Comicraft (5.11) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Man Who Laughs</li></ul></span> Ed Brubaker (3.93) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li></ul></span> Jim Aparo/Mike Mignola/Mike DeCarlo (5.8) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li></ul></span> Jim Aparo (5.8) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li></ul></span> Jim Aparo/Mike Mignola (5.8) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: A Death in the Family</li></ul></span> Adrienne Roy/Anthony Tollin (5.8) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Black Mirror</li></ul></span> Todd Klein/Jared K. Fletcher/Sal Cipriano (4.4) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Birth of the Demon</li><li>Batman: Legends of the Dark Knight: Shaman</li><li>Batman: Venom</li></ul></span> Dennis O'Neil (2.82) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li><li>Batman: Endgame</li><li>Dark Nights: Metal</li></ul></span> Greg Capullo (5.65) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li><li>Batman: Night of the Owls</li></ul></span> Greg Capullo (5.59) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li></ul></span> Greg Capullo/Jonathan Glapion (5.11) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman Volume 1: The Court of Owls</li><li>Batman: Endgame</li><li>Dark Nights: Metal</li></ul></span> FCO Plascencia (5.65) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Gotham by Gaslight</li></ul></span> John Workman (2.5) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman & Dracula: Red Rain</li><li>Batman: Prey</li></ul></span> Doug Moench (2.82) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Black Mirror</li></ul></span> Jock/Francesco Francavilla (4.4) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Knightfall, Part One: Broken Bat</li></ul></span> Kelley Jones/Bob LeRose/Sam Kieth (4.62) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Black Mirror</li></ul></span> Jock/Francesco Francavilla (4.4) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Black Mirror</li></ul></span> David Baron/Francesco Francavilla (4.4) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: Year 100</li></ul></span> Jared K. Fletcher/John Workman (1.91) </div> </td>
  </tr>
  <tr>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Gotham by Gaslight</li></ul></span> Brian Augustyn (2.5) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Man Who Laughs</li></ul></span> Tim Sale/Doug Mahnke/Patrick Zircher (3.93) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Black Mirror</li></ul></span> Jock/Francesco Francavilla (4.4) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Cult</li></ul></span> Bernie Wrightson (3.6) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>Batman: The Man Who Laughs</li></ul></span> David Baron (3.93) </div> </td>
     <td style="min-width: 8em;"> <div class="tooltip"> <span class="tooltiptext" style="min-width: 8em;"><ul> <li>JLA: Rock Of Ages</li><li>JLA: Tower of Babel</li></ul></span> Ken Lopez (1.84) </div> </td>
  </tr>
</table></div>


[Table 5](#table5) shows the same information, but mixing all
of the contributors into one ranking. The table only has the top 20 -- the
complete list can be obtained by clicking on the table. Or if you want
to see the ranking without grouping different types of contributor
look
[here](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_meta_ranking_creators_sorted.csv).

 
<div class="ui large right floated image" id="table5">
{{% csv_table src="/static/csv/batman_meta_ranking_creators_sorted2.csv" 
	maxLines="20"
    link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_meta_ranking_creators_sorted2.csv"
	caption="Table 5: Meta-scores for all creator types ranked."  
	colStyle="text-align:right;" %}} 
</div> 
 
Frank Miller wins for two reasons: he wrote two of the highest rated
Batman graphic novels of all time: *Year One* and  *The Dark Knight
Returns*. He also did a lot of his own art work. David Mazzucchelli
does well, also primarily through being involved in several stages of
*Year One*[^4], and many of the other top raters do so for similar
reasons. The final column of the table lists the number of
contribution credits (of all forms) that each creator has.  

Interestingly, Richard Starkings and other letterers do well on this
table. Often letterers are involved in more novels that other
artists. I don't know whether this is because they can do their job
faster (a lot of it is helped by computers these days), or because
they tend to work on a more consistent segment of the comic
market. Letterers are not always given much credit in this world. I
suspect there are many fans who wouldn't even know who Richard
Starkings is[^5]. But the data is suggesting that maybe we should
rethink that at least a little, and look more closely at letterers. 

Jim Aparo and others are perhaps penalised a little because teams are
treated as separate from the individuals. So his contributions to *A
Death in the Family* are separated because each part was in concert
with a different team. 

Alan Moore is at the top of the "single contribution" list. That is,
he is the highest rated contributor who did so in one novel in one
form. But then, Alan Moore is a legend. Brian Bolland probably does a
little too well in this list courtesy of having done Pencils, Cover
and Inks on Moore's *The Killing Joke*. There are a few others (e.g.,
Lynn Varley on Colors) who also do very well through having worked on
a famous project, so the approach used here isn't perfect. We'd
probably get a better view if the analysis wasn't just restricted to
one subject (Batman) or if we could determine better weightings for
different types of contribution. More on that at a later date.
 
# Conclusion 

There's not much more to say here. Borda counts give us a way to
create meta-lists from independent rankings. They aren't the only way,
but the approach is extremely flexible and that is *very* useful here
where I want to do something pretty non-standard. 

The final listing tells us some interesting things, but not much that
is controversial. I doubt many people would dispute Frank Miller's top
spot and other top rankers such as David Mazzucchelli, Tim Sale and
Dave McKean all made amazing contributions to the Batman
legend. However, understanding better how the creators who aren't
traditionally given so much credit (colorists and letterers) influence
the quality of the final work seems well worth some study.

 
# Acknowledgements

I'd like to thank Sylvia and Jono for editing this post.

# Resources

[Julia](https://julialang.org/) code for Borda and other counts is
included on the
[GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Code). 

The data is also in the [GitHub](https://github.com/mroughan/AlephZeroHeroesData/tree/master/Batman/Data). 


---
 
**Footnotes**


[^1]: At the moment you can get a free [soft copy](https://www.amazon.com/Detective-Comics-1937-27-1937-2011-ebook/dp/B00LMOV0F2/ref=sr_1_3?keywords=bill+finger&qid=1578022574&sr=8-3) of Detective Comics #27, which has the first appearance of Batman in it.

[^2]: Where a collected volume consists of a core set of issues, plus some associated side issues, I tend to focus on only the core issues, though the division isn't always obvious.

[^3]: Note that artists might appear singly, or in a team (which I am treating separately). 

[^4]: I am adding the total rating (without any weighting) for each stage a creator is involved in.

[^5]: Richard Starkings does have a (short) [wiki page](https://en.wikipedia.org/wiki/Richard_Starkings) and his list of [credits](https://web.archive.org/web/20191106060737/http://comicbookdb.com/creator.php?ID=74) is truly impressive, including several Eisner awards for Best Letterer. There is also a [blog site](http://www.balloontales.com/) with some interesting materials. He should be better known.
