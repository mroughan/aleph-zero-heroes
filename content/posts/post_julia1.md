---
title: "Julia (Part I): Web APIs"
author:
  name: "Matt Roughan"
  desc: " " 
date: 2019-02-25
description: "Getting data into Julia from the web."
categories: ["Julia"]
tags: ["Julia"]
# cover: "https://julialang.org/v2/img/logo.svg" 
cover: "/img/julia_logo.svg" 
featuredImage: "/img/julia_logo.svg" 
featuredImageDescription: ", <a href=\"https://julialang.org/v2/img/logo.svg\">the Julia programming language.</a>"
draft: false 
---

# Julia for Data Science

Data science has a major component that is computational. You can't do
very much with just a pen and paper. Luckily there are some great
programming languages available. The best known these days is Python I
guess, with R a close runner up (it's a favourite of the stats
community). There are a dozen others. 

The up-and-coming new kid on the block is [Julia](https://julialang.org/). She doesn't have as
much history. She doesn't have as large a community, but she does have
some great features.

I'm a novice with Julia. I've been tracking it for a while (since
about v0.3) but in a low-key way. And I don't get as much time to
write code these days as once I did. But now that v1.0 has been
released, I think it is time to step up the pace, and learn some
more. And the best way to really learn something is to try to explain
it. As Neil Gaiman says in *The View From the Cheap Seats*

> I write to find out what I think about something.

So in that vein I plan to write some posts about things we can do with
Julia (and why it was a good idea to do it that way). I don't expect
that these will win plaudits from the Julia community, naive as they
may be. However, they may be useful to learners like me.

Having said that, this is not going to be a "how to code" blog. I
expect the readers to have familiarity with many of the concepts, and
enough skill to get started. Julia has really good online help, and
instructions for installation, and the basic docs for most packages
will let you know how to install them. Here's some starting points:

+ [Julia by Example](https://juliabyexample.helpmanual.io/)

+ [Quantitative Economics](https://lectures.quantecon.org/jl/)

+ [Learn X in Y minutes](https://learnxinyminutes.com/docs/julia/)

+ [Learn Julia the Hard Way](https://github.com/chrisvoncsefalvay/learn-julia-the-hard-way)

So I will start assuming some of the basics are taken care of.


## Using Julia to Extract Data from a Web API

I've called this a blog about math and superheroes, or more
vaingloriously about [large-scale hybrid narratives](/posts/description/) but
really it's about data science. The first thing we need for data
science is that data. We could compile it ourselves, and in some cases
I shall, but there is a **lot** already available, so I thought a good
starting point was to see how to get it. 

Let's start on the code by grabbing the data for the MCU table in my
[first MCU post](/posts/post_mcu1/). It comes from
[OMDb](http://www.omdbapi.com/) an open API to a database similar to
the familiar [IMDb](https://www.imdb.com/). It's a
[RESTful](https://searchmicroservices.techtarget.com/definition/RESTful-API)
web service, so it's very easy to use. You need to sign up and get
your own API key to use it properly, but that wasn't hard. Then you 
generate web requests for information, with a free 1000 requests per
day.

Making those requests in Julia is simple using the `HTTP` package, and
the results are returned as [JSON](https://www.json.org/) which can be
interpreted using the package of the same name. So a simple function
to download the information on a movie, and return it as a `Dict` is 

```julia
function get_ombd_by_title_and_year( title::String, 
                                      year::Int, 
                                      yourkey::String )
    url_base="http://www.omdbapi.com/?apikey=$(yourkey)&"
    stitle = replace(title, ' ' => '+')
    query = "$(url_base)r=JSON&t=$(stitle)&y=$(year)"
    response = HTTP.request("GET", query)
    if response.status == 200
        s = String(response.body)
        J = JSON.parse(s)
        if parse(Bool, lowercase(J["Response"]))
            return J
        else
            error("Warning:  OMDb response error = $(J["Error"])")
        end
    else
        error("Warning: HTTP response = $(response.status)")
    end
end
```
I'm not going to try to explain every line here. It seems pretty
readable  to me, but a few notes:

+ `HTTP.request` does all the painful stuff of creating and managing 
  the request to the server, and compiling the results into the
  `response`, whose `status` is the HTTP return code (200 is good),
  and whose `body` contains the data. We convert it to a string, and
  then interpret the string using the `JSON` package.

+ The dollar sign inside a string means that we are replacing a
  variable name with its value (string interpolation), so the first
  few lines are just to construct the query string, coincidentally
  called `query`. 
  
+ Julia is not an OO language, so commands like `HTTP.request()` are
  just fully qualified function names, e.g., this the `request` function
  from the `HTTP` module, not a method for an instance of the HTTP
  class. 
  
+ Indentation is optional (in case you come from a Python
  background). 
  
+ The code `parse(Bool, lowercase(J["Response"]))` is just my clumsy
  way of converting a string `"True"` into the `Bool` value
  `true`. There must be a nicer way to do that?

Put this into your REPL, or load it from a script. You need your own
API key (where my code says `yourkey`), and then we 
call it with
```julia
julia> using HTTP
julia> using JSON
julia> record = get_ombd_by_title_and_year("The Avengers", 2012, yourkey)
```

The Julia REPL will then output the
[dictionary](https://en.wikibooks.org/wiki/Introducing_Julia/Dictionaries_and_sets)
`record`, and you can see the information available in
OMDb. Dictionaries are a nice data structure for working with textual
data (I learned about them in Perl where they are called hashes, and
they are one of the things that made Perl so useful in its day). If
you are doing data science, you need to be able to work with
dictionaries. 

If you set yourself up with a vector of titles and years, and iterate
this function, you can download a sheaf of data. I'll talk about how
to print it out in later episodes (I'm not quite happy with the way I
am doing it yet). But for your enjoyment,
[here is a CSV file](../../csv/imdb_data.csv) containing some of the data I
downloaded from OMDb, and which went into the table above. It also has
some (mostly empty) rows for hypothetical future movies. 

In general I plan to put all of my data up, and if you want the whole
set rather than getting it in bits and pieces then got to my
[GitHub repo](https://github.com/mroughan/AlephZeroHeroesData).

So that's it. It was incredibly easy to get started downloading
data. It can be more complicated if the data is stored in a more outre
format, but JSON has become the flavour of the moment, so it has a ton
of support. It is also true that just creating the dictionary of the
data doesn't mean you understand what is in the data. Good sources of
*metadata* are also crucial for any dataset, but in this case, all of
that was pretty easy.

# Summary

I am still a learner (RE Julia), so I can't claim this is the best
possible code. In general I try to write clear code rather than
optimising it to be super-fast, and I certainly don't know all the
Julia tricks yet. The point is just to illustrate how easy getting
data from a web API can be using the correct packages.

I'll be using variants of this code again and again I suspect, so in
some sense this post is here to help remind me how to do it.
