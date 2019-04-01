---
title: "The Incredible Hugo"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-04-01
lastmod: 2019-04-01 18:13:29
description: "Using Hugo for data-science and reproducible research: literate Programming and live documents"
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
of literate programming to live documents.

[Literate programming](www.literateprogramming.com/) is a radical idea
put forward by Knuth that computer program shouldn't just be
commented. They should be a readable document that contains code.

That doesn't initially sound radical, but it is. Programmers still,
despite decades of education, usually document code as an
afterthought. Documentation is, however, crucial for good code. It
makes it easier to debug, to use and reuse and to maintain the
code. Literate programming insists that the documentation is part of
the program. 

The idea of literate programming didn't take off initially, but there
are more and more tools that support some of the
ideas. [Julia uses markdown](https://docs.julialang.org/en/v1/manual/documentation/index.html)
to automatically create the online help information about functions,
variables and modules. This is lightweight, easy to use, and very,
very helpful when done well.

Take this one step further and you see tools like
[Jupyter](https://jupyter.org/)<sup><a href="#fn1"
id="ref1">1</a></sup> for Python and
[R-markdown](https://rmarkdown.rstudio.com/) for R, which create a
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

In essence, live documents are the ultimate **hybrid-text** which is
one of the themes underlying this whole blog, and something I believe
in deeply. 

# Hugo

That brings us to [Hugo](https://gohugo.io/), the **static** web page
generator I am using for this page.

It's a great tool. It let's you write in
[markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
(instead of HTML), and automatically puts all the right pieces around
each page to give you a thematic look and feel. And you can choose
themes -- I started with [Aether](https://themes.gohugo.io/aether/)
because of it's clean, simple and fast, but I couldn't help myself
from modifying it.

But it is a **static** page generator.  A static web page generator
does all of the page generation in the background. So, any "liveness"
on the pages is in the client, via Javascript or the like. The server
passively serves up the pages Hugo builds. So the page isn't "live".

We can get some of these features using some of the cool Javascript
libraries, but to be honest I try to minimise these because there are
people (for instance me) who turn off Javascript by default for
security reasons. I don't want the entire web to disappear for such
people. Also, true live pages with even moderately sized datasets are
going to be slow and unresponsive. 

So I am aiming at a compromise here. 

Hugo comes with methods to create [data-driven
content](https://gohugo.io/templates/data-templates/#data-driven-content),
and the one I have exploited is `getCSV`, which, as the name says,
gets a CSV file, which you can then play with, for instance, many of the
tables shown in this blog were generated direct from the CSV files.

That way I can ensure that the displayed data and the files I'm
handing out are synchronised.

The Hugo docs give some
[examples](https://gohugo.io/templates/data-templates/#example-for-csv-files)
of how to do that. However, one thing that frustrated me was that
their example assumed a fixed number of columns in the file, and
didn't do nice headers. So I wrote a general CSV to table converter
script. To use it, put the following shortcode into your "shortcodes"
directory. You can download it directly
[here](../../code/csv_table.html). 

```
{{ if .Get "src"}}
   {{- $src := .Get "src" -}}
   {{ if (fileExists $src) -}}
<a href="{{ replace $src "static/" "" | absURL}}">
<div align=center>   
<table style="font-size:.7em">
  {{ $sep := "," }}
  {{ $csv :=  getCSV $sep $src }} 
    {{ range $i, $r := (first 1 $csv) }} 
    <thead><tr>
       {{ range $j, $s := $r}}
        <th style="text-align:left;">{{ humanize $s }}</th>
       {{ end }}
    </tr> </thead>
    {{ end }}
    {{ range $i, $r := (after 1 $csv) }}
       <tr>
       {{ range $j, $s := $r}}
          <td> {{ $s }} </td>
       {{ end }} 
       </tr> 
    {{ end }}      
</table>
</div>
</a>
   {{- end }}
{{ else }}
   no parameter SRC
{{ end }}
```

There's probably a few things that can be improved about this, for
instance, allowing some formatting options to be passed in, or
checking that the file exists, but in the spirit of living documents,
I plan to update this a little later. Once it is in your shortcodes
directory, put a line like

```
{{%/* csv_table src="static/csv/marvel_graph_degree.csv" */%}}
```

into the page you area building, where the src is the relative path
from the Hugo directory where you are building your work. It should
create a table, and build HTML links to the file.

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

---

Footnotes:

  1. {{<raw>}} <div id="fn1">
  
	 BTW, Jupyter supports languages other than just Python, including
	 a version for Julia!
	 
      <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div> {{</raw>}}


  1. {{<raw>}} <div id="fn2">
  
	  I make the distinction here between a *living* document, and a
	  *live* document. The former is, for instance a wiki page, which
	  is continuously updated and edited. The latter is a document
	  that could be living, but doesn't have to be. 
	  
      <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> {{</raw>}}

