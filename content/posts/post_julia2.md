---
title: "Julia (Part II): Data Structures for Data Science"
author:
  name: "Matt Roughan"
  desc: " "
date: 2019-03-12 
lastmod: 2019-03-21 10:01:32
description: "Julia dictionaries, data frames and how to read CSV data files into these data structures."
categories: ["Code"]
tags: ["Julia"]
cover: "/img/julia_logo.svg" 
featuredImage: "/img/julia_logo.svg" 
featuredImageDescription: ", <a href=\"https://julialang.org/v2/img/logo.svg\">the Julia programming language.</a>"
draft: false 
---  
 
<div style="color: red">Spoilers Warning</div>
   
# Intro   

I mentioned in my [last post](/posts/post_julia1/) on
[Julia](https://julialang.org/) that dictionaries are incredibly
useful data structures for data science. I thought that warranted a
little more discussion. And it leads to another data structure that we
use a lot: Data Frames. They're the topic for today.

# Dictionaries

A *dictionary* (in computer programming) is much like an English
dictionary. It takes a set of objects (the *keys*) and maps them to
something else (the *values*). In an English dictionary the
object/keys are *words* and they are mapped to values called
*definitions*, but in programming the objects could be any type of
data.

Dictionaries are also called
[*associative arrays*](https://en.wikipedia.org/wiki/Associative_array)
because we can conceptualise them as a generalisation of a standard
array. In a standard array the *indexes* are contiguous integers
usually starting at either 0 or 1. In a dictionary, the indexes can be
almost anything we like. The dictionary *associates* the key/index
with the value.

In Perl, dictionaries are called *hashes* because a common underlying
data structure used to implement many dictionaries is a *hash table*
but this terminology is confusing. The term hash get's used for way
too many thing already. And this isn't the only way to implement a dictionary. 

In Julia a dictionary is called a <a
href="https://en.wikibooks.org/wiki/Introducing_Julia/Dictionaries_and_sets" target="_blank">Dict</a>. They're
a core part of the language, so you don't need to include any special
packages to use them. Critical things to know include:

+ The keys and values of a Dict can be almost anything but keys have
  to have an associated hash function so if you create a new data
  type, you may need to define this. My strategy has been to define
  hash functions recursively in terms of hashes that already
  exist. Hash functions are useful enough that I will do a post on
  these at some point.
  
+ If we restrict the types of the entries we can make the dictionary
  much more efficient, so it usually better to have some control, not
  just blurt stuff into it.

+ Dictionary elements are not sorted (there is a sorted version of the
  dictionary, but that has an associated computational cost to keeping
  things in order).

### Operations and functions

The operations we need to learn for a dictionary are given below. 

+ **Creation** of a new dictionary. Julia's uses constructor functions
  to create new variables, the standard syntax being the name of the
  datatype ```Dict``` following by the input arguments in round
  braces. Types specified in curly braces before the input arguments
  provide extra information so that a more specific constructor can be
  used to construct a more efficient variable.

```julia
julia> D = Dict{String, Int}()                # create an empty dictionary
julia> D = Dict("a" => 1, "b" => 2, "c" => 3) # start the dictionary with some pairs
julia> dict = Dict(string(i) => sind(i) for i = 0:5:360) # comprehension-like syntax
```

+ **Addition** of a `(key,value)` pair.  Julia uses square braces for
   indexing into arrays (associative or otherwise) so this notation is
   pretty consistent. Unlike Matlab you can't just add a new element
   to a standard array, but you can to an associative array
   (a Dict). This is deliberate -- to understand why, you should learn
   about the underlying implementations.

```julia
julia> D["d"] = 59     # assign the value 59 to the key "d"
```
 

+ **Removal** of a `(key,value)` pair uses the ```delete!```
  function. The exclamation mark in the name is a Julia idiom to
  indicate that the function operates on the input variable in place. 

```julia
julia> delete!(D, "d") # remove the key "d" from Dict D
```

+ **Lookup** the `value` associated with a `key`. There are a few
  approaches to find the value or test if it exists. I doubt I am
  listing them all below, but it's enough to get going. 

```julia
julia> D["a"]         # get the value associated with key "a"
julia> haskey(D, "a") # check if the key "a" is in the dictionary
julia> get(D, "a", 0) # look up key "a", with fallback value of 0 it if is absent
```

+ **Update** of the value associated with a key. Often programming
  languages combine the update and insertion operations, as does
  Julia, for instance, we can update the value corresponding to key
  "d" using ```D["d"] = 60```.

Other useful functions are

+ `keys` and `values` which return  iterators over the keys and values
  respectively. Use `collect` to get an array from the iterator, or iterate
  over it using a for loop.

+ Set operations such as `union`, `setdiff` and `intersection` should
  also work, but return an array of Pairs, not a dictionary. They have
  to because the keys in the two dictionaries might not be unique, and
  the non-unique keys might be associated to different values.
  
+ `map` and `filter` can also be used, though I think that is a whole
  other post because these functions are not just about dictionaries. 

### Sorting

Dictionaries are not sorted, so one snippet of code I find often
useful is to obtain dictionary elements in some order, in this case in
the reverse order of the values of `D`.

```julia
julia> sort(collect(D), by = tuple -> last(tuple), rev=true)
```

The last argument says to sort in reverse order, and isn't needed.
The `by` argument is specifying a function that is being used to
output a sortable index (presuming that the values are such). The
`collect` function converts the dictionary into an array of
pairs/tuples<sup><a href="#fn1" id="ref1">1</a></sup>, which is then
sorted based on the last elements of those tuples. The output is also
as an array of Pairs. 


### An Example

Before we move on, I wanted to give a real example of how I use
dictionaries here. I mentioned [earlier](/posts/post_mcu_timeline1/)
that I constructed an [aliases file](/csv/alias_list.csv). It is a CSV
file with two columns, one of canonical character names, and the other
a list of aliases.  Here's the first few entries, and you can click on
the table to get the whole file.

{{% csv_table src="static/csv/alias_list.csv"  maxLines="7" colStyle="text-align:left" %}} 

Converting the cast lists from IMDb requires us to read the aliases
and generate a dictionary containing a mapping from each alias to the
unique name we are going to use for each character. That is we create
a dictionary called `Aliases` that has character aliases as keys, and
the canonical character name as the value.

```julia
using DataFrames
using CSV
function read_aliases( file::String = "../Data/alias_list.csv")
    aliases = CSV.read( file; comment="#" )
    Aliases = Dict{String, String}()
    for r in eachrow(aliases)
        c = strip( r[:Character] )
        for a in split( r[:Aliases], "," )
            Aliases[ lowercase(strip(a)) ] = c
        end
    end
    return Aliases
end
```

The dictionary I want is returned as `Aliases` but there are other
useful pieces in this function:

+ The CSV file is read into `aliases`, which is a `DataFrame` with two
  columns: the first is a list of character names, and the second
  contains a list of comma-separated lists of aliases. We'll talk more
  about Data Frames in just a second.

+ The `strip` function removes leading and trailing spaces from a
  string -- usually a good idea for this type of thing. I use this
  function a lot in text processing, and there are `lstrip` and
  `rstrip` variants that act on only one end of the string.

+ I convert all the aliases to lowercase, so I don't need equivalent
  lower case versions.

+ The `split` function splits a string according to some delimiter, in
  this case a comma, and returns a vector. This is another function I
  use again and again.

Julia now has great on-line help for common functions. You can access
it by typing a `?` and then the name of the function.

# Data Frames 

I just mentioned Data Frames, so I had better explain myself. 

Dictionaries are a built-in data type in Julia. They map a key to a
value. In some sense they are one-dimensional. 

Many sets of data are a 2D table. They have a set of columns each
corresponding to a *variable* and each row is a set of *observations*
of those variables. So we might, by default store these in a 2D array
of numbers. But wouldn't it be great if the columns were named after
the variable they represent. 

Data Frames are exactly that, and they use dictionaries to do it. A
Data Frame is (simplistically) just a dictionary whose keys are the
variables, and whose columns are the values associated with each. But
Data Frames are a little bit more than this: the columns are all the
same length, so they need to incorporate the idea of missing data, and
there are many operators defined on top of the standard dictionary
operators. 

The upshot is that in one sense Data Frames are really just advanced
tables, but Data Frames are a little cleverer than a simple 2D array
of data.

+ They can contain different types of data in different columns.

+ Unlike a simple 2D array, they have column headings (the `keys`),
  and data can be indexed by these, which means adding a column to a
  dataset is easy, and often doesn't require changes to code.

+ They naturally map to the way we often store data (e.g., in CSV or
  spreadsheet files), so input and output are easy.

+ They allow for missing data, which is endemic in real datasets, in a
  natural and (hopefully) efficient manner. 

+ We can perform joins across them.

+ Data Frames match naturally to the philosophy of 
  <a href="https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html">*Tidy
  Data*</a> 

Julia has a package called, naturally enough `DataFrames`, and in
conjunction with a few other bits and pieces (in particular the `CSV`
package) it's very powerful. So here's a few steps to using it. BTW, I
assume you lot can read the docs and install a package. Sound fair?

Included below is a simple set of code I've been using to learn how to use Data
Frames in
Julia. [Data Frames](http://adv-r.had.co.nz/Data-structures.html#data-frames)
are an idea that comes from the programming language
[R](https://www.r-project.org/).

With the `CSV` package it is very easy to read in a CSV file into a
Data Frame. For instance, download the file
[movie_sequence.csv](/csv/movie_sequence.csv), and try this

```julia
julia> using DataFrames
julia> using CSV
julia> file = "movie_sequence.csv"
julia> movies = CSV.read(file)
```
It should display a table of showing the contents of the CSV file. Now
we can play with this data in many ways. For instance, we can extract
a set of columns using
```julia
julia> movies[ [:Title, :Phase] ]
```
will output just the two selected columns (also in a Data Frame).

And we can do all the standard things you would like to do. Have a
look at the
[DataFrames](https://juliadata.github.io/DataFrames.jl/stable/index.html)
documentation for many more examples and
[here is a handy cheat sheet](https://jcharistech.wordpress.com/julia-dataframes-cheat-sheets/).

The most important thing to grasp is that the data types of the
columns are unions of a standard type, and `Missing`. And each column
is (in some sense) a separate array (each of the same length). So, we
a column of integers might be of type
```julia
	Array{Union{Missing, Int64},1}
```

That is, and 1-D array of elements of type `Union{Missing,
Int64}`. This is important, as it sometimes means we are a bit clumsy
working on these. Julia has many functions defined, for instance, for
integers, but they won't work out of the box on a Union because Julia
uses *multiple dispatch* to select which function is called. It
matches up the types of the arguments to the input parameters, and if
it can't find a matching function there will be an error. I wrote a
few (slightly painful looking) pieces of code to cope with this. For
instance, the following lines strip leading and trailing spaces from
`String` elements, and replace `Missing` elements with an empty
string. 

```julia
function replace_missing!( DF::DataFrame)
    # replace all of the missing strings with blanks, and get rid of leading or trailing spaces
    for (k,s) in eachcol(DF, true)
        if eltype(DF[k]) == Union{Missing, String}
            DF[k] = Array{Union{Missing, String},1}(String.(strip.(coalesce.(s, ""))))
        end 
    end
end
```
I'm guessing the Julia aficionados have a better way of doing the
same, but this is illustrative. breaking it down:

+ `eachcol` iterates through each column of DF returning the key `k`
   and `s` data of the column.
+ `eltype` returns the type and we only both with `Strings`, though
   note we match against `Union{Missing, String}`.
+  `coalesce(value, "")` replaces `Missing` values with the empty
   string. But note we use a standard Julia trick here. If you have a
   function `coalesce` function defined for a type X, then `coalesce.`
   will iterate it over the whole array.
+ `strip.` removes leading and trailing spaces, and we use the "."
  trick again to apply it to the whole array.
+ `String` converts the output from a `SubString` back to
  `String`. Substrings contain a reference to the original, and I
   don't want to hang onto that. 
+ `Array{Union{Missing, String},1}` then maps this back into an array
   of unions (not just an array of strings).

I'm sure the whole thing could be done more easily, probably with a
loop or two, but this seems to illustrate what we are working with
here. 

The real value of Data Frames comes when we want to manipulate and
play with the data. 

I want to use this information to construct the paths for each
character, but first I need to get information about who is who. To do
so, I start with the [OMDb](http://www.omdbapi.com/) data I
[explained in the last Julia post](/posts/post_julia1/), but this data
doesn't include the cast list. It does, however, include the IMDb ID
of the movie. Now IMDb doesn't seem to have a nice API for downloading
data, but there is a nice Python package
[IMDbPY](https://imdbpy.sourceforge.io/) that will do the job I
need. I have a tiny little Python script that uses this package to
download the cast information for each movie.  The data needs a good
deal of cleaning: the most obvious problems are that superheroes come
with aliases. And they are used inconsistently between movies. So I
have a little [full of aliases](/csv/alias_list.csv), and in the text
above I described how to read it into first into a Data Frame, and
thence to a dictionary that maps aliases to their canonical name.

Given that dictionary, I next read in the cast files (once again as
Data Frames), convert the aliases to the canonical character names,
and create a new dictionary mapping each character name to a list (I
don't care how you store the list) containing the titles of the
movies. Then I go through this dictionary and output each character
name, and a sorted version of the list of movies that character is
in. I'd go into more detail, but this is already getting a little
longer than I intended.

There is one problem with this. You **always** need to spend time
cleaning your data. I mentioned these issues in some detail in my
[earlier post](/posts/post_mcu_timeline1/) so I won't again here. 

The final step is to write this out to a new file. I expect there is a
clever way to do that using `CSV.write` but I just iterated over a
cast list, and printed it out line by line. Nothing very clever or
instructive there I'm afraid.  The first few are listed below, and the
file is [here](/csv/cast_path.csv).

{{% csv_table src="static/csv/cast_path.csv"  maxLines="7" colStyle="text-align:left;" %}} 
 
The "codes" column is a mapping of the movies to the codes I gave in
the sequence listing of the movies. It's a key to allow sorting of the
movies in sequential order, but the strings formed by listing the
codes of the movies in the path will be useful to us when we start to
learn more about these paths, the next time we come back to them. 



---

Footnotes:

  1. {{<raw>}}<div id="fn1" class="footnote">

  Tuples and pairs are not the same thing in Julia. A Pair
  is not even a subtype of Tuple.  See <a
  href="https://discourse.julialang.org/t/pair-a-b-vs-tuple-a-b/942"
  target="_blank">`Pair{A,B}` vs. `Tuple{A,B}`</a> for more
  discussion. However, in this example we can act on
  them in the same way.
  
  <a href="#ref1" title="Jump back to footnote 1 in the text.">↩</a></div>
  {{</raw>}}
