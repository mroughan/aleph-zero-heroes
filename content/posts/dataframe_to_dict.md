--- 
title: "DataFrame to Dictionary"
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-11-19
lastmod: 2020-11-19
description: "Conversion of Julia DataFrames to Dictionaries."
categories: ["code"]
tags: ["Julia"]
cover: "img/julia_logo.svg" 
featuredImage: "img/julia_logo.svg" 
featuredImageDescription: ", <a href=\"https://julialang.org/v2/img/logo.svg\">the Julia programming language.</a>"
dropCap: false
draft: false
toc: true
spoilers: false 
---

# Intro

There are two Julia data structures that I use again and again:

1. [Dictionaries](https://docs.julialang.org/en/v1/base/collections/#Dictionaries) 
2. [DataFrames](https://juliadata.github.io/DataFrames.jl/stable/)

Dictionaries are supplied in the Julia distribution as a standard data
type. Data-frames have to be added using the `DataFrames.jl`
package. They are both incredibly useful for reasons I will explain
below.

And one of the things I find almost as useful as either of them by
themselves is the ability to convert from one to another. There are a
lot of discussions online about converting from a dictionary into a
data-frame, and that is conceptually a simple process with one obvious
meaning. For some questions and answers see

+ [Stackoverflow](https://stackoverflow.com/questions/55373875/assigning-a-key-value-pair-from-a-dict-to-a-datadrame-is-not-working-in-julia-1)
+ [Discourse](https://discourse.julialang.org/t/build-dataframe-from-dict/28538)
+ [GitHub](https://github.com/JuliaData/DataFrames.jl/issues/591)

But converting the other way is non-obvious because the conversion
could mean many things. A data-frame can hold a lot more information
than a dictionary so there is likely to be lost information, which is
OK, as long as we decide what to keep and what to lose.

What I want to do, when converting, is usually just count. For
instance, I might have a table of character appearances in a story
held in a dictionary, and I want to count how often each character
appears.

Actually, I want a little more flexibility, but counting is a good
place to start. 

I guess there is already a function out there to do this, but it's
such a simple piece of code I found myself rewriting it each time I
needed it because I forgot where the old version was. There is a
saying in computer science:
[Don't Repeat Yourself (DRY)](https://www.oreilly.com/library/view/97-things-every/9780596809515/ch30.html)
and so rewriting code is not a great idea. At least, in publishing
this, I won't lose it again and maybe it will be useful for someone
else. You can find the code below, but first I wanted to say a little
about why I need this so often.

# Dictionaries

I talked about dictionaries in a [previous post.](/posts/post_julia2/)

Calling a data structure a "dictionary" is a terrible idea. The name
comes from the idea that a dictionary is mapping from a word to a
definition. But a (software) dictionary is much more flexible. It is a
mapping from ANY one data type to ANY other data type. 

What do I mean by "mapping?" It's just a way of describing a one-way
relationship, e.g., 

```julia
  A -> 1
  B -> 2
  C -> 42
```

A dictionary lets me create arbitrary mappings. It can also be thought
of as a way of associating a `key` (A, B and C in the example) with a
`value` (1,2, and 42 in the example).  It's such a useful ability it
appears in most modern programming languages, albeit under many
different names:

+ dictionary (e.g., in Julia and Python)
+ associative arrays or just associations (e.g., in Mathematica)
+ mappings (e.g., in Java and Go); 
+ hashes (e.g., in Perl);
+ and others including cases where the data structure is so fundamental
  it isn't even named. 

Most are derived from what they do (more or less), but the name *hash*
might be a little obscure to non-computer scientists. It comes from
one method used to create a dictionary called a *hash table*. Hash
tables are a common implementation of dictionaries, and the one that
Julia uses (but not the only implementation -- trees have some
advantages).

Dictionaries have many uses, but one noteworthy use is that they are
great for working with various data formats. For example, a
[JSON](https://www.json.org/json-en.html) file can be seen as a
hierarchical dictionary structure (a dictionary with some values that
are dictionaries and so on).

Another common use is to keep counters for a set of keys, e.g.,
imagine creating a frequency table for the words in a text. A
dictionary makes that very simple. 

We could create the dictionary given in the example above in Julia
with the following code

```julia
julia> dict = Dict( "A"=>1, "B"=>2, "C"=> 42 )
Dict{String,Int64} with 3 entries:
  "B" => 2
  "A" => 1
  "C" => 42
```

which I find really elegant. It looks how it should (to me)[^1]. This code
creates a `Dict{String,Int64}`, i.e., a mapping from a set of strings
to 64-bit integers. But remember that the datatypes can be almost
anything including arrays or other dictionaries[^2]. 

There is a lot more information above Julia's dictionaries available
at places like

+ https://docs.julialang.org/en/v1/base/collections/#Dictionaries
+ https://en.wikibooks.org/wiki/Introducing_Julia/Dictionaries_and_sets

and my [own post](/posts/post_julia2/) but I want to get to the next bit. 

# Data-Frames

I also talked about data-frames in a
[previous post.](/posts/post_julia2/)

A data-frame is an advanced type of table. However it has a few
features that differentiate it from a simple array:

+ The columns have names, which means their order can be arbitrary,
  which is very important when shuffling data around. Named access to
  variables (rather than number access) is one of the fundamental
  advances of higher-level programming languages over machine code.

+ A data-frame (in Julia at least) can have missing values. This is
  very useful for working with real data where missing data is
  extremely common. Without this, we often end up putting in weird
  values to indicate missing data, e.g., -1, which can later be
  misinterpreted as real values. 

+ The columns of a data-frame can have different types, so it can
  store both text and numerical data (as well as other types). 

Data-frames are so important that they form one of the foundations of
R's
[Tidy Data](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)
philosophy and hence modern data processing pipelines. They create
some of the functionality of the Python Pandas package.  They are
really, really convenient for organising and visualising data.

And they also map to one of the simplest and most common data formats,
the CSV file. So much so that we can read (and write) from (and to)
CSV files using Julia's CSV package as simply as

```julia
julia> using CSV
julia> using DataFrames
julia> filename = "whatever your file is called"
julia> df = CSV.read(filename, DataFrame; comment="#")
```

The code will read in the CSV file, using the 1st row as column names.
The last bit `comment="#"` isn't necessary, but I like to put comments
in CSV files sometimes and this optional argument will let Julia know
to ignore any line beginning with #.

As with dictionaries, Julia's documentation goes into a lot of
detail about data-frames, e.g.: 

+ https://dataframes.juliadata.org/stable/

# Conversion

So now we get to the nub of the problem, what does it mean to convert
a data-frame (a table) into a mapping? A table can have many columns,
but a dictionary has only keys and values. A column in a table can
have repeated values as well.

What I find I need is a way of counting how often an element occurs in
some column of my table. The obvious way to do this is to loop through
the rows of the table and add a key to the dictionary whenever we see
a new name, and then to increment this counter whenever we see the
name again.

But I want a little more flexibility to do other things:

+ I could have a second column containing numbers, and I want to add
  these up for each name; or 

+ I want to create a mapping (a dictionary) from each name in one
  column to its corresponding value in another column, checking at the
  same time that these mappings are unique. 

The following code does all that. It isn't a hard piece of code. I'm
sure you could write it yourself, but for your convenience: 

```julia
using DataFrames

function increment!( d::Dict{S, T}, k::S, i::T) where {T<:Real, S<:Any}
    if haskey(d, k)
        d[k] += i
    else
        d[k] = i
    end
end
increment!(d::Dict{S, T}, k::S ) where {T<:Real, S<:Any} = increment!( d, k, one(T))

function df2dict( df::DataFrame, key_col::Symbol; val_col::Symbol=:null)
    keytype = typeof(df[1,key_col])
    if val_col == :null
        valtype = Int
    else
        valtype = typeof(df[1,val_col])
    end
    D = Dict{keytype, valtype}()
    for i=1:size(df,1)
        if !ismissing(df[i,key_col])
            if val_col == :null
                increment!( D, df[i,key_col] )
            elseif valtype <: Real
                increment!( D, df[i,key_col], df[i,val_col] )
            else
                if haskey(D, df[i,key_col])
                    @warn("non-unique entry: $(df[i,key_col])")
                else
                    D[df[i,key_col]] = df[i,val_col]
                end
            end
        end
    end
    return D
end
```

The code uses one utility function called `increment!` which is
designed to implement simple counter functionality in a dictionary[^3]. It
just makes `df2dict` a little cleaner to read. The
default behaviour of `df2dict` (if you don't pass in `val_col`) is to
count the number of times each name is seen in `key_col`. If `val_col`
exists and is a numerical type, then we add it up instead. If
`val_col` doesn't take a numerical type we try to create a mapping,
with a warning if it isn't a unique mapping. 

One minor note to take into account is that Julia's data-frame column
names are of type `Symbol`, and that requires a little extra
knowledge. Have a look at the docs for DataFrames or at
[Symbols](https://docs.julialang.org/en/v1/manual/metaprogramming/#Symbols). Symbols
are "interned strings" but as to the whys and wheretofores  I
will leave it to more expert Julia programmers. 

# Examples

OK, how about some examples. These presume you have included the code
above. 

Let's start with a simple one which just counts how often a character
appears in the data-frame. Note that `:Name` denotes the column whose
entries we are going to count.

```julia
julia> df = DataFrame(Name = ["Batman", "Robin", "Alfred", "Batman"], 
                      NumberOfFriends = [0, 2, 100, 1]  )
julia> D = df2dict( df, :Name )
Dict{String,Int64} with 3 entries:
  "Alfred" => 1
  "Batman" => 2
  "Robin"  => 1
```

We could also calculate the number of friends each character has,
summing over the second column values for each name:

```julia
julia> df = DataFrame(Name = ["Batman", "Robin", "Alfred", "Batman"], 
                      NumberOfFriends = [0, 2, 100, 1]  )
julia> D = df2dict( df, :Name;  val_col=:NumberOfFriends )
Dict{String,Int64} with 3 entries:
  "Alfred" => 100
  "Batman" => 1
  "Robin"  => 2
```

You can flip it around, to collect the names corresponding to each
number of friends. 

```julia
julia> df = DataFrame(Name = ["Batman", "Robin", "Alfred", "Batman"], 
                      NumberOfFriends = [0, 2, 100, 1]  )
julia> D = df2dict( df, :NumberOfFriends;  val_col=:Name )
Dict{Int64,String} with 4 entries:
  0   => "Batman"
  100 => "Alfred"
  2   => "Robin"
  1   => "Batman"
```

However, if we make a small change, then we run into a uniqueness
problem because two characters have 2 friends. It produces a warning,
but still outputs a result. You just have to realise that the entry
(for key=2) will be the first one in the list that matched. 

```julia
julia> df = DataFrame(Name = ["Batman", "Robin", "Alfred", "Batman"], 
                      NumberOfFriends = [2, 2, 100, 1]  )
julia> D = df2dict( df, :NumberOfFriends;  val_col=:Name )
┌ Warning: non-unique entry: 2
└ @ Main REPL[4]:17
Dict{Int64,String} with 3 entries:
  100 => "Alfred"
  2   => "Batman"
  1   => "Batman"
```

Those examples are pretty trivial. Let's look at a much more
interesting one based on a real dataset. The file I am going to look
at has a list of nearly 100 Batman graphic novels and their
creators. The first few entries are in the table below:

<div style="display: inline-block;">
{{% csv_table 
    src="/static/csv/batman_creators.csv"
	maxLines="7"
    link="https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_creators.csv"
    colStyle="text-align:right;" %}}  
</div>


You can get the dataset in
question from my GitHub at
[batman_creators.csv](https://github.com/mroughan/AlephZeroHeroesData/blob/master/Batman/Data/batman_creators.csv).  
The code below just counts the number of covers each artist
created (again I'll assume that you have included the code above). The
final line shows why a dictionary is useful -- with one simple command
I can now check how many covers[^4] Tim Sale (or any other artist)
created. 

```julia
julia> using CSV
julia> df = CSV.read("batman_creators.csv", DataFrame) # read the file into a DataFrame
julia> D = df2dict( df, :Cover)
julia> D["Tim Sale"]
2
```

# Conclusion

This is just a short post on a function that it turns out I use a
lot. It's not rocket science. It's doing something pretty simple, but
I use it again and again.  I thought it might be useful for some other
folks, or at least as an example of Julia coding.

# Links

Related approaches:

+ The [StatsBase.jl](https://juliastats.org/StatsBase.jl) package has
several forms of counting (which is after all what half of statistics
is about). Have a look, for instance, at
[countmap](https://juliastats.org/StatsBase.jl/stable/counts/#Counting-over-arbitrary-distinct-values-1)

+ Another approach towards counting functionality would use `groupby`
as suggested here
https://discourse.julialang.org/t/counts-of-unique-values-per-group-in-a-dataframe/40088.
We could write code such as follows which does the counting, but not
the conversion into a dictionary. 

```julia
    julia> df = DataFrame(Name = ["Batman", "Robin", "Alfred", "Batman"], 
                          NumberOfFriends = [0, 2, 100, 1]  )
    julia> df2 = combine(groupby(df, [:Name]), nrow => :count)
    3×2 DataFrame
    │ Row │ Name   │ count │
    │     │ String │ Int64 │
    ├────┼───────┼──────┤
    │ 1   │ Batman │ 2     │
    │ 2   │ Robin  │ 1     │
    │ 3   │ Alfred │ 1     │
```

+ If you only want to count a single item from the list, it's much
  easier, for instance see the following code, but I wouldn't want to do
  this for every artist on a large file. 

```julia
    julia> count = size( filter(row -> row[:Cover]=="Tim Sale", df), 1)
```

The approach you choose should be a trade-off between your time to
program (and debug) your solution, and the computational time. For a
small file like the one above, I don't get to stressed about
computation times, but for real datasets, you should be thinking about
the computational cost of constructing whatever data structures you
use, and then how and how often you plan to access the data. There is
no one best solution for all cases. 


# Acknowledgements

Just a quiet thanks for the people who have been helping me edit these
blogs, notably ...

---
 
**Footnotes**

[^1]: Note that dictionaries aren't sorted, either by key or by
      value. They are a pure mapping without any ordering. I'll talk
      more about this later on, but for many purposes it isn't
      important. 

[^2]: The key data type needs to have a hash function defined. Most
      primitive data types have that, but if you create your own, you will
      need to add a hash method.

[^3]: The default behaviour of `increment!` is to increment by 1 (of
      the appropriate type), but if you pass a third argument the
      counter will be incremented by this amount. 
 
[^4]: For a graphic novel that is created from a series of comics, the
      CSV file actually lists all of the artists that created at least
      one cover from the series. So what we are counting here is the
      number of times that an artist was uniquely responsible for all
      of the covers of a series.
