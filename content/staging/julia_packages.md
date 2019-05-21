
Creating a new package using PkgTemplates

There is some advice on creating a new package in the
[Pkg](https://julialang.github.io/Pkg.jl/v1/creating-packages/)
docs. But this doesn't cover everything. 

The (relatively) new package generator `PkgTemplates` is a really neat
way to get started with your own Julia packages. But its
[docs](https://github.com/invenia/PkgTemplates.jl) are fairly slim,
and presume you have a fair idea what you're aiming at. I thought a
little tute wouldn't hurt, at least to help remind me how to use it.

I'm going to use a real example of a package I just made recently. You
can see the current version of the package a [RatPack](). Don't take
the package too seriously yet -- it's still under development -- I
just wanted a slightly more real setup than comes with a typical tute
on packages. 

# PkgTemplates commands

Name your package FOOTNOTE 

```
julia> using PkgTemplates
julia> t = Template(;
                  authors=["Matt Roughan"],
                          plugins=[
                      TravisCI(),
                      Codecov(),
                      Coveralls(),
                          ],
              )
Template:
  → User: mroughan
  → Host: github.com
  → License: MIT (Matt Roughan 2019)
  → Package directory: ~/.julia/dev
  → Minimum Julia version: v1.1
  → SSH remote: No
  → Commit Manifest.toml: No
  → Plugins:
    • Codecov:
      → Config file: None
      → 3 gitignore entries: "*.jl.cov", "*.jl.*.cov", "*.jl.mem"
    • Coveralls:
      → Config file: None
      → 3 gitignore entries: "*.jl.cov", "*.jl.*.cov", "*.jl.mem"
    • TravisCI:
      → Config file: Default
      → 0 gitignore entries
```

Generate the package
```
julia> generate(t, "RatPack")
Generating project RatPack:
    /Users/mroughan/.julia/dev/RatPack/Project.toml
    /Users/mroughan/.julia/dev/RatPack/src/RatPack.jl
```

with a lot of output. But the main thing is it creates a new folder
~/.julia/dev/RatPack for the project with the standard Julia package
structure and a few add ons. We'll get to that in a second, but first,
let's add it to github.

All of the above assumes that you already have a GitHub account with
the relatively standard Git options `user.name`, `user.email` and
`github.user` set up globally with `git config --global`. You can
configure these when you create the template, but if you are going to do any development (not just
Julia) you should sort these out first. Good tutorials are availanble. 

What it does is create a standard Julia package template, which is just a directory or folder structure in the `dev` directory. In my case that means it created `/.julia/dev/RatPack`, with the subfolders
```
src
test
```
the former for the source code, and the latter for test code. It also creates a list of files
```
.gitignore
.travis.yml
LICENSE
Project.toml
README.md
REQUIRE
src/RatPack.jl
test/runtests.jl
```

Each if these has a particular function, so I will go through them one by one, but not in the order listed above.

1. `src/RatPack.jl` is where we will put the module. It is started off with a trivial module that has "Hellow World!" code in it. I'm not going to describe modules this week. The main point is that this gives you the template you need to get started straight away.

2. `test/runtests.jl` is where we put testing code. You could put other tests elsewhere, but this will link (easily) to Travis which we will describe in a second. Again this starts with a template, but you probably need to read up on Julia's [Test](https://docs.julialang.org/en/v1/stdlib/Test/index.html) package. It's a really elegant, light-weight way to do unit testing using a couple of macros. 

3. It creates a standard Julia-focussed `.gitignore` to tell Git which pieces don't need to be commited. Usually you will want to add to this.

4. It creates a `LICENSE` file. By default this is the MIT license, but you can configure other licenses when constructing the template.

5. It creates a standard `README.md`, i.e., a Markdown Readme file, suitable for GitHub. This is nice because it already contains the shims needed for the plugins (Travis, Codecov and Coveralls in my case).

6. A `REQUIRE` file, which was how Julia used to know which versions were supported, and which packages it needed. It seems that it is moving towards being supplanted by the `Project.toml` file. These are fidley. I'll get into how to get these right below.

7. A `Manifest.toml` file. This should be machine generated, so hopefully you don't have to touch it,.

8. It creates a `.travis.yaml` file. This is part of the [Travis](https://docs.travis-ci.com/user/languages/julia/) system of continuous development, which is set up for much more than just Julia. If you set this up, each time you commit and push changes to GitHub, it will run your test code, and create a nice little report. I know you can run your own tests but this (i) makes the results public for any users of the package (and hence keeps you honest) and (ii) runs the tests across different platforms (Travis supports MacOS and Linux, I haven't sorted Windows yet).

That's the basic rundown. You may want to add a `docs` subdirectory, and set up some auto documentation. I haven't yet gotten to this bit. Maybe a later post.

And just a call-out to the people writing `PkgTemplates`. Nice job! This is much easier than it uswed to be. They even have an interactive generator, but I didn't find any need to use it. 

# My mods

OK, everything above is standard. But I don't want standard.

I want a few extra bits and pieces

+ I want to have my development code in Dropbox. I know this is redundant. I have it in GitHub, so I shouldn't need Dropbox, but I like to use git to commit when I have a distinct knot of working code to add. That means I might go home part way, and want to work on the same code without doing a commit. I manage what I want by moving the RatPack.jl directory into Dropbox, but putting a symbolic link towards it back into `.julia/dev`. Maybe that's not good form but it seems to work.

+ I want my `.gitignore` to ignore a few extra bits and pieces, so I dod a quick edit. No dramas here though.

+ I usually create an `examples` directory to have some of my own code
  that shows how to use the code. It also has some tests that are less
  formal, e.g., tests that generate plots. I also add a `data`
  directory for data files associated with the package (either for
  testing, or for examples).

+ I will usually create a standard set of tests (as described
  below). But I often have a few extra test files for instance, where
  I have generated plots to see how various tasks work. These often
  have dependencies that are not really part of the package. See
  [here](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Test-specific-dependencies-1)
  for how to add such dependencies.

There are other bits and pieces to consider, for instance, adding a
["build" step](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Adding-a-build-step-to-the-package.-1),
but I haven't used this yet. 


# Next, put it onto GitHub

GitHub experts will know this without thinking, but I don't do it very
often, so I always have to look it up (or do it the cheats way which
is to create the repo on GitHub, and then add the files to it).  I use
the instructions
[here](https://help.github.com/en/articles/adding-an-existing-project-to-github-using-the-command-line)
to add it via the command line. It has links to GUI interface if you
prefer that.

Steps:

1. Create the repo at GitHub without initialising it, i.e., it doesn't
need a Readme or other files you might normally create with a new
repo. I do this through GitHub's web inteface. When you do this, it
gives you some instructions for adding you files, or look at the link
above.

2. Add and commit the existing files in the folder.
```bash
$ git init   # probably unnecessary
$ git add .
$ git commit -m "First commit"
```

3. Add the location of the remote (GitHub) repository where the files
will be kept. You get this location from the URL GitHub tells you when
you create the repo, or from the "Quick Setup" button. In my case it was
```
git@github.com:mroughan/RatPack.git
```
Once I have this, I tell the local repo where it is using the following command
```
$ git remote add origin git@github.com:mroughan/RatPack.git
```
but I found this hadn't quite fixed it until I diod
```
$ git remote set-url origin  git@github.com:mroughan/RatPack.jl.git
```
Then push the files to it using
```
$ git push -u origin master
```

# Now edit your files.

1. Add code to `src/RatPack.jl`. Use the standard module structure. 

2. Add tests to `test/runtests.jl`. I suggest you do this as you go, not right at the end.

3. Edit the `README.md`, to provide at least a simple description of
   the package, and how to use it. At the moment, I have put most of
   my documentation in here. You can do better than that, but again,
   we'll do that another day. 

Eventually, you will want to edit the TOML and YAML files are well, but that is blog for a later day.

# Use other packages

In the process you will probably want to use some other
packages. You'll need this one to know about them, so that when other
people install it, they also get the dependencies installed.

This used to be simply through the `REQUIRE` file, which specified
dependencies. It seems to be going away though, to be replaced with a
more automated and intuitive approach mediated through the
Project.toml and Manifest.toml files. But these shouldn't need to be
written from scratch (they were already created earlier).

The trick is working how to update them (without manually editing the files).

I found some help [here](https://www.simonwenkel.com/2018/10/06/a-brief-introduction-to-package-management-with-julia.html). The steps I performed (after all of the above) were to start Julia in the RatPack folder, and then type
```julia
julia> ]                         # to get into the Package manager's REPL
(v1.1) pkg> activate ./          # to activate the package
(RatPack) pkg> add Distributions # to add Distributions and its dependencies
```
I can then use `status` to see what has been enabled.


I found I had to "resolve" a few things in doing this. I don't
completely understand this, but I believe it is so the root
environment understands all of its dependencies. 
```
julia> using Pkg
julia> Pkg.resolve()
```

You need to do the same set of tasks for each dependency your package
will have.

Generally speaking choosing dependencies is a balancing act. They
provide incredibly useful functionality, but can make your code less
stable as it has to keep up with a bunch of miscellaneously maintained
packages. So if I have a single (easy) function I need from another
package, I'll usually write a version of it myself. But when I need a
few pieces of the package, or the pieces are not at all easy, then I
will pull in the package. 

# Automating Tests and Travis

Travis autotests your package when you push it to GitHub.

It's not necessary if the package is just for you. But if you ever
want anyone else to use it, this gives them an indication of the
packages current state.

And it's needed if you want to register this as an official package.

The package template comes with a file called `.travis.yml`. It's a
YAML file describing the tests you want performed (when you push the
package to GitHub). The default file has most things you will need to
start with, but you need to change the ???

The template's default start point assumes your
test script is `tests/runtests.jl`. 
The first thing to do is set up
such a file using the `Test` package. This gives you some simple
macros to create test sets. For example, create a file that looks like
```julia
using Test
using RatPack
@testset "Utilities" begin
    @testset "Line search" begin
        r = [0.0, 2.0]
        ε = 1.0e-6
        (x_star1, y_star1, error_estimate1, n_evaluations2) =
            linesearch( "Grid", x->sin(x); range=r, ε=ε)
        (x_star2, y_star2, error_estimate2, n_evaluations2) =
            linesearch( "Golden", x->sin(x); range=r, ε=ε)
        @test abs(x_star1 - x_star2) < ε
    end
end
```
You can run this code yourself (in this case it checks that the simple
line searches I wrote will both find the same solution within
epsilon (the allowed error). 

You also need to register with Travis, and let GitHub know. I did it
by clicking on the "build | unknown" tag automatically inserted into
the README.md which appears on the GitHub front page. That took me to
Travis, which asked me to log in via GitHub, and authorise the
application. Then I had to activate Travis and install it -- I only do
this for the repos I am using Travis on, not everything. Then it just
runs. Clicking on the little flag will let you know what is broken,
and generate reports on the code. 

That standard template also includes
use of [codecov](https://codecov.io/) and
[Coveralls](https://coveralls.io/), which will produce reports telling
you what your tests cover. Ideally, your test suit will hit at least
90% of the code you write (it can be hard to get to 100% though). You
might also need to add the repo to these services though. However, I
find having these is a good little motivator towards building better
tests, so it is easily worth it. 

Travis can do things besides checking, but that is a story for another
day. 

# Registering the package

Eventually, you will want to register your package so that other
people can install it with the package manager just by typing `] add
RatPack`. 

There are other ways to install a package (which are harder) and a
registered package is more likely to show up on people's searches etc,
so it's worth doing for any package you want other people to use.

The idea we are working towards is that when you create a GitHub
[release](https://help.github.com/en/articles/creating-releases) it
will automatically be registered in the
[General](https://github.com/JuliaRegistries/General) registry of
packages, which is another GitHub repo, with a list of registered
packages and some metadata about them. Registering a package essential
corresponds to a pull request on this repo, but a carefully structured
pull request. 

Julia was using [Attobot](https://github.com/attobot/attobot) to
automate this process, and I found this part of the setup the most
obscure. But they have moved across (after Julia v0.6) to
[Registrator.jl](https://github.com/JuliaRegistries/Registrator.jl). This
is my first go using it, so again, this document is at least half for
me to remember what I did. 

1. As with Travis and others, you install the app on GitHub (in my
   case for specific repositories). This was a simple matter of
   clicking the "install app" tag on the Registrator.jl GitHub page.

2. It uses the `Project.toml` file to set the `version`. The template
   set up the package as `version = "0.1.0"` when it was
   created. Change it or keep it. FOOTNOTE
   
3. Make a commit with the comment "@JuliaRegistrator register()". You
   will still have to wait until the generated pull request is
   accepted.
   
4. [optional] Tag the release with a matching version number on
   GitHub. Julia's [TagBot](https://github.com/apps/julia-tagbot) will
   do this for you. It will keep git tag and GitHub releases in
   sync. Again, installing is a matter of clicking on links, and
   letting GitHub know which repositories are using it. Such tags are not
   necessary, but help someone looking at your code to understand
   it. And it seems like good practice. 
   
When you want to create a new version, a new release is created by
repeating steps 2 and 3.


# Summary

Setting up a new package involves quite a few moving pieces. It might
seem a little daunting, but you don't have to do everything at
once. The sequence I would suggest following is to 

1. Get a working package template, and start writing some code.

2. Put it on GitHub.

3. Put together a starting set of tests, and grow this as you write
   your code.

4. Add automated functionality via Travis.

5. Register the package once you have enough functionality for it to
   be worth some (hypothetical) other people to use and test. 
   
The other big ticket item to get on top of is documentation. At the
moment RatPack's docs live in one big README markdown file (which
GitHub nicely presents on your packages front page), but I plan to do
better. That will be, perhaps, the next Julia post. 


++++++++++++++++++++++++++++++

Footnotes

   [Julia package naming guidelines](https://julialang.github.io/Pkg.jl/v1/creating-packages/#Package-naming-guidelines-1)


   the standard Julia version syntax is 
   
	   
