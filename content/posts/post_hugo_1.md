---
title: "The Incredible Hugo"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-04-05
lastmod: 2020-01-16 18:56:20
description: "Literate programming, documenting data and using Hugo for reproducible research."
categories: ["Code"]
tags: ["hugo"] 
cover: "https://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/landscape_incredible.jpg" 
featuredImage: "https://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/landscape_incredible.jpg" 
featuredImageDescription: ": The Incredible Hulk, provided by Marvel ©"
draft: false 
---

# Reproducible research

It is fascinating how many people, scientists and the general public
alike, don't understand the role of *refereed* publications in the
progress of science. Publications are held up as a "gold standard"
because they have been through this mystical process of the
"referee". 

So let's just start by saying that idea is wrongity, wrong, wrong, wrong. 

The refereeing process can eliminate egregious errors, and check that
appropriate methodologies are used. It can filter out some mistakes,
and point out (sometimes) when work isn't novel. But it is just a
filter. Referees are human, and make mistakes. And more importantly,
referees don't usually have access (or time to make use of access even
if they had it) to the sources of a research paper. They can't check
everything because they can't see everything.

This isn't a problem! Or rather, it isn't a problem as long as
everyone understands it. Or rather it isn't a problem as long as
everything understands it, and does the right thing.

What is the right thing, I hear you ask?

The right thing is to make the
[research reproducible](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research). Simply,
science does not progress because a single group of authors write a
paper. It progresses because many *sceptical* scientists try to see if
each others work is kosher by attempting to reproduce it, or
otherwise. And when you can reproduce it, this is the stepping stone
to the next idea.

Many scientists and organisations and journals have acknowledged that
reproducibility is the corner-stone of good science, e.g.:

+ [World Bank Statement](https://dimewiki.worldbank.org/wiki/Reproducible_Research)
+ [Open Science](https://mg.readthedocs.io/reproducible_research.html)

To do reproducibility well, we need to think about publications a little
differently. I think it's expressed well  in the following quote from
[Buckheit and Donoho](http://www-stat.stanford.edu/~wavelab/Wavelab_850/wavelab.pdf):

> An article about computational science in a scientific publication
>   is not the scholarship itself, it is merely advertising of the
>   scholarship. The actual scholarship is the complete software
>   development environment and the complete set of instructions which
>   generated the Figures.

The idea is that a publication should come with associated code and
data. Some journals now push for publication of data associated with a
paper. Some are pushing for code to also be published. But not all,
and not uniformly.

We should acknowledge that sharing is hard and requires considerably
more work than simply writing a paper. Scientists are usually under
time pressure, and don't necessarily get rewarded for this extra
step. Hence it isn't always done well, for instance see
[Reproducible Research Practices and Transparency across the Biomedical Literature](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1002333). Too
often scientist publish a paper, without revealing their data, or
providing their code. Even when data is ostensibly shared, links go
stale or datasets use closed formats that require the use of
unavailable or obsolete software.

At best this slows down science. At worst it enables incompetence and
fraud.  

<!-- If your work involves building expensive devices like particle -->
<!-- accelerators, or expensive medical tests, perhaps that's a partial -->
<!-- excuse. And some data is by nature private. So don't expect the world -->
<!-- to change overnight. -->

Data scientists should have this nailed. We work with data and code
all the time, are familiar with open standards, and many data
scientists already use nice tool chains that make sharing easy.

However, sharing data (in raw form) isn't quite enough. The data has
to be *accessible* (not just available) and *understandable* (without
extraordinary efforts), and not just at the publication date, but
ideally forever.  So I wanted to talk about sharing data (and code)
and how I am trying to improve in this domain.

# Literate Programming and Data

Many people know that
[reproducible research](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research)
requires sharing of data. The thing that isn't mentioned is that
sharing, by itself, isn't quite enough. Other people have to be able
to understand (without extraordinary effort) the code and data. That
doesn't initially sound radical, but it is. Programmers still, despite
decades of education, usually document code as an
afterthought. Documentation is, however, crucial for good code. It
makes it easier to debug, to use and reuse and to maintain the 
code. Adding (often trite, ignorable) comments after the fact does not
generally achieve these objectives.

Documenting code *while writing it* also has a side benefit. If you
*have* to explain your code to someone (as you write it), then you
write better code. You avoid stupid shortcuts. You modularise it more
carefully. Writing the explanation and the code at the same time force
discipline, and that is almost always a good thing.

I believe that **documenting code and data are really the same
activity.** The amount of time I have spent trying to understand
someone's data that 30 seconds work on their side, and 3 lines of text
would have saved is beyond belief! And the number of times I have had
to access carelessly organised data is equally surprising. If someone
had to write an explanation of their data, they might have realised
that it needed a better structure. 
 
[Literate programming](http://www.literateprogramming.com/) was a
radical idea put forward by Knuth in the 80s that a computer program
shouldn't just be commented. They should be a readable document that
contains code. Literate programming insists that the documentation is
part of the program and created alongside it.

Literate programming didn't take off initially, but there are more and
more tools that support
it. [Julia uses markdown](https://docs.julialang.org/en/v1/manual/documentation/index.html)
to automatically create the online help information about functions,
variables and modules. This is lightweight, easy to use, and very,
very helpful when done well. It isn't fully literate, but it's a good
start. 

You might guess from my previous comments that I believe that literate
programming is also applicable to data. Many people already do
it. There are many tools like [Jupyter](https://jupyter.org/) for
Python<sup><a href="#fn1" id="ref1">1</a></sup> and
[R-markdown](https://rmarkdown.rstudio.com/) for R<sup><a href="#fn1"
id="ref1">1</a></sup>, which create a notebook like interface where
text and code and data and the output of the code are put together in
a single document.  It's the ultimate expression (in science) of the
computing concept of
[*single source of truth*](https://en.wikipedia.org/wiki/Single_source_of_truth),
which applies doubly to data science. It's also *literate data.*

You see these ideas more and more in places like
[Kaggle](https://www.kaggle.com). For instance one of the
[superhero datasets](https://www.kaggle.com/claudiodavi/superhero-set/kernels)
on Kaggle has a set of 29 "kernels" (mostly in Python, but 3 in R). On
Kaggle a [kernel](https://www.kaggle.com/docs/kernels) is a script or
notebook (a R-markdown or Jupyter notebook) for exploring a dataset or
providing a solution to one of Kaggle's competitions. If Kaggle get's
around to providing an interface for Julia then I plan to have a go,
but they don't have one yet (see
[this link](https://www.kaggle.com/getting-started/63895) or
[this one](https://discourse.julialang.org/t/getting-julia-support-to-kaggle/2121/6)).

These are a very cool form of **hybrid-texts**, which is one of the
[themes](/posts/description/) underlying this whole blog.
 
Many of the ideas of reproducible research stem from a 1992
[paper](http://sepwww.stanford.edu/doku.php?id=sep:research:reproducible:seg92)
by Jon Claerbout and Martin Karrenbach. Their idea of reproducibility
was that documents allow a user to reconstruct the figures themselves
using only the document (and its included code and data), which is
what many of these notebook environments do. This type of
interactivity is neat, but even they acknowledge that interactivity is
not reproducibility. There are two separate pieces: the interactive,
recreation component and the "sharing" component, with a combined
notepad environment making integration easy. At the moment though, I
just want to pursue the sharing part of the story, with a little of
the recreation (and more to come later).

That brings us to [Hugo](https://gohugo.io/), the web page generator I
am using. Hugo isn't bad for creating interactivity
(with a bit of Javascript) but it isn't immediately set up for
reproducibility/sharing. Obviously, I can create links to data, but
manual links break. I want data and links to sync. Here's a bit of
help doing that.

# Hugo

[Hugo](https://gohugo.io/) is the **static** web page generator I am
using for this page. It's an incredible tool. It let's you write in
[markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
(instead of HTML), and automatically puts all the right pieces around
each page to give you a thematic look and feel. I started with the
[Dream-Plus](https://github.com/UtkarshVerma/hugo-dream-plus) theme,
but I couldn't stop myself tinkering with it.

I'd like to use Hugo and the web as one of my instruments to document
the data I am working with. Notebooks are a great tool, but they have
limits, and sometimes I think they encourage poor programming style
and/or poor writing style. With Hugo, I can organise my thoughts in
the order I want them in, not the order the code imposes.

But Hugo is a **static** page generator.  A static web page generator
does all of the page generation in the background, generating HTML
that you deploy to a server. It's done off-line, as opposed to dynamic
web pages. When there is some data underlying the web pages, one might
more typically use dynamic pages, e.g., via SQL/PHP scripts that query
a database and generate the page based on the results.  But my
datasets aren't changing all the time, so I don't need to dynamically
generate a new page any time someone wants to look at it. I do,
however, want to be able to display aspects of the data, and link to
its source, so that a user can play with it themselves.  Hugo comes
with methods to create
[data-driven content](https://gohugo.io/templates/data-templates/#data-driven-content),
and the one I have exploited is `getCSV`, which, as the name says,
gets a CSV file, which you can then play with, for instance, many of
the tables shown in this blog were generated direct from the CSV
files.

The Hugo docs give some
[examples](https://gohugo.io/templates/data-templates/#example-for-csv-files)
of how to do that. However, one thing that frustrated me was that
their example assumed a fixed number of columns in the file, and
didn't do nice headers. So I wrote a `CSV to HTML table` converter
script. To use it, put the following shortcode into your "shortcodes"
directory (mine is `ROOT/layouts/shortcodes/`). You can download it directly
[here](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Code/Hugo/csv_table.html). 

{{% render-code file="layouts/shortcodes/csv_table.html" language="go" %}}

The main component of the script is just reading the CSV file using
`getCSV` and iterating over it to put it into an HTML table. The
earlier chunks are reading named parameters, checking the file exists,
and fixing local URLs. It puts the table inside the HTML link supplied
(or links to the file if it is in Hugo's static directory). It can
change the style of the columns, and it can plot a limited number of
lines of the file.

There's a few things that can be improved about this, but its a work
in progress. That's the nice thing about this way of building a page,
I can update the script, and then rebuild everything, and you will
have the new script automatically appear in the page<sup><a href="#fn2" id="ref2">2</a></sup>.

Once you put the script (as `csv_table.html`) in your shortcodes
directory, and a file into a subdirectory of Hugo's static directory,
e.g. `/static/csv/marvel_graph_degree.csv`, then put into your
markdown document a line like

```GO
{{%/* csv_table src="/static/csv/marvel_graph_degree.csv" */%}}
``` 

or with more options (e.g., for format, and the number of lines to read)

```GO
{{%/* csv_table src="/static/csv/cast_path.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_path.csv" maxLines="7" colStyle="text-align:left;" */%}} 
``` 

It should create a table, and build HTML links to the file that looks
like

{{% csv_table src="/static/csv/cast_path.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_path.csv" maxLines="7" colStyle="text-align:left;" %}} 

The link I set up here goes to my
[GitHub repository](https://github.com/mroughan/AlephZeroHeroesData)
where I am planning to keep the data. I could keep it local to the web
site, but GitHub has the advantage of version control, which is just
as important for data as it is for code. It has the disadvantage that
I can't keep big data there, so I may explore some other options in
the future, but this works for the small datasets I am dealing with at
the moment.
 
The next thing for me is to make this "live" by adding some
auto-generated content, e.g., the figures, direct from Julia scripts
(such that they are generated and included into the pages at compile
time). I haven't quite progressed that far. I am still learning, but I
can see a few approaches that might work. You'll also note that I
haven't added all of my code to the repo yet. I need to leave
something for next week ;-)
 
# Summary

We all, data scientists, computer scientists, mathematicians and
statisticians need to be working towards more reproducible
research. Data sharing is a key part of this, but data to be shared
should be explained. But I am not a didactic fool. This should happen
through better tools and improved practices, but won't happen
instantly. So today I have presented one small piece to help.

I'm still working towards making this site truly reproducible. There
are more pieces to come. Ideally, the static generator would actually
rerun the code creating the plots when creating the pages. I believe
[blogdown](https://bookdown.org/yihui/blogdown/) can do that (and it
uses Hugo), so there is way forward, but I want to do it with Julia,
and some other pieces of my own stuff.

---

Footnotes:

  1. {{<raw>}} <div id="fn1">
  
	 Both Jupyter and R-markdown support languages other than just Python, including
	 Julia! But I haven't used these extensively yet. Seems like a
	 good topic for a future post.
	 
      <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> {{</raw>}}


  2. {{<raw>}} <div id="fn2">
  
	 The code is included using another shortcode called `render-code`
	 that comes from https://it.knightnet.org.uk/kb/hugo/hugo-snippets/#shortcode-to-render-a-code-example-in-a-pagepost
	 
      <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> {{</raw>}}

