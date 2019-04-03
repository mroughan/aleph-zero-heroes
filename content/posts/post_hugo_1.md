---
title: "The Incredible Hugo"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-04-03
lastmod: 2019-04-03 12:37:31
description: "Literate programming and live documents: using Hugo for reproducible research."
categories: ["Code"]
tags: ["hugo"] 
cover: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/landscape_incredible.jpg" 
featuredImage: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/landscape_incredible.jpg" 
featuredImageDescription: ": The Incredible Hulk, provided by Marvel ©"
draft: true 
---

# Literate Programming and Live Documents

I think one of the ideas that will have the largest, long-term impact
of science in general, and data-science in particular is the extension
of literate programming to live documents because they enable true
[reproducible research](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research).

[Literate programming](www.literateprogramming.com/) was a radical idea
put forward by Knuth that a computer program shouldn't just be
commented. They should be a readable document that contains code.

That doesn't initially sound radical, but it is. Programmers still,
despite decades of education, usually document code as an
afterthought. Documentation is, however, crucial for good code. It
makes it easier to debug, to use and reuse and to maintain the
code. Adding (often trite, ignorable) comments after the fact does not
generally achieve these objectives.  Literate programming insists that
the documentation is part of the program and created alongside it.

The idea of literate programming didn't take off initially, but there
are more and more tools that support some of its
ideas. [Julia uses markdown](https://docs.julialang.org/en/v1/manual/documentation/index.html)
to automatically create the online help information about functions,
variables and modules. This is lightweight, easy to use, and very,
very helpful when done well.

Take this one step further and you see tools like
[Jupyter](https://jupyter.org/) for Python<sup><a href="#fn1" id="ref1">1</a></sup> and
[R-markdown](https://rmarkdown.rstudio.com/) for R<sup><a href="#fn1" id="ref1">1</a></sup>, which create a
notebook like interface where text and code and data and the output
of the code are put together in a single document. That means that as
you update the data or the code, the figures are automatically
recomputed.  Combine this with the idea of a *live document*<sup><a
href="#fn2" id="ref2">2</a></sup> -- a document that can be edited and
updated consistently, and we have an amazing tool for working with
data. It's the ultimate expression (in science) of the computing
concept of [*single source of truth*](https://en.wikipedia.org/wiki/Single_source_of_truth), which applies doubly to data
science. We also get to absorb the idea that documenting code, and
documenting data are really the same activity!

In essence, live documents are the ultimate **hybrid-text** which is
one of the themes underlying this whole blog, and something I believe
in deeply. 
 
You see these ideas more and more in places like
[Kaggle](https://www.kaggle.com), for instance one of the
[superhero datasets](https://www.kaggle.com/claudiodavi/superhero-set/kernels)
on kaggle has a set of 29 "kernels" (mostly in Python, but 3 in R). On
Kaggle a [kernel](https://www.kaggle.com/docs/kernels) is a script or
notebook (a R-markdown or Jupyter notebook) for exploring a dataset or
providing a solution to one of Kaggle's competitions. If Kaggle get's
around to providing an interface for Julia then I plan to have a go,
but they don't have one yet (see
[this link](https://www.kaggle.com/getting-started/63895) or
[this one](https://discourse.julialang.org/t/getting-julia-support-to-kaggle/2121/6)).

[Reproducible research](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research)
requires these ideas. Too often scientist publish a paper, without revealing
their data, or providing their code, and at best this slows down
science. At worst it enables incompetence and fraud. I think reproducible research is
best summarised by the following quote from Buckheit and Donoho:

> An article about computational science in a scientific publication
>   is not the scholarship itself, it is merely advertising of the
>   scholarship. The actual scholarship is the complete software
>   development environment and the complete set of instructions which
>   generated the Figures.


Many journals are pushing for the publication of data associated with
a paper. Some are pushing for code to also be published.  Eventually,
I hope that scientific journals will not accept static texts at all. They
will only accept self-supporting live documents. I'm not the only
person to be thinking in this direction:

+ [World Bank Statement](https://dimewiki.worldbank.org/wiki/Reproducible_Research)
+ [Open Science](https://mg.readthedocs.io/reproducible_research.html)

There models and specifiers for maturity and type of reproducibility,
e.g.,
[see this](http://ropensci.github.io/reproducibility-guide/sections/introduction/). 
There are many ideas and models for open science, and subtle
distinctions made between words such as
[reproducible v replicable](http://languagelog.ldc.upenn.edu/nll/?p=21956). I'm
not interested in that distinction, but it is important to understand
that
[interactivity is not reproducibility](http://sepwww.stanford.edu/doku.php?id=sep:research:reproducible:seg92). The
core idea of that work (from way back in 1992 by Jon Claerbout and
Martin Karrenbach) was not that the document be interactive but that a
user can reconstruct the figures themselves using only the document
(and its included code and data).  

That brings us to [Hugo](https://gohugo.io/), the **static** web page
generator I am using for this page. Hugo isn't bad for creating
interactivity (with a bit of Javascript) but it isn't immediately set
up for reproducibility. 

# Hugo

[Hugo](https://gohugo.io/) is the **static** web page generator I am
using for this page. It's a great tool. It let's you write in
[markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
(instead of HTML), and automatically puts all the right pieces around
each page to give you a thematic look and feel. And you can choose
themes -- I started with
[Dream-Plus](https://github.com/UtkarshVerma/hugo-dream-plus), but I
couldn't stop myself tinkering with it.

But it is a **static** page generator.  A static web page generator
does all of the page generation in the background. So, any "liveness"
on the pages is in the client, via Javascript or the like. The server
passively serves up the pages Hugo builds. So the page isn't "live".

We can get interactivity using some of the cool Javascript libraries
out there. I don't want to overuse these because there are people (for
instance me) who turn off Javascript by default for security
reasons. I don't want the entire web to disappear for such
people. Also, true live pages with even moderately sized datasets are
going to be slow and unresponsive.  So I am aiming at a compromise
here. I plan to use Javascript from some common libraries (PlotlyJS in
particular) to create some of the plots, but not to go all in on all
the fancy things we could do.

And that still doesn't address reproducibility. Ideally, a user could
recreate the plots and results. I don't know whether I care to make
that an automated process, but I certainly want to link the exact data
to the outputs I show, so that a user can play with it themselves.
Hugo comes with methods to create
[data-driven content](https://gohugo.io/templates/data-templates/#data-driven-content),
and the one I have exploited is `getCSV`, which, as the name says,
gets a CSV file, which you can then play with, for instance, many of
the tables shown in this blog were generated direct from the CSV
files.

That way I can ensure that the displayed data and the files I'm
handing out are synchronised.

The Hugo docs give some
[examples](https://gohugo.io/templates/data-templates/#example-for-csv-files)
of how to do that. However, one thing that frustrated me was that
their example assumed a fixed number of columns in the file, and
didn't do nice headers. So I wrote a general CSV to table converter
script. To use it, put the following shortcode into your "shortcodes"
directory. You can download it directly
[here](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Code/Hugo/csv_table.html). 

{{% render-code file="layouts/shortcodes/csv_table.html" language="go" %}}

The main component of the script is just reading the CSV file using
`getCSV` and iterating over it to put it into an HTML table. The
earlier chunks are reading named parameters, when they are set,
checking the file exists, and fixing local URLs. 

There's a few things that can be improved about this, but its a work
in progress. That's the nice thing about this way of building a page,
I can update the script, and then rebuild everything, and you will
have a link to the new script!

Once you put the script (as `csv_table.html`) into your shortcodes
directory, put a line like

```GO
{{%/* csv_table src="/static/csv/marvel_graph_degree.csv" */%}}
``` 

or with more options

```GO
{{%/* csv_table src="/static/csv/cast_path.csv" link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/MarvelCinematicUniverse/cast_path.csv" maxLines="7" colStyle="text-align:left;" */%}} 
``` 

into the page you are building, where the `src` is the path from the
Hugo directory where you are building your work. It should create a
table, and build HTML links to the file. The latter (in my case) links
to my
[GitHub repository](https://github.com/mroughan/AlephZeroHeroesData) 
where I am planning to keep the data. I could keep it local to the web
site, but GitHub has the advantage of version control, which is just
as important for data as it is for code. It has the disadvantage that
I can't keep big data there, so I may explore some other options in
the future, but this works for the small datasets I am dealing with at
the moment.

The next thing for me is to add some auto-generated content direct
from Julia scripts (such that they are generated an included into the
pages at compile time). I haven't quite progressed that far, but I can
see a few approaches that might work.
 
# Summary

We all, data scientists, computer scientists, mathematicians and
statisticians need to be working towards more reproducible
research. But I am not a didactic fool. This should happen through
better tools and improved practices, but won't happen instantly. So
today I have presented one small piece to help. 

I'm still working towards making this site truly reproducible. There
are more pieces to come. Ideally, the static generator would actually
rerun the code creating the plots when creating the pages. I believe
[blogdown](https://bookdown.org/yihui/blogdown/) can do that (and it
uses Hugo), so there is way forward, but I want to do it with Julia,
and some other pieces of my own stuff.

---

Footnotes:

  1. {{<raw>}} <div id="fn1">
  
	 BTW, both Jupyter and R-markdown support languages other than just Python, including
	 Julia! But I haven't used these extensively yet. Seems like a
	 good topic for a future post.
	 
      <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> {{</raw>}}


  1. {{<raw>}} <div id="fn2">
  
	  I make the distinction here between a *living* document, and a
	  *live* document. The former is, for instance a wiki page, which
	  is continuously updated and edited. The latter is a document
	  that could be living, but doesn't have to be. 
	  
      <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> {{</raw>}}

