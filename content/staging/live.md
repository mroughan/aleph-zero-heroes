live documents


That means that as
you update the data or the code, the figures are automatically
recomputed.  Combine this with the idea of a *live document*<sup><a
href="#fn2" id="ref2">2</a></sup> -- a document that can be edited and
updated consistently, and we have an amazing tool for working with
data.  We also get to absorb the idea that documenting code, and
documenting data are really the same activity!

 
Eventually,
I hope that scientific journals will not accept static texts at all. They
will only accept self-supporting live documents. I'm not the only
person to be thinking in this direction:


There models and specifiers for maturity and type of reproducibility,
e.g.,
[see this](http://ropensci.github.io/reproducibility-guide/sections/introduction/). 
There are many ideas and models for open science, and subtle
distinctions made between words such as
[reproducible v replicable](http://languagelog.ldc.upenn.edu/nll/?p=21956). I'm
not interested in that distinction, but it is important to understand
that

That way I can ensure that the displayed data and the files I'm
handing out are synchronised.


 So, any in
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

  2. {{<raw>}} <div id="fn2">
  
	  I make the distinction here between a *living* document, and a
	  *live* document. The former is, for instance a wiki page, which
	  is continuously updated and edited. The latter is a document
	  that could be living, but doesn't have to be. 
	  
      <a href="#ref2" title="Jump back to footnote 2 in the text.">↩</a></div> {{</raw>}}

