# CSCI 201 Class Exercises

All students will submit work on in-class exercises using this single repository. 

To expand `git` skills, each student will create and use *two* [branches](https://help.github.com/articles/about-branches/). 

## Our two-branch approach

These instructions are written for a bash terminal with the git client installed. These tools are built-in to c9. Windows users can install a client that provides a bash terminal. Users of other operating systems may need to install the git client.

In your bash terminal, clone this repository with the command: `git clone https://github.com/csci-201/classExercisesF18.git`. This creates a new folder with the repo's name and all the contents. 

Type `cd classExercisesF18` to change your current directory. Your terminal prompt should now show that you are on the master branch of the repository.

Now create and checkout (activate) a new branch with this command: `git checkout -b <BRANCHNAME>` where `<BRANCHNAME>` is a placeholder for a new branch name that you choose. Choose a name that indicates what programming language you are using, and your initials or username. For example: `git checkout -b mattinglyJS`. This branch will be used to store your *finished* work on in-class exercises, *after* the work is complete and has been presented to the group. Since you won't be doing any work in this branch right now, run `git push` so that your new branch will show up at GitHub.com.

You will actually perform the work in a second branch. Create it with this command: `git checkout -b <BRANCHNAME>-WIP` where `<BRANCHNAME>` is a placeholder for the same branch name you used above. For example: `git checkout -b mattinglyJS-WIP`. WIP is a common abbreviation for Work In Progress.

In class, your instructor will walk you through the process of committing changes to your WIP branch, pushing the changes to GitHub, and creating a [pull request](https://help.github.com/articles/about-pull-requests/) (PR). PRs are a common way of asking others to review your changes before they are merged into a branch for finished work.

In a typical team environment, a repository's `master` branch is the ultimate destination for the combined finished work of all team members. In this special case, however, our goals are different (and unusual). We want to keep one student's work in (say) Java separate from another student's work in (say) Python. We don't want to treat everyone's work as one set of code, but we want to have shared access to everyone's separate sets of code. To do this, each student's first "finished" branch plays the role that is usually played by `master` in a team project. Our `master` branch will never contain student work, just the instructions and "starter" files for the exercises.

## Using Markdown

Sometimes you will be asked to submit answers to questions in a Markdown file. Markdown is a file format that is designed to support rich formatting while also being easy for people to write and to read in raw form. You can read more about GitHub's flavor of Markdown [here](https://help.github.com/articles/basic-writing-and-formatting-syntax/).
