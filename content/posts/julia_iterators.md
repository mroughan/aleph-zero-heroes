--- 
title: "Julia, Julia, Julia, ..."
author:
  name: "Matt Roughan"
  desc: " "
date: 2020-12-17
lastmod: 2020-12-17
description: "Iteration (controlled repetition) in Julia, a quick
how-to do it, leading up to building simple customised iterators,
with a brief digression on loop scope in Julia."
categories: ["Code"]
tags: ["Julia", "Control flow"]
cover: "img/julia_logo.svg" 
featuredImage: "img/julia_logo.svg"
featuredImageDescription: ", <a href=\"https://julialang.org/v2/img/logo.svg\">the Julia programming language.</a>"
dropCap: false
draft: false
toc: true
spoilers: false 
---

{{% blockquote author="Larry Wall" %}} 
Most of you are familiar with the virtues of a programmer.  There are three, of course: laziness, impatience, and hubris.
{{% /blockquote %}} 

# Intro

The first deep thing I remember learning about mathematics (and have
since applied to programming and data science) isn't a formula. It's
that mathematicians *should be* lazy. Don't waste time doing X when Y
is quicker. Maths is all about finding Y. Computer science is about
building Y.

One aspect of laziness can be expressed as "Don't Repeat Yourself,"
and it comes with a handy three-letter acronym: **DRY**. Of course, as aphorisms tend
to, this means different things to different people, but one
interpretation is *don't write the same code twice.*

There are lots of strategies to avoid repeatedly typing. One of the
most powerful, and most commonly used is **iteration**. Roughly this
refers to creating a *loop* that repeats itself with some changes each
time through. It's very *Groundhog Day*[^1] or *Edge of Tomorrow*[^2]
or *Source Code*[^3] or there's a list
[here](https://www.digitalspy.com/movies/a849023/groundhog-day-movies/)
if you still don't get it. 

Iteration has been easy since the creation of high-level programming
languages, but the strategy is much, much older than anything to do
with computers.  You can argue iteration has been around as long as
the idea of an *algorithm*, which precedes programming by some
hundreds or thousands of years.  A simple example is "Newton's
method", described by old Isaac in the 1670s but with its origins
dating back to ancient times (see the
[Babylonian method](https://mathcirclesofchicago.org/wp-content/uploads/2015/08/johnson.pdf)
for computing square roots).

We owe the idea of iteration in programming to -- you guessed it --
Ada Lovelace, but she and Babbage gained inspiration from the Jacquard
loom, which also allowed iteration. A long discussion of the history
can be found at [stackexchange](https://softwareengineering.stackexchange.com/questions/149465/who-created-the-ideas-of-the-first-loop-constructs/).

Iteration has, like other fashions in coding, been in and out and then
in again. It went through a lull for me because I spent a lot of time
teaching our students coding in Matlab, and Matlab (like R and many
other similar languages) did not have an efficient iterator. Hence,
you tended to
[vectorise](https://www.mathworks.com/help/matlab/matlab_prog/vectorization.html)
loops out of code whenever possible. One of the GREAT things about
Julia is that its loops are blindingly fast[^4]. I actually got told off
once when I tried to contribute code to a project, and I hadn't used
loops (I had written by by-now-standard vectorised version of the
algorithm even though the loop-based code was easier, and in Julia it
was faster).

In this blog entry, I want explain Julia's iteration/loop capabilities
and get to the point of explaining how to create custom iterators. I
also want to get to the point of discussing the somewhat controversial
loop-scope rules, but I want to start off really simply.

# Simple Iteration in Julia

In almost any high-level programming language there are multiple
strategies to create a loop. The most basic, perhaps, is the `while`
loop. In Julia it looks like this:

```julia
while CONDITION
   # DO THIS STUFF
end   
```

The idea is that it will repeat the `DO THIS STUFF` commands until the
`CONDITION` is false. I don't know many high-level languages[^5] that
can't do this type of loop and the
[syntax](https://rosettacode.org/wiki/Loops/While) for most of them
looks very much like Julia's.

Implicit in this construction is the assumption that each time through
the loop, something will change, and so each execution cycle will be
slightly different, and hence the `CONDITION` can change from true to
false[^6].

A very simple example follows:

```julia
counter = 1
while counter <= 10
   @show counter
   counter += 1
end   
```

This loop counts from 1 to 10 and then stops. Maintaining a counter is
such a common requirement in so many loops that there is a short cut
called a **for** loop, which in Julia looks like

```julia
for counter = 1:10
   @show counter
end   
```

This loop does exactly what the previous `while` loop does, with fewer
lines of code. `For` loops are about as common in high-level languages
as `while` loops, but the syntax for a `for` loop can be pretty arcane
in some languages (I have an example in C below).

There are other types of loops out there, e.g., `repeat-until` or
`do-while` loops. Technically they fall into two categories: the
condition controlled loops (the `while` loop) and the count-controlled
loop (the `for` loop) but we will see the difference is not so cut and
dried. And there are all sorts of extra syntax, e.g., `break` and
`continue` that help out in special cases. 

You probably already knew all of that. It's computing 101, but I needed
to make sure we are clear in what follows. 

# Iteration again 

Traditionally, `for` loops (dating back to ALGOL) used a start
value, a condition (much like a while loop) and a rule about what to do
with the counter. For instance, in C you would write

```C
for (int counter=1; counter<=10; counter++)  
{
	// DO SOME STUFF
}
```

The line defining the `for` loop has three clauses:

1. `int counter=1` initialises the counter to be an integer starting at 1; 
2. `counter<=10` terminates the loop when the counter exceeds 10; and
3. `counter++` increments the counter by 1 for each run through the loop. 

Modern languages like Julia define an `iterator` that wraps up all of
these three into one. For instance, in my Julia `for` loop, the iterator is
`1:10`, which is technically a `UnitRange`, but when used as part of a
`for` loop it iterates through the numbers 1,2,3,4,5,6,7,8,9 and 10. 

Iterators are a flexible bit of
[syntactic sugar](https://www.quora.com/What-is-syntactic-sugar-in-programming-languages)
designed to both: 

+ make it very obvious what the loop does; and
+ make it easy and quick to create a `for` loop. 

The second point will appeal to many programmers. The first point
might seem trivial, but IT IS NOT. Simple, obvious code is much easier
to build and maintain.

This type of iteration is sometimes called a `foreach` loop because
it makes it very easy to, for instance, loop through a collection,
e.g., in Julia we could do

```julia
for counter = [1 3 10]
   @show counter
end   
```

which will loop through only the numbers 1,3 and 10. We could replace
the `=` sign here, which is a little confusing really, with `in` to
write (with the same result):

```julia
for counter in [1 3 10]
   @show counter
end   
```
 
Julia also provides a set of
[higher level iteration tools](https://docs.julialang.org/en/v1/base/iterators/). One
of my favourites is `enumerate`, which combines the `foreach` style of
loop with a counter. For instance, we could write

```julia
for (counter, value) = enumerate( [1 3 10] )
   @show (counter, value)
end    
```

which outputs
```julia
(counter, value) = (1, 1)
(counter, value) = (2, 3)
(counter, value) = (3, 10)
```

I often want to iterate through a collection, but also maintain a
counter while doing it. I know I can do this with a couple of extra
lines of code, but remember, programmers *should be* lazy. I certainly
am. 

Then there is the 
[`IterTools.jl` package](https://juliacollections.github.io/IterTools.jl/latest/)
has all sorts of super-useful iterators we can apply on top of other
simple iterators: 

+ `distinct`: iterates on the unique elements of a collection;
+ `groupby`: groups consecutive values that share a result defined by
   a function you supply;
+ `iterated`: repeatedly applies a function you supply (which is common in
               mathematical algorithms like Newton's method); 
+ `cycle`: cycles through the supplied iterator n times;  or
+ `subsets`: iterates over every subset of a  collection.

There's a whole lot more in the package. It's worth looking into.

# Custom Iterators in Julia

So now I get to the topic I really wanted to get to -- custom
iterators.

First, why would you want this? Aren't there enough ways to do
iteration already? The answer comes down to laziness. If you are
going to use any type of programming construction more than once, it
makes sense to create a tool to avoid repetition. Usually, in
procedural languages like Julia, that would take the form of a
function (in other languages these might be called a procedure or
method or subroutine). However, a loop is another construction and
just like all of the rest, we sometimes want to create something
special, and make it easy to reuse without re-typing a lot of
boiler-plate code each time.

Second, why explain custom iterators here? Frankly, some of Julia's
documentation isn't written for ordinary people like me. The
descriptions of custom iterators that I have been able to find, e.g.,
[this](https://julialang.org/blog/2018/07/iterators-in-julia-0.7/), are
written for experts. 

Third, what do you do? The starting point is to realise that `for` and
`while` loops are equivalent. Either could be implemented in terms of
the other, so assuming we have an **iterator** called `iterable` and a
function called `iterate`, which I'll describe in a second, the
following codes are equivalent:

```julia
for element in iterable
    # body
end
```

or 

```julia
iter_result = iterate(iterable)
while iter_result !== nothing
    (element, state) = iter_result
    # body
    iter_result = iterate(iterable, state)
end
```

I stole this example from
[Eric Davies](https://julialang.org/blog/2018/07/iterators-in-julia-0.7/),
but I want to try to explain it a little more, and give a simpler
example of how to use this. Eric did a lot of the writing on the
[`IterTools.jl` package](https://juliacollections.github.io/IterTools.jl/latest/)
and so he needs to create iterators that work on top of other
iterators. For example, think about `enumerate`, which has to work on
top of almost any other iterator. I don't need to be so clever.

The first example of code given above should, I hope, be fairly
straightforward at this point. The variable `element` iterates
through the iterator creatively called `iterator`. For instance, the
iterator could be the range `1:10`.

The second example uses two functions. Both are called `iterate` so
this might seem confusing, but remember that Julia uses
[*multiple-dispatch*](https://eli.thegreenplace.net/2016/a-polyglots-guide-to-multiple-dispatch/)
to correctly call the right function even though the name *iterate* is
overloaded with two definitions. In this case, the first definition
has one input argument `iterable` which is the name of the iterator
(we are going to create this), and the second function has two
arguments `iterable` and `state`, the second of which lets us keep
track of where we are.

The `iterable` here will be a new structure/object that we create. It
will include information about 

+ how to start;
+ when to stop; and 
+ what to do in between.

To show you how it works I am going to create a non-trivial
example. If you have a matrix X, then the matrix minor in the *ith* 
row and *jth*  column is the determinant of the submatrix formed by
taking every part of X except row i and column j. I want to iterate
over all of the minors of a given matrix.

That might sound technical and difficult, so first lets just look at
the submatrices that form the minors and ignore calculating the
determinants[^7]. A quick example starts with the matrix X
defined to be 
{{< raw >}}\[ 
A = \left( \begin{array}{rrrr}
               1 & 2 & 3 & 4 \\
               5 & 6 & 7 & 8 \\
               9 & 10 & 11 & 12 \\
               13 & 14 & 15 & 16 \\
	       \end{array} 
    \right)
\]{{< /raw >}}
The *matrix minor submatrix* for the 2nd row and third column would be
{{< raw >}}\[ 
A_{2,3} = \left( \begin{array}{rrrr}
               1 & 2 &  4 \\
               9 & 10 &  12 \\
               13 & 14 &  16 \\
	       \end{array} 
    \right)
\]{{< /raw >}}
Note that it is just X with the 2nd row and third column deleted. 

Here is my simple function to get the submatrix minor.

```julia
function matrix_minor( X::Array, i::Int, j::Int )
    (s1,s2) = size(X)
    submatrix = Array{eltype(X),2}(undef, s1-1, s2-1)
    for (counter1,index1) = enumerate( setdiff( 1:s1, i ) )
        for (counter2,index2) = enumerate( setdiff( 1:s2, j ) )
            submatrix[counter1, counter2] = X[index1, index2]
        end
    end
    return submatrix
end
```

Note the *nested* `for` loops (one loop inside another) that enter all
of required elements of the new matrix, omitting row i and column j of
the matrix (the function `setdiff` is removing element i (or j) from
the full range of rows (columns) being included).

The code probably isn't the fastest, or most clever, but I wanted to
use it to illustrate some points:

1. Programmers who write a lot of Matlab, R or other similar languages
   might think this is bad code. It uses nested loops and that can be scarily slow in those languages. So
   you would vectorise, e.g., by concatenating chunks of X
   together. But remember that loops in Julia are FAST.
2. I've used `enumerate` here to illustrate how great it can be to
   access both the element of an iterable and its index. 
   
   
Matrix minor submatrices have a variety of applications, but for the
moment I am just going to list all of them. To build the iterator we
first create a new composite type (a `struct`) as follows:

```julia
struct MatrixMinor
    X::AbstractArray # a square matrix
    n::Int           # size of matrix for easy reference
end
function MatrixMinor(X::AbstractArray)
    (n1,n2) = size(X)
    if n1 != n2 error("matrix should be square") end
    return MatrixMinor( X, n1 )
end
```
The first part of this defines the type. I don't really need to have
the size n in here, but it makes it easy to refer to it. The second
part is a convenience *constructor* that checks the input matrix is
square. The constructor isn't necessary, but I want to make life easy
and safe for someone using the code. 
 
You also need to write a small set of functions to work on the
iterator. The functions extend Julia's base code hence the way they
are defined as `Base.`.  The first two should be fairly straight forward. The
second two are the two variants of `iterate` that we need.

```julia
Base.length(iter::MatrixMinor) = iter.n^2
Base.eltype(iter::MatrixMinor) = eltype(iter.X)

function Base.iterate( iter::MatrixMinor )
    element = matrix_minor( iter.X, 1, 1 ) 
    return (element, 1)
end

function Base.iterate( iter::MatrixMinor, state )
    count = state

    if count >= length(iter)
        return nothing
    end
    i = div( count, iter.n ) + 1
    j = mod( count+1, 1:iter.n )
    element = matrix_minor( iter.X, i, j ) 
    
    return ( element, count + 1 )
end
```

The first version of `iterate` initialises the loop for a given
`MatrixMinor` iterator. It returns the first element (the matrix minor
for row 1 and column 1), and the *state* 1. In this iterator the state
will simply be a counter to say how far along we are.

The second version of `iterate` is like a "next" function. Its inputs
are an iterator and the current state/counter, and it finds the next
matrix minor (we go through the matrix in row order), and updates the
state/counter. It terminates by returning `nothing` when the
state/counter reaches the nth row and nth column.

And finally here is the payoff, the code to use it. 

```julia
X = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]
for minors in MatrixMinor(X)
    display(minors) 
end
```

I hope the code illustrates the point. We had to write a chunk of code
to build this, but now, whenever I want to iterate over the minors of
a matrix, I need only write a couple of lines of code.

In the code, the expression `MatrixMinor(X,2)` creates (constructs)
the iterator, which we use immediately in the `for` loop. At each
iteration the `display` command outputs the current matrix minor, for
example the first three iterations are: 

```julia
3×3 Array{Int64,2}:
  6   7   8
 10  11  12
 14  15  16
3×3 Array{Int64,2}:
  5   7   8
  9  11  12
 13  15  16
3×3 Array{Int64,2}:
  5   6   8
  9  10  12
 13  14  16
```
and we run through 16 in all before we hit the termination criteria. 

My example here is more basic than the code you can see, for
instance, in the
[`IterTools.jl` package](https://juliacollections.github.io/IterTools.jl/latest/). It
isn't as general (it can't wrap around and operate on another
iterator), and most likely is slower. But I wanted an example that
avoided some of the more advanced complexities and laid out the
ideas. 

# Scope

One last comment about loops in Julia. 

Scope, in programming languages, refers to the (maximal) part of a
program that can see a "name". So we might say the scope of a variable
named X is the function F if X can be seen inside function F, but not
outside. We say a variable has *global* scope if it can be seen
everywhere. We say it has *local* scope otherwise. Scope isn't just
about variables, it's about names, so a function or structure can have
local scope as well.

Scope is a really, really important tool to manage the namespace of a
program. It means that I can reuse names without fear of them
clashing, which is critical when multiple people are working on
different parts of the same large program. Otherwise there would have
to be endless committees to name each of the myriad parts of a
program (which might have millions of lines of code and tens of
thousands of names). 

I grew up with languages where scope was primarily determined by the
boundaries of functions (or methods or subroutines -- whatever you
call them). You could always create your own scopes, but I have rarely
needed to. However, in Julia, a loop has its own scope as well[^8]. So
for instance, in Matlab the following code

```matlab
for counter = 1:10
   % do nothing
end   
display(counter)
```

will output '10', but in Julia the identical-looking loop

```julia
for counter = 1:10
    # do nothing
end   
display(counter)
```

will lead to the error `ERROR: UndefVarError: counter not defined`,
because `counter` is only defined inside the scope of the loop, not
where we try to display it. We can fix this for variables defined inside
the loop (in version 1.5 and up) by defining them first, so that the
loop will access a variable that already exists instead of creating a
new one within its limited scope. You could also wrap it in a function
which will create a new scope. However, this doesn't work for the
counter itself. Julia's writers
[took an explicit decision](https://github.com/JuliaLang/julia/issues/22314)
that each time you create a `for` loop it creates its own internal counter,
and we can't (as far as I know) get to it outside the loop. If you
need it (say if you break out of a loop early) then you need an extra
variable, e.g.,

```julia
record_counter = 0
for counter = 1:10
	record_counter = counter
end   
display(record_counter)
```

Julia's scoping rules are there for a reason -- global variables are
not desirable in large programs particularly those that use
parallelism, and the scope rules also help optimise the code to make
it really fast -- but honestly they have caused me some
stress[^8]. The most obvious source of stress is that in some versions
of Julia the scope rules differ between code defined inside functions
or modules, and code running in the bare REPL. Julia changed its
behaviour in
[version 1.5](https://julialang.org/blog/2020/08/julia-1.5-highlights/#the_return_of_soft_scope_in_the_repl)
to make the REPL more like module code, which I like, but this can
still cause some confusion. Particularly as this reverted a change
when they introduced new scope rules in version 1.0. 

In any case, this has been a really big topic of discussion out there
in Julia land. You can find some links below.

# Conclusion

{{% blockquote author="L. Peter Deutsch" %}} 
To iterate is human, to recurse divine.
{{% /blockquote %}} 

Iteration is one of the key tools programmers use, again, and again, and
again. I wanted to lay out Julia's iteration tools, at least as a
reminder for myself.

Iteration isn't the only way to get things done. There is a general
equivalence between iteration and recursion, and in some ways
recursion is more elegant. However, I have usually found that students
find recursion much harder to understand, at least when they are
starting out, so we usually leave that until later, which is what I
will do today.

Julia, like most modern languages, has some pretty sophisticated tools
for iteration. They range from simple, elegant constructions for
standard loops to the ability to create your own customised
iterators. You might not need the latter very often, but it is really
cool when you do.

# Links


Loops and iteration in general: 

+ https://cs.lmu.edu/~ray/notes/controlflow/
+ https://www.codingkids.com.au/coding-tips/control-flow/
+ https://rosettacode.org/wiki/Loop_Structures

Loops in Julia: 

+ https://docs.julialang.org/en/v1/manual/control-flow/
+ https://scls.gitbooks.io/ljthw/content/_chapters/09-ex6.html
+ https://julialang.org/blog/2018/07/iterators-in-julia-0.7/

Loop scope in Julia: 

+ https://docs.julialang.org/en/v1/manual/variables-and-scoping/
+ https://julialang.org/blog/2020/08/julia-1.5-highlights/#the_return_of_soft_scope_in_the_repl
+ https://discourse.julialang.org/t/tips-to-cope-with-scoping-rules-of-top-level-for-loops-etc/24902
+ https://discourse.julialang.org/t/global-scope-the-meaning-of-the-first-hit-rule/24845/12
+ https://discourse.julialang.org/t/use-of-variable-in-julia-repl/24843
+ https://github.com/JuliaLang/julia/issues/28789

# Acknowledgements

Just a quiet thanks to the people who have been helping me edit these
blogs, notably in this case .... 

---
 
**Footnotes**

[^1]: For those of you as old as me.

[^2]: For fans of Tom Cruise.

[^3]: For Gyllenhaal fans.

[^4]: Matlab's [docs](https://www.mathworks.com/help/matlab/matlab_prog/vectorization.html)
      mention that apart from improved performance, standard code
      should be replaced by vectorised code because it is easier to understand and less error
      prone. That is certainly true when you are writing linear-algebra
      code, but it is definitely untrue for many other algorithms where the
      sequence of operations is important, and so writing it in vectorised
      form is actually creating a new algorithm.

[^5]: Technically constructs such as loops are part of control flow in
      *imperative* programming languages. These are languages that run a
      sequence of commands in an order defined by the control flow. Think of
      them as languages where you tell the computer what to do in
      detail. The main alternative is a *declarative* language where you ask
      the computer to achieve the result without caring how it gets there
      (think Excel). Imperative languages map more naturally to how computer
      hardware works, and how we (or at least I) think so they are more
      common. Declarative languages can be fantastic though, and in reality
      the division is often not sharp. Declarative languages often include
      control flow constructs as well, and modern imperative languages often
      include declarative components. 

[^6]: There are reasons you might want a loop to run nominally
      forever. For instance, a program that is monitoring a system for
      events might be expected to keep running its loop as long as the
      system is running. So-called *infinite loops* can usually be
      interrupted by some command (control-C in Julia), but that is
      getting into details we don't need here.

[^7]: The term "matrix minor" is sometimes used to refer to the
      submatrix as well as its determinant.
	  
	  
<!-- [^7]: Julia has *lexical* scoping. Scope can be determined from the -->
<!--       code alone, and does not depend on how the code was -->
<!--       executed. This makes scope easier to predict (as a human) and  -->

<!-- [^8]: Scope can be nested and the outer scope can see -->
<!--       variables in the inner scope, but not the other way around. -->

[^8]: Julia's scope rules (and the rules of any modern language) can
      be quite complicated to look at. For instance, see
      [the docs](https://docs.julialang.org/en/v1/manual/variables-and-scoping/). However,
      mostly I find them intuitive to use. It's just the rules around
      loops are not my friends.
	  
	  
