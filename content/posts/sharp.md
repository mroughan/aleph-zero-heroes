--- 
title: "Sharp Data Science"
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-01-10
lastmod: 2020-01-16 19:05:53
description: "The Sharp Pocket Computer, and the art of programming in small spaces. Plus Gamma rays are not Gamma functions, but putting Gamma in front of a word makes it sound cooler."
categories: ["code"]
tags: ["Sharp", "Julia", "BASIC"]
cover: "img/sharp_1500_2_small.png" 
featuredImage: "img/sharp_1500_2.png" 
featuredImageDescription: "Sharp PC-1500"
dropCap: false
draft: false
toc: true
spoilers: false 
---

# Intro 

I recently dug out my old
[Sharp PC-1500](https://www.old-computers.com/museum/computer.asp?st=1&c=965)
pocket computer[^1][^2]. It had severe limits, but I learned to program
on that thing, and I learned better because of its limits, not despite
them.

I got the Sharp
circa 1982, which was a very good year. Alan Moore's *V for Vendetta*
started -- one of my favourite comics ever and the origin of the
Anonymous movement. Blade Runner came out -- the best movie ever.
Apparently I was old enough to watch it, though to be honest I'm not
sure what my parents were thinking.  The Wrath of Khan also came out
in 1982, and E.T. and TRON. It was a *really* good year for science
fiction. 

In music there was *Don't You Want Me* by The Human League; and
*Tainted Love*, the Soft Cell cover; *Should I Stay or Should I Go* by
the Clash; *White Wedding* by Billy Idol; and about a dozen other of
my favourites (The Police, Psychedelic furs, Depeche Mode, Roxy Music,
and Bowie all had hits).  And there was the best/worst film clip ever
for *I Ran* by A Flock Of
Seagulls. [You need to see it](https://www.youtube.com/watch?v=iIpfWORQWhU).
I may be dating myself, but what the hell.

So, now that we agree, 1982 was the best year ever, let's not forget
the PC-1500.  It was my first computer ever. It was brilliant. I put
batteries in it last week, and it still works!

It has a black and white LCD screen 156×7 pixels in size. Just big
enough for one row of 26 characters. The CPU is an 8 bit CMOS chip
called the LH-5801 running at 1.3 MHz. Not amazing specs, but I dug around and found an
[advertisement](https://books.google.com.au/books?id=bXxI8lC4cEwC&pg=PA36&lpg=PA36&dq=sharp+pocket+computer+pc-1500+original+price&source=bl&ots=cc-FDmOa0e&sig=ACfU3U1QVDIVqPwRLRzrbu7ZYWEHqmpcHg&hl=en&sa=X&ved=2ahUKEwji1eja8vPmAhUK7HMBHeuVA_0Q6AEwEHoECAoQAQ#v=onepage&q=sharp%20pocket%20computer%20pc-1500%20original%20price&f=false)
for it being sold at 130 British Pounds in 1983. That was seriously cheap for
a computer in the early 80s (the Apple IIs were more than $1000). And
it was seriously small[^2].

It was programmed in BASIC (more on that in a moment). Afficionados
cracked it to build an assembler, and even a C compiler, but BASIC was
enough for me at the time. I taught myself from its
[manual](http://www.pc-1500.info/Data/Manuals/US_PC-1500_Instruction_manual.pdf)
which was actually pretty good.  It has two modes: in the first you
write code, e.g.,

```BASIC
10: PRINT "Hello World!"
```

In the second mode you run your code and debug it, though old school
debugging wasn't user friendly. They hadn't actually invented "user
friendly" coding yet. 


It isn't useful for data science. The only way I have to get data onto it is to type it by hand[^3]. 
So why am I bothering you with some archaic trivia about an obsolete
computer? Let me explain.

It had only 3.5 KB of RAM (memory). Not even all of this was available
for programming. A fair chunk was needed for the system, so only 1850
bytes were available for code, and 624 bytes for variables (data).

That is **tiny** by today's standards. Memory on computers is usually
measured in giga-bytes, so even a small laptop these days will likely
have a million times as much memory. A later model (the PC-1500A) had
more memory and there was an expansion card, but we are still talking
about minuscule amounts of memory.

When you write code in small spaces, you learn to write really tight
code. You can't afford to waste a character. That is a great learning
experience. I'll get to that in a second, but first let me show you
you how you can still write some cool code. I have a little example
(below) of the gamma function. It's instructive for a couple of
reasons.

# BASIC Programming

BASIC is (usually) an interpreted imperative language (there are many
[dialects](https://en.wikipedia.org/wiki/List_of_BASIC_dialects) of
BASIC). That is, it follows a sequence of commands in logic-defined
order. It was high-level for its time (1964). It was intended to
improve programming literacy outside of STEM -- which makes you wonder
how long has that problem been around?

The PC-1500 used Sharp's own variant of BASIC, oriented around the
hardware. To get an idea what it looked like, lets look at code for
calculating the gamma function 
{{< raw >}}\( \Gamma(z). \){{< /raw >}}
The gamma function has nothing to do with Bruce Banner and Gamma
rays. Instead it is a useful little mathematical function for which we know
good numerical approximations, but no closed form solution[^4]. It's
defined by
{{< raw >}}\[ 
	\Gamma(z) = \int_0^\infty x^{z-1} e^{-z} \, dx.
\]{{< /raw >}}
I explained the integral symbol {{< raw >}}\( \int \){{< /raw >}} in an 
[earlier post](/post/pratchett_discworld) on Terry Pratchett's Discworld.
It's an elongated S, short for "sum." It means sum everything under the curve 
{{< raw >}}\( x^{z-1} e^{-z} \){{< /raw >}}. There's a few tricks hidden in here 
(what do you do for negative-valued curves, for instance) but we won't go into them 
here. The symbol {{< raw >}}\( \Gamma \){{< /raw >}} is just the uppercase greek 
letter Gamma. 

<div class="ui large right floated image">
  <img src="/img/plot_gamma.png">
</div>

The gamma function is used in many calculations, e.g., in quantum physics, fluid
dynamics and statistics. There is a gamma distribution used, for
instance, to model the time between earthquakes. It is so important 
that there is a book called 
[Gamma](https://www.goodreads.com/book/show/600071.Gamma), by Julian Havil, which 
has a chapter -- surprise, surprise -- just about this particular
function[^5]. It has many interesting relationships, e.g., 
{{< raw >}}\( \Gamma(3/2) = \sqrt{\pi}/2. \){{< /raw >}}
It's an important function
so most modern languages have a way to calculate it. 
[Julia](https://julialang.org/) has a function called `gamma` in the
package `JuliaMath/SpecialFunctions.jl`.  I used Julia's version to
generate the plot above. The plot shows that the function isn't quite
straight forward. 
It goes off to ± infinity at 0, -1 and so on[^6]. 

Modern programming languages give us easy access to the function, but
being able to calculate it with a pocket computer in the 80s was cool.
BASIC code for calculating the gamma function on the PC-1500 (from
[here](http://www.rskey.org/pc1500)) is given below[^7].

```fortran
10: INPUT X
20: Z=ABS X
30: G=2.506628275+6.3E-10+(225.5255846+1.9E-8)/Z-(268.2959738+4.1E-8)/(Z+1)
40: G=G+(80.90308069+3.5E-9)/(Z+2)-(5.007578639+7.1E-10)/(Z+3)
50: G=LN(G+(.011468489+5.435E-10)/(Z+4))+(Z-.5)*LN (Z+4.65)-Z-4.65
60: IF X>0THEN 90
70: RADIAN
80: G=LN (π/X/SIN (π*X))-G
90: PRINT EXP G
```

Line numbers are important as they are used as references for
statements such as `IF X>0THEN 90` which jumps to line 90 if `X` is
positive. Line 10 is an input that requests we type the number for
which we will calculate the Gamma. Then we do the actual
calculations. Note the use of scientific notation, e.g., 6.3E-10 means 
{{< raw >}}\( 6.3 \times 10^{-10} = 0.00000000063 \){{< /raw >}}. This
code was written **very** carefully to cope with the limitations of
number storage on the device. We don't just write
```fortran
2.50662827563
```
we write
```fortran 
2.506628275+6.3E-10
```
which look like they should be identical, but they involve subtley different
approximations when you actually implement them in the
machine. Floating point numbers (decimal numbers on computers) are surprisingly tricky!

Lines 20, 50, 80 and 90 use pre-defined functions (like `ABS` which
takes the absolute values, and `LN` which is the "natural"
logarithm). This computer's BASIC has a nice set of these mathematical
functions to call on. Line 70 tells it that angles, e.g., in `SIN`,
will be given in radians not degrees.

<!-- Note that you don't use brackets to define the -->
<!-- input arguments of functions in this version of BASIC. -->

We can test this gamma function really easily because for an integer 
{{< raw >}}\( n \){{< /raw >}} we know that
{{< raw >}}\( \Gamma(n) = (n-1)! \){{< /raw >}} 
The exclamation mark here means "factorial", a fancy way to multiply
numbers from 1 up, e.g., 5! = 1 x 2 x 3 x 4 x 5, so we can
test our gamma function by comparing it to these simple cases. 
And there are many other values known to high accuracy. 
A comparison is given in [Table 1](#table1). You can see the PC-1500 is 
accurate; in most cases it gets 8 or 9 figures correct. 

<div class="ui large right floated image" id="table1">
{{% csv_table src="/static/csv/sharp.csv" 
       caption="Table 1: gamma function calculations" colStyle="text-align:right;" %}} 
</div> 

BASIC was designed in the 60s, and took off in a big way. It was
showing its limits in the 80s and it is widely maligned these
days. Other languages like C took over, and few people use BASIC any
more, even for teaching. But that isn't fair. David Brin has a great
article
["Why Johnny can’t code"](https://web.archive.org/web/20130918213750/http://www.salon.com/2006/09/14/basic_2/singleton/)
from 2006, which outlines why languages like BASIC (if not BASIC
alone) were a core part of computer programming education. The logical
thought process involved in such languages is at the heart of code
design, whatever fancy new paradigm and language you adopt. So I don't
advocate BASIC as a useful language for doing data science, but it was
great for learning.

[Julia](https://julialang.org/) is also great for learning, as well as
in many other ways! Julia has exactly what BASIC had, in terms of
learning how to program. You can sit and type a logical sequence of
operations, and see them work. And it has a lot more to offer.

<!-- And just quickly, as a feeble attempt to link this entry up to -->
<!-- superheroes, please note there is no connection between gamma rays -->
<!-- (Bruce Banner's nemesis) and gamma functions.  -->

<!-- And if you want to learn more BASIC, I actually quite like the -->
<!-- description in the -->
<!-- [Sharp's manual](http://www.pc-1500.info/Data/Manuals/US_PC-1500_Instruction_manual.pdf). -->

# Adventures in Space and Time

So [Julia](https://julialang.org/) has one big plus in my book, but
there is another. Languages such as Matlab encourage users to be lazy
about number representations. Matlab users typically represent all
(real) numbers as double-precision (64 bit) floating point numbers
(using the IEEE Standard 754). These are flexible and convenient but
not ideal for all purposes. Being careful about your numbers is an
important part of writing good code.

The most obvious case is image data, and anyone working on images in Matlab is
probably familiar enough with using integer types to avoid the
common problems, but there is a continuous drift towards the
convenient option in such languages because, for instance, functions don't specify the
types for input arguments. 

That's great when you are getting prototypes working quickly. It's
terrible when you are trying to work with large datasets. And it isn't
always easy to add types to Matlab once you have started. Other
languages don't have serious control of number types at all.

The usual trade-off is you spend more time to code the critical parts
of a program in C or FORTRAN. So you save space (memory) but use up your coding time. The beauty of
[Julia](https://julialang.org/) is that you code your prototypes
quickly, and can directly add types after the fact. You get the best
of both worlds.

So that brings us back to the Sharp. When you learned to code in such
a small space you always have this in the back of your mind. You think
about whether a number should be an integer or a float, and how many
bits it needs.  Everyone should try programming in one of these
(rather limited) devices at least once.

Part of the care is in use of space, and part is in knowing about the
limits of number representations. Floating point numbers are used to
represent decimals, but they are approximations. And they aren't at
all simple, as we saw above. I'll write more on floating point numbers
in the future,
but for the moment note that you can have such oddities as +0 and -0,
which are different! There is much more information
[here](https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/). 

For some quick insights try (in [Julia](https://julialang.org/)) typing things like 
```julia
using Printf
@printf("%.12f\n", Float32(.1) )
```
which converts 0.1 into a 32-bit floating point number, and then
prints out the decimal version of the approximation, which in this
case is not 0.1, it is 0.100000001490. You can see why I say that the
gamma function calculations were accurate (above) when just inputting a
number like 0.1 generates errors of a similar magnitude!

The BASIC gamma function code above is amazingly clever in how it uses
floating point.  


<!-- # messui.polygonal-moogle.com/comp/sharp.pdf -->

<!-- Variables: -->
<!--   A-Z     number -->
<!--   AA-ZZ   number -->
<!--   A0-Z9   number -->
<!--   A$-Z$   string (up to 16 characters) (25x16 bytes) -->
<!--      link more than one to get longer strings -->

<!-- 950 variable names -->

<!-- variables with single letter are not cleared when program is run -->


<!-- \$319 (1983) -->

# Conclusion

Poets work inside constraints --- Haiku[^8] have an exact number of
syllables for each line. Constraints are where you find beauty, and
this is true of writing code in small spaces. Such code has to be
elegant. It has to be efficient. Learning to write such code is well
worth your time, even if your typical application works with
terabytes of data. Especially if your typical application works with
terabytes of data.

Oh, and 1982 was the best year ever :)

Oh, and sorry if my koan on short programs was too long.

# Acknowledgements

Thanks go out to Sylvia and Jono for editing this one.

# Resources 

General information on the Sharp PC-1500:

+ https://www.old-computers.com/museum/computer.asp?st=1&c=965
+ http://www.rskey.org/pc1500
+ http://pocket.free.fr/html/sharp/pc-1500_e.html
+ http://www.vintage-computer.com/sharppc1500.shtml
+ http://www.aldweb.com/articles.php?lng=en&pg=25
+ http://www.aldweb.com/articles.php?lng=en&pg=26
+ https://www.tramsoft.ch/sharp_erweiterungen/index_en.html

Advertisements and reviews from the 80s:

+ [Australian business has really taken to Sharp](http://messui.polygonal-moogle.com/comp/sharp.pdf), ELECTRONICS Australia, April, 1983.
+ [Calculator or Computer](https://books.google.com.au/books?id=VtkDAAAAMBAJ&pg=PA105&lpg=PA105&dq=sharp+pocket+computer+pc-1500+original+price&source=bl&ots=REOW8sp_iX&sig=ACfU3U1WGsBeWpBQPHgYnb0CSQD3SGcqAQ&hl=en&sa=X&ved=2ahUKEwji1eja8vPmAhUK7HMBHeuVA_0Q6AEwD3oECAgQAQ#v=onepage&q=sharp%20pocket%20computer%20pc-1500%20original%20price&f=false), Popular Mechanics, Aug, 1982.
+ [Portable computers](https://books.google.com.au/books?id=bXxI8lC4cEwC&pg=PA36&lpg=PA36&dq=sharp+pocket+computer+pc-1500+original+price&source=bl&ots=cc-FDmOa0e&sig=ACfU3U1QVDIVqPwRLRzrbu7ZYWEHqmpcHg&hl=en&sa=X&ved=2ahUKEwji1eja8vPmAhUK7HMBHeuVA_0Q6AEwEHoECAoQAQ#v=onepage&q=sharp%20pocket%20computer%20pc-1500%20original%20price&f=false), New Scientist, April, 1983.

Programming:

+ [The Manual](http://www.pc-1500.info/Data/Manuals/US_PC-1500_Instruction_manual.pdf)
+ http://www.kaibader.de/tag/lh5801/
+ http://www.gelhaus.net/cgi-bin/page.py?loc:8bit/+content:sharp_pc.html
+ https://rkixmiller.dudaone.com/old-hardware-emulated-pockemul-sharp-pc1500
+ [Pocket Computer Programs](https://archive.org/details/pocketcomputerpr00natw)
+ If you want a play, but don't want to buy your own pocket computer, [PockEmul](https://www.emutopia.com/index.php/emulators/item/382-pocket-computers/168-pockemul) can apparently emulate it, thouhgh I haven't tried it.
+ [Examples](http://www.pc1500.com/)
+ [Learning BASIC Like It's 1983](https://twobithistory.org/2018/09/02/learning-basic.html)

Floating point weirdness

+ http://www.rskey.org/~mwsebastian/miscprj/results.htm
+ https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/

---
 
**Footnotes**

[^1]: The Radio Shack *TRS-80 Pocket Computer PC-2* was a rebadging of the Sharp, sold in America.

[^2]: It's 195 x 86 x 25 mm in size. I don't know anyone with pockets this big. But most computers were pretty clunky back then. And it was an incredibly light 375 grams with the batteries in (4 AAs). 

[^3]: It has a 60-pin expansion port that apparently can interface to a tape drive, but good luck with that.

[^4]: "Closed-form expression" is a mathematical way of saying that we know how to compure a function with a finite number of "standard" operations. Standard operations include standard arithmetic -- +,-,x,/ -- and certain functions such as trigonometric functions like cosine. There isn't a real standard for what is allowed, but it for most computational purposes it isn't a big deal. 

[^5]: There are many works on the gamma function. The classic *Handbook of Mathematical Functions* edited by Abramowitz and Stegun has a chapter on the topic, as does Bell's *Special Functions for Scientists and Engineers*. Abramowitz and Stegun also includes a set of tables precisely because it is hard to calculate (without a computer).

[^6]: The gamma function can also be extended to the complex plane, for those who care. 

[^7]: This code is a little limited. It will return an error if you try to calculate Gamma(-1), for instance, which is expected, but it has trouble with smaller values as well. 
 
[^8]: There is actually a question on [StackExchange](https://codegolf.stackexchange.com/questions/5760/executable-haiku-that-outputs-a-haiku) asking people to write an executable haiku that outputs a haiku, so it isn't just poets.
