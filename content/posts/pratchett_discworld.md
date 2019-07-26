--- 
title: "How big is the discworld?"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-07-26
lastmod: 2019-07-26 12:40:14
description: "Using the most surprising theorem in mathematics to calculate the land area of Terry Pratchett's Discworld"
categories: ["books"]
tags: ["Terry Pratchett", "Julia"]
cover: "img/discworld_small_wide.png" 
featuredImage: "img/discworld.svg" 
featuredImageDescription: ", <a href=\"https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld.svg\">Map of the Discworld</a>"
dropCap: false
draft: false 
toc: true
spoilers: false 
---

{{% blockquote author="Terry Pratchett" %}} 
Geography is just physics slowed down, with a couple of trees stuck in it.
{{% /blockquote %}}

# Intro

Way back when I was doing my undergrad degree, I was lucky enough that
most of it made sense, usually straight away. A lot of math is just
learning what the weird notation means. It's like learning a new
language -- you need a bunch of vocabulary.

Not everything was easy though, and one result that sent me into a
spin was *Green's Theorem*. I'm sure it isn't the most surprising
theorem for everyone but it left me pretty dumbstruck. I'll give
you the math in a moment, but intuitively what it says is that we can
learn about the interior of a region just by examining its boundary. 
That's magic. Can we really see inside without looking inside?

Of course it isn't magic, and we can't see whatever we like. But we
can calculate the area of a region looking only at the boundary. I
thought it would be fun to try this out on some non-trivial data, and
what better than a map. But the map needs to be relevant to the theme
of the blog. Enter the Terry Pratchett's Discworld.

Terry Pratchett was one of the most prolific and successful fantasy
authors ever. You could argue that Tolkein was more influential or
that Rowling made more money, but Pratchett wrote more and IMHO did
it better than anyone else in the genre. 

Most importantly, from my point of view, Terry understood how
important stories are. He even said it in his own writing:


{{% blockquote author="Terry Pratchett, Hogfather (Susan is talking to Death)" %}} 

“All right," said Susan. "I'm not stupid. You're saying humans need... fantasies to make life bearable."

REALLY? AS IF IT WAS SOME KIND OF PINK PILL? NO. HUMANS NEED FANTASY TO BE HUMAN. TO BE THE PLACE WHERE THE FALLING ANGEL MEETS THE RISING APE.

"Tooth fairies? Hogfathers? Little—"

YES. AS PRACTICE. YOU HAVE TO START OUT LEARNING TO BELIEVE THE LITTLE LIES.

"So we can believe the big ones?"

YES. JUSTICE. MERCY. DUTY. THAT SORT OF THING.

"They're not the same at all!"

YOU THINK SO? THEN TAKE THE UNIVERSE AND GRIND IT DOWN TO THE FINEST POWDER AND SIEVE IT THROUGH THE FINEST SIEVE AND THEN SHOW ME ONE ATOM OF JUSTICE, ONE MOLECULE OF MERCY. AND YET—Death waved a hand. AND YET YOU ACT AS IF THERE IS SOME IDEAL ORDER IN THE WORLD, AS IF THERE IS SOME...SOME RIGHTNESS IN THE UNIVERSE BY WHICH IT MAY BE JUDGED.

"Yes, but people have got to believe that, or what's the point—"

MY POINT EXACTLY.
{{% /blockquote %}}

Terry Pratchett started writing fantasy satire set on a world that
really was flat, carried on the back of backs of four elephants which
in turn stand on the back of the Great A'Tuin, a giant turtle swimming
through space. But the novels grew into much more than just satire.

They still have a strong sense of humour, but the novels (47 of them -- see
[here](https://en.wikipedia.org/wiki/Discworld#/media/File:Discworld_Reading_Order_Guide_3.0_(cropped).jpg)
for the 'correct' reading order) became the canonical description of a
whole world -- the *Discworld*.

Pratchett also wrote several other novels and series, some
jointly with other authors such as Neil Gaiman. 

Quite a few of Terry's works have been adapted into graphic novel form
or produced as movies and TV series, the most recent being the
aforementioned collaboration with Gaiman -- *Good Omens*. The
Discworld novels are so popular that they spawned a side industry of
books about the world, its science and its geography.

It's the latter that I am focusing on today. In particular the beautiful
map from
[*The Compleat Discworld Atlas*](https://www.discworldemporium.com/companions-maps/31-the-compleat-discworld-atlas)
and the earlier Discworld Mapp<sup><a href="#fn1" id="ref1">1</a></sup>, devised by Terry Pratchett and Stephen
Briggs, and illustrated in glorious thaumicolour by Stephen
Player. The featured image in this blog is my humble reproduction of
the map, whose only virtue lies in that it is an
[SVG](https://www.w3schools.com/graphics/svg_intro.asp) file, and thus
possible for me to analyse (I am not trying to violate anyone's
copyright here, just get the data in a form that I and others can work
with).

The end result (if you can't bear to read your way through, then follow
[this link](#the-results)) is that I can calculate not just the area of the whole
Discworld, but more interestingly the **land** area of its continents and islands. 

# Green's Theorem

Green's theorem is named after
[George Green (1793-1841)](https://en.wikipedia.org/wiki/George_Green_(mathematician))
(not my colleague Ed who is as good a mathematician as you are ever
likely to meet, but was born too late to get credit for this little
gem). George's version of the theorem wasn't quite like the modern
version, and in fact there are quite a few
[alt versions and generalisations](https://mathinsight.org/fundamental_theorems_vector_calculus_summary)
of the theorem that we might also look at if we had time.
Here is the modern version (the theorem has a few technical
assumptions<sup><a href="#fn2" id="ref2">2</a></sup>; I won't delve
into here. I'm just giving you the key equation.)

{{< raw >}}
\[\displaystyle \oint_C  ( L d x + M d y ) =  
   \iint_{D} \left({\frac{\partial M}{\partial x}}-{\frac{\partial L}{\partial y}}\right)\,dx\,dy
	 \]
{{< /raw >}}


Unless you are a serious mathematician or engineer this probably looks
pretty strange. As I said before, some of the confusion is just
understanding what the notation means. Here

+ C is a curve that surrounds a region D

+ The symbols like {{< raw >}}\( \int \){{< /raw >}} are called
integrals. But the symbol itself is an elongated S, standing for
sum. An integral is just a special sort of sum. We use two types of integrals here. 

     - The first integral, 
	   {{< raw >}}\( \oint_C \){{< /raw >}}, 
	   means sum along the path of the curve
       C. 
	   
     - The second integral,
	   {{< raw >}}\( \iint_D \){{< /raw >}}, 
	   means sum over the region D.

+ The {{< raw >}}\(dx\){{< /raw >}} and {{< raw >}}\(dy\){{< /raw >}}
tell you how to do the sum. 

+ The {{< raw >}}\(L\){{< /raw >}} and {{< raw >}}\(M\){{< /raw >}}
and their *partial derivatives* (slopes)   {{< raw >}}\(\frac{\partial M}{\partial x}\){{< /raw >}} 
and  {{< raw >}}\(\frac{\partial L}{\partial y}\){{< /raw >}} 
are the things being summed.

It's a complicated calculus formula -- we don't even teach it until
the second year of a degree in mathematics. I don't really expect you
to remember it or understand my fairly basic explanation. 

The really exciting thing about it is that the left-hand side only
needs us to perform a sum around the edge of the region, and from that
we can calculate the right-hand side, which is a sum over the whole
interior of the region. So we can learn about the interior, just by
looking at the exterior.

There's an episode of *The Big Bang Theory* where they get quite
excited about this idea as a model of the Universe. Because it's a
cool idea. I have no idea how Green discovered it -- apparently he
hadn't even had a very good mathematical education in his early
life. 

The result has been useful in both classical and quantum mechanics, in
electromagnetism and in analysing superconductivity. In a practical
setting, it has been used by engineers to calculate areas of complex
shapes, which is what we are doing here.

## Area

So, now we come to [calculating areas](https://mathinsight.org/greens_theorem_find_area). Green's Theorem works for almost
any reasonable functions {{< raw >}}\(L\){{< /raw >}} and {{< raw
>}}\(M\){{< /raw >}} so we need to choose the right functions. To get
there we need to understand that area is the simplest region integral:
it looks like

{{< raw >}}
\[\displaystyle 
   \iint_{D} 1 \,dx\,dy
	 \]
{{< /raw >}}

Hence we can get away with pretty simple functions namely:

+ {{< raw >}}\(L = -y/2\){{< /raw >}}
+ {{< raw >}}\(M = x/2\){{< /raw >}}

So the left-hand side becomes:


{{< raw >}}
\[\displaystyle \frac{1}{2} \oint_C  ( -y d x + x d y )  \]
{{< /raw >}}

Now we just need a way to evaluate the integral. If you've done a
course in advanced calculus, you probably learnt 12 different tricks
to do this for theoretical problems where the region is nice and
simple, e.g., a circle or a square, But we need to do it on a large
irregular shape (a continent). There are some tricks we can pull out
of the bag that sometimes aren't taught.

## Planimeters

<div class="ui medium right floated image">
  <img src="/img/Polarplanimeter_01.JPG">
</div>

The first trick is to realise that "adding up" along a curve is an
analogue task, and so we can build a mechanism to do it. Before the
days of Computer Aided Design (CAD) draftsmen would all have a device
called a
[*planimeter*](https://en.wikipedia.org/wiki/Planimeter). It's a
physical device that you trace across around a shape in a blueprint,
and it mechanically calculates the area of the region.

I have one (somewhere) but I'm not using it these days. It's much
easier to calculate integrals with a computer. But our computers are
digital. What that means is that all of my data will come in little
discrete chunks (like your digits, your fingers). That means the data
is an approximation (a pretty good one) but it also means we can
replace the integrals above with more straightforward summations as we
will do below. 

## Shoelaces 

The discrete, digital version of Green's theorem is called the
Shoelace Theorem (the name is a mnemonic that is meant to help you
remember the result, but my memory is so bad it doesn't help). 

The theorem says that for any polygon (the discrete version of our
curve C), with vertices {{< raw >}}
\(\displaystyle (x_i, y_i)  \)
{{< /raw >}} for {{< raw >}}
\(\displaystyle i=1,\ldots,n \)
{{< /raw >}} the area is given by

{{< raw >}}
\[\displaystyle A = \frac{1}{2} \sum_{i=1}^{n} x_i y_{i+1} - x_{i+1} y_{i}
\]
{{< /raw >}}

Here the {{< raw >}}\(\Sigma\){{< /raw >}} is a Greek *sigma*, or S, i.e., just
another symbol used to mean *sum*. There are some nice examples on
[Wikipedia](https://en.wikipedia.org/wiki/Shoelace_formula#Examples)
so I don't feel the need to go through one here.
There are also some [variant formulas](https://en.wikipedia.org/wiki/Shoelace_formula) but this is the one I like, and
have implemented as follows (in [Julia](https://julialang.org/)):
```julia
function area_contour_integral( points::Array{Float64,2} )
    n = size(points,1) - 1 # assumes closed curve
    x = points[:,1]
    y = points[:,2]
    area = 0.5*abs( sum( x[1:n].*y[2:n+1] .- x[2:n+1].*y[1:n] ) )
end
```

The array `points` contains the {{< raw >}}(x,y){{< /raw >}}
coordinates of the polygon describing (for instance) a continent. It
has to be *closed*, i.e., the last point repeats the first, so `n` is
one smaller than the size of array. 

So we go from a (for me) highly non-intuitive calculus formula to one
of the easiest pieces of code you could write. 

One final note: the most cluey of you will have noticed the `abs`
function hidden in there. That's because the sum above assumes I go
anti-clockwise around the polygon. If you go clockwise, you get a
negative area. I don't know what order I will be given vertices on an
arbitrary map, so I use the `abs` function to ensure I get a positive
area.

# A Mapp and a Julia

The
[map](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld.svg)
I am using is my transcription of the original. It isn't compleat and
there are most likely some mistakes, and certainly some noise in the
data. But it's in a vector graphics format
([SVG](https://www.w3schools.com/graphics/svg_intro.asp)) which makes
it possible for me to read it into [Julia](https://julialang.org/.

It's not quite trivial to read SVG files. Superficially SVG is an
XML variant, so we can use standard packages to get them into Julia (I
use [EzXML.jl](https://bicycle1885.github.io/EzXML.jl/latest/manual/)
and [XMLDict.jl](https://github.com/JuliaCloud/XMLDict.jl) at
present). The net effect is a very easy bit of [Julia](https://julialang.org/) code to read in an SVG
file: 

```julia 
using EzXML 
using XMLDict

filename = "discworld.svg"
s = read(filename, String) # read the file into a string
xml = xml_dict(s) # parse the string, and put the results in a dictionary          
```

The code gets the data into a generic Dictionary (see this
[post](http://localhost:1313/posts/post_julia2/) for more detail), but
you still need to interpret the information you have just slurped
in. This is not the place for a long discussion of SVG formats, and I
won't share my code just yet (it is not very robust or
complete). However, I will share the data in the form of a set of CSV
files (in addition to the
[map itself](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld.svg)). These
don't have all the information in the map, but include (x,y)
coordinates of the main two continents so you can potentially
reproduce most of the results. Here is the first few lines -- click on
them to get the files.

**Super-continent**

<div>
<div style="display: inline-block;">
{{% csv_table src="/static/csv/discworld_supercontinent.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld_supercontinent.csv" maxLines="6" colStyle="text-align:right;" %}} 
</div>
<div style="display: inline-block;">
<img src="/img/discworld_super.svg" alt="super-continent" height=175>
</div>
</div>

**Fourecks**

<div>
<div style="display: inline-block;">
{{% csv_table src="/static/csv/discworld_xxxx.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld_xxxx.csv" maxLines="6" colStyle="text-align:right;" %}} 
</div>
<div style="display: inline-block;">
<img src="/img/discworld_xxxx.svg" alt="Fourecks" height=175>
</div> 
</div>


The task at hand is calculating land area. There are a few assumptions
built into the calculation<sup><a href="#fn3" id="ref3">3</a>,<a href="#fn4" id="ref4">4</a>,<a href="#fn5" id="ref5">5</a></sup>,
but more importantly, what are we looking at? What land area will we
calculate? We need to have a quick look at what we know about the
Discworld's land masses.

The Discworld has four continents, but as in our world, several of
these are defined by social divisions, not clear geographic
boundaries. For instance, in our world Europe, Africa and Asia form a
super-continent: *Afro-Eurasia*. In the Discworld there is a similar
super-continent composed of Klatch, the unnamed continent (containing
Anhk-Morpork, the Hub and so on), and the Counterweight Continent). As
the boundary of this super-continent is well defined in the map (see
data above), but its subcontinents are not, we shall look at the
super-continent's land area.

There is an additional smaller continent called Fourecks or
"XXXX". Pratchett thought my own country was fairly amusing (I don't
doubt he was correct).

There are also many islands visible on the map. We will consider these
as a whole, but sunken lands
(e.g. [Ku](https://wiki.lspace.org/mediawiki/Ku) and
[Leshp](https://wiki.lspace.org/mediawiki/Leshp) are excluded).

Finally, there are three large lakes on the super-continent. As we are
interested in land area, we will remove the area of these lakes from
the total for the super-continent. 

# The results

<div class="ui large right floated image">
{{% csv_table src="/static/csv/discworld_calc.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Pratchett/discworld_calc.csv" colStyle="text-align:right;" %}} 
</div>

First up, all units are in miles (or square miles) as this was the
unit used in the map and in many of Pratchett's works. We cannot
confirm that a Discworld mile is exactly the same as a modern imperial
mile<sup><a href="#fn4" id="ref4">4</a></sup>, but the manner in which
it is used in speech suggests they are at least approximately the same. 

All areas assume that the disc is
[10,000 miles](https://discworld.fandom.com/wiki/Discworld_geography)
in diameter. This may be an approximation, however, if it is
inaccurate, all areas scale as the square of the ratio of change, and
so proportional coverage will be the same.

The disc itself is around 79 million square miles (obviously this is
not "land" area). Compare this to our Earth's
[196.9 million mi²](https://en.wikipedia.org/wiki/Earth), and we can
see that it is about 40% of the area of the Earth (or Roundworld), but
of course the usable land area depends on how large a proportion is
sea. Only 29.2\% of our Earth is covered by land (57 million mi²). The
Discworld has about 30 million mi² of land, closer to half that of
Earth.

That's important!  It has geographic constraints similar to ours in
terms of time taken to get places. And the disc has enough space for as many
stories as our world (almost). It has room to breathe. Pratchett took
advantage of that scope to create many new places, and satirise many
more (Fourecks is his satirical version of my own Australia). 

On our world
[Afro-Eurasia](https://en.wikipedia.org/wiki/Afro-Eurasia) has a land
area of 33 million square miles, which is surprisingly close to that
of the Discworld super-continent, given the large differences in shape
(and underlying geometry). And Fourecks' land area is comparable to
Australia (it's about half the size). 

A much larger proportion of the Discworld's total land area lies in
the single supercontinent than on Earth. Here we have two
super-continents (Afro-Eurasia and America) and two smaller continents
(Australia and Antarctica), whereas almost all of the Discworld's land
area lies in the single land mass.

Does that matter from a story telling point of view? I guess it shows
a bias in Pratchett's worldview towards the old world. Although many
of the topics covered in his books are those I consider "American" in
the sense that the US is the place where those ideas really
germinated, Pratchett didn't create an American analogue in his
world. Perhaps that was unconscious, or perhaps it was deliberate. It
is after all a rather well-trod path for a British writer to take, to
satirise the US, and maybe one of the hardest working writers in
fantasy thought it a little lazy.

# Conclusion

The main point of this blog: the Discworld is big. It's not so far from
our own world in land area. Very few created worlds are so big and
actually fleshed out in any detail (though there are world builders
out there who do that for a hobby). Terry Pratchett created something
magnificent. 

How is this important for data science? Well, too often data-scientists
crunch numbers directly. A common approach to the above problem might
have been to create a really big array of {{< raw >}}(x,y){{< /raw >}}
points (pixels) and to test if each is inside the continent. Then add
up the total. That's nice in one respect -- it parallelises, and so we
can use the Hadoop *et al.* of the world to calculate the resulting
big sums. But I don't need a supercomputer. I can barely measure the
amount of time it takes to do the trivial calculation above (Julia is
very fast).

So I guess the point is that if you know the right tricks, sometimes
you don't need big data, or big computing, or big anything.

One final disclaimer, I have read a lot of the Discworld books, but
not all. As long as there is still at least one I haven't read, Terry
Pratchett isn't really dead. We love him for his charm and his humour
and his insight. He understood the world as it is, but wrote about it
as it should be.  I don't want to live in a universe where he isn't
there writing books, so I'll try to fool myself for a little longer.

# Acknowledgements

Just a quite thanks for the people who have been helping me edit these
blogs, notably my wife and Giang Nguyen. 

---
 
**Footnotes**


  1. {{<raw>}} <div id="fn1" class="footnote">
  
     Mapp, compleat, etc. are correct (thank you for noticing
     though). Pratchett often liked to use archaic or whimsical
     spellings.
    
	<a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> 
	{{</raw>}}


  2. {{<raw>}} <div id="fn2" class="footnote">
  
	  Green's Theorem assumptions: the curve C must be be a positively
	  oriented (counter-clockwise), piecewise smooth, simple closed
	  curve in a plane, and let D is the region bounded by C. 
	  
	  The functions L and M are functions of (x, y) defined on the
	  open region containing D and must have continuous partial
	  derivatives there.
    
	<a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> 
	{{</raw>}}


  3. {{<raw>}} <div id="fn3" class="footnote">
  
	  The key assumptions throughout this discussion are that the disc
	  is (1) circular (it isn't exactly, but the approximation seems
	  good), and (2) that it is flat (it isn't exactly, but Cori
	  Celesti, the most magnificent peak of the world is 10 miles
	  high. That sounds very, very tall, but on the scale of the
	  Discworld it is almost invisible).
    
	<a href="#ref3" title="Jump back to footnote 3 in the text.">↩</a></div> 
	{{</raw>}}


  4. {{<raw>}} <div id="fn4" class="footnote">
  
	  A "mile" has varied in meaning across time and
	  space. Historically the term derives from the Roman mile -
	  <em>mille passus</em> - which means a thousand steps. In 29 BCE
	  Agrippa standardised the meaning of a step as 5 feet. There have
	  been many variants though, and the mile is still not completely
	  standard. The US survey mile is subtly different from the
	  British mile, and the nautical mile is different again. If you
	  want to measure distances (outside of a story) use SI units.
	
	<a href="#ref4" title="Jump back to footnote 4 in the text.">↩</a></div> 
	{{</raw>}}


  5. {{<raw>}} <div id="fn5" class="footnote">
  
	  I am aware that some aspects of the geography of the Discworld
	  and the text describing it are at odds. A good
	  <a href="https://wiki.lspace.org/mediawiki/index.php?title=Talk%3ABook%3AThe_Discworld_Mapp&oldid=27489">discussion is here</a>. 
	
	<a href="#ref5" title="Jump back to footnote 5 in the text.">↩</a></div> 
	{{</raw>}}

