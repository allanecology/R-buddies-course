R buddies session 4 - version control
================
Noëlle V. Schenk
2023-04-27

# Aim

A collection of ressources to install version control, and to practice
it’s use.

# Requirements

A Computer or Laptop where you have R and RStudio installed, and where
you have the rights to install new software.

# Part 1 : Install version control

## Install git

Try to set up git and connect it to RStudio. You might want to follow
[this](https://happygitwithr.com/install-git.html) tutorial (especially
from point 6 in the tutorial on).

If you run into problems, consider the Frequently Asked Questions (FAQ)
section of this documents and feel free to ask.

## Connect git and RStudio to GitHub

Try to connect git and RStudio to GitHub following
[this](https://happygitwithr.com/install-git.html) tutorial (same as
above): (points 4 and 8 in the tutorial)

If you run into problems, consider the Frequently Asked Questions (FAQ)
section of this documents and feel free to ask.

# Frequently Asked Questions

## What is the difference between git and GitHub?

git is the version control program. It does everything we discussed
during the lecture, it allows you to document changes in your script and
offers an environment to keep those updates organised, and it connects
with RStudio.

GitHub is just an online repository for you where you can share your
code online. It is specialised on publishing code under version control
using git. In other words, it’s a platform where you share your scripts.
GitHub is often used for software in beta-status, i.e. for software
which is awaiting changes in the near future. To make your software
(your code) public in the long run, we in science need other platforms
like Zenodo. They guarantee to keep the software available long enough
(usually 10 years) under a stable identification number (doi). GitHub is
therefore rather a platform for code in progress.

## Connect an existing project to GitHub

There are basically 2 solutions to this. One is rather a
[workaround](https://github.com/biodiversity-exploratories-synthesis/Synthesis_tutorials/blob/main/RStudio_GitHub_FAQ.md),
the other is an actual
[solution](https://hansenjohnson.org/post/sync-github-repository-with-existing-r-project/)
(but in my experience way harder to implement)
