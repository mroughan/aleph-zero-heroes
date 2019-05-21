---
title: "Elo vs Marvel: Who is the most mightiest Avenger?"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-02-16
description: "Using the Elo rating system to  Marvel Cinematic Universe
using the Elo ratings system"
categories: ["movies"]
tags: ["Marvel", "MCU", "Conflict", "Elo"]
# featuredImage: "img/standard.png"
cover: "http://i.annihil.us/u/prod/marvel/i/mg/6/d0/5130ff669d4f4/landscape_incredible.jpg"
featuredImage: "http://i.annihil.us/u/prod/marvel/i/mg/6/d0/5130ff669d4f4/landscape_incredible.jpg"
featuredImageDescription: ": The Infinity Gauntlet, <a href=\"http://marvel.com\">provided by Marvel. © 2019 MARVEL</a>"
draft: true 
---

SPOILERS ALERT
 
I just watched *End Game* again for the second time, and it reminded
me of a question I had heard bandied about about whether Captain
Marvel was the most powerful hero in the MCU.  
 
It's a specific case of a perennial question amongst fans: "Which
superhero is mightiest?"  Many people have sought answers to this
question:

+
+
+

However, these are all subjective. They depend on the judgement of
fans and commentators. One aim of data-science is to answer vexing
questions with objective measures.

There are many approaches one could adopt, 



As in other recent blogs (e.g. ...) we focus here on the Marvel
Cinematic Universe because it has a (largely) consistent set of
characters and timelines. 

# Who is Mightiest

The first issue to settle is what do we mean by *mightiest*. It could
mean "strongest" as in who can bench-press the biggest weight, or who
can fire the most powerful eye beams. 

Here we refine the meaning to take into account the hero's ability to
apply their power. That is, the Hulk might be the strongest
(physically) but the Hulk(1) can only SMASH. He can be cunning, and
certainly is a good fighter, but is at a disadvantage against Thor
because Thor can apply his abilities.

Attempts to list powers and convert and combine them into an overall
power rating are doomed.  Abilities such as flying are incredibly
useful but very hard to convert into a "power" rating. Abilities such
as Loki's illusions likewise. These powers can be game changers in
some circumstances, but in others are useless. 

The alternative to attempting to score a hero on abilities is to score
them on success. We can rate them by how effective their powers are
against each other. That is, we view action sequences as a series of
conflicts, and we judge the prowess of each hero and villain by how
well they succeed against each other.

This is a really common setting. We see it all the time in sports. We
have teams or players who we aim to rank and the data we use is the
outcome of their competitions against each other.

The simplest approach to ranking is we award points for results, say 2
points for victory and 1 for a tie, and the winner is the team with
the most points (or we might then run a playoff between the top-ranked
teams). But this approach is badly flawed for our situation because
the results are highly dependent on 

1. the number of conflicts in which a character engages (which is
   highly variable in the movies as opposed to many sports); and

2. the strength of the opposition.

The latter is particularly important when we don't run a round-robin
competition (so each team plays a different selection of
opponents). Thus a team that is successful in playing against weaker
opponents may achieve more wins than an equivalent team that plays
against stronger opponents.

There are algorithms to deal with these challenges, perhaps the most
famous being the *Elo rating system*. 


# Elo ratings





# Results

## Data

The data were collected by watching the movies and noting conflicts by
hand. It took a long time (there's more than 40 hours of movies) but
it was fun.

...

We don't just rate superheros here. We also include villains. We need
to because Elo rates every player against other players, and most
conflicts are between heroes and villains. But also, I think its
interesting to see how they both rate.

We also include side-characters (at least those who participate in
conflicts). 

We also include "mooks".

   - what
   
   - why



## Extras bits

Elo is often modified for use in practice. Here are a couple of the
ways we modified it to suit this particular problem.

### Enhancement factors

Thor is a different guy when he has Mjolnir, and Captain America has
his iconic shield. And Tony Stark may *be* Iron Man, but Tony Stark
can't fly without a his iron mongery. 

Certain characters sometimes operate with an advantage or
disadvantage. It would be unfair to judge their overall ability
without taking this into account. And likewise, if a hero wins against
someone who is injured or constrained in some way, that shouldn't give
their ratings as big a kick upwards. 

This is closely analogous to the "home-ground" advantage teams have in
many sports. Effectively, a team should be rated higher on their home
field than when playing away.

So we do that. The data records a list of advantages and disadvantages
each character suffered in each conflict. These are combined into
their ratings in the relevant calculations. 

There is one additional unknown parameter introduced by this: the
scale-factor that is used to determine how large an effect such
factors have. Ideally this would be different for every character and
every particular type of circumstances, but we really don't have
enough data to support that level of detailed estimation. Instead, we
record enhancement factors as (small) integers, and introduce one
overall factor $\beta$ for all of these. That allows us to use some
judgement about how important a circumstance is to a character (it is
worth 1 or 2 points of enhancement), and an overall scale relative to
the ratings scale.

We then need to fix $\beta$ and we did this ... 


### Re-sampled Elo

Typically, Elo is used to track players or teams over
time. This can be very illuminating because it shows when a player
reaches their peak, and whether they are improving or going
backwards. 

However, when 538 examined the NBA using Elo, they had ??? matches per
season to use as data. Here we have much fewer (only ?? per movie on
average). So although we might like to use Elo to track Iron Man's
performance as his tech improves, we aren't going to be able to.

When we allow that time is not going to be part of the analysis we
open up some interesting possibilities. The most important is that
conventional Elo provides no measure of accuracy for its
ratings.

We can provide such a measure as follows:

```
Repeat the following N times:

1. Take a sample of the conflicts

2. Use Elo on the sample

Then form a variance estimate from the N sampled results
```

This is analogous to a statistical technique called *bootstrap*. 


BOOTSTRAP -- do process multiple times, and consider variance of
results ... 

The approach also allows us to avoid the tricky question of the best
K-factor. Conventionally, this must trade off  speed of convergence
with stability of estimates, but as we are re-sampling anyway, we can
do so as many times as needed for convergence. The upshot is that we
can safely choose a small value of K without worrying about
convergence, and thus guarantee more stable estimates. 

## Results

The final results are lined up on the right. 


Or look at this data file.

The top is ... 




# Limitations 

single number

transitivity

not enough data

meshiness




VERTICAL PLOT ALONG right edge


_____

Footnotes

(1) pre Banner/Hulk fusion 

(2) Elo is not an acronym, it is named after Arpad Elo
 
 
ties

