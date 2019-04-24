
Creating a new package using PkgTemplates

The (relatively) new package generator `PkgTemplates` is a really neat
way to get started with your own Julia packages. But its
[docs](https://github.com/invenia/PkgTemplates.jl) are fairly slim,
and presume you have a fair idea what you're aiming at. I thought a
little tute wouldn't hurt, at least to help remind me how to use it.

I'm going to use a real example of a package I just made recently. You
can see the current version of the package a [RatPack]().



# PkgTemplates commands


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

+ I usually create and `examples` directory to have some of my own code that shows how to use the code. It also has some tests that are less formal, e.g., tests that generate plots. 


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
though somewhere this seemed to have already been done. Maybe the template sets this up as well? 
Then push the files to it using
```
$ git push -u origin master
```

# Now edit your files.

1. Add code to `src/RatPack.jl`. Use the standard module structure. 

2. Add tests to `test/runtests.jl`. I suggest you do this as you go, not right at the end.

3. Edit the `README.md`, to provide at least a simple description of the package, and how to use it. 

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


I found I had to "resolve" a few things in doing this. Not sure why? But seemed to be fixed by
```
julia> using Pkg
julia> Pkg.resolve()
```

# Attobot

Eventually, you will want to register your package so that other
people can install it with the package manager (they can install it
direct from the GitHub repo earlier on, but this takes just a little
more expertise than typing "] add RatPack". And a registered package
is more likely to show up on people's searches etc.

Julia is now using "attobot" to automate this process

Setting up Attobot is easy ...

I found using it painful at first ...


Essentially you are doing a pull-request on the main registry file for Julia ....






