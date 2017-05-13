
Git Basics
=========

>  -    set up central repository (like github)
>  - Adding commits
>  -    checkout a previous version of full codebase 
>  -    checkout a specific version of just one file 
>  -    move back to the current version
>  -    stage a change
>  -    unstage the change
>  -    ammend the commit last commit
>  -    soft/hard/mixed reset
> 
> **branching**
> 
>  - create
>  -    merge
>  - with conflicts
>  - without conflicts      
>  - delete
>  - what happens to unstaged/staged changes in current branch when checkingout a new branch
> 
> **remote**    
> 
>  - Add
>  - Create
>  -    delete
>  -    pull
>  -    fetch
>  -    delete  
>  
> **stashing**
>  **tagging**
>  **best practices**


To setup a remote repository

    cd /home/balaji142857/Documents/20170513/central_repo
    git init --bare 
  
To create a normal repository

    cd /home/balaji142857/Documents/20170513/repo
    git init
 Add reference to remote

      git remote add origin ../central_repo

Now add some files to the repository ( I have placed the unzipped version of [twitter bootstrap](https://github.com/twbs/bootstrap/releases/download/v3.3.7/bootstrap-3.3.7-dist.zip) in repo directory)

     git add css/
     git add fonts/
     git add js/
     git commit -m "Initial commit - codebase"
    
Lets make some changes to the repo & commit it

    git rm css/bootstrap-theme.css.map
    git rm css/bootstrap.css
    git rm css/bootstrap.css.map
    git rm js/bootstrap.js
    git rm js/npm.js
    git commit -m "Retaining only minified version of css/js, purging others"

Now we have two commits:

     git log --oneline 
     8e0d789 Retaining only minified version of css/js, purging others 
     d56e051 Initial commit - codebase
Lets push it to the central repo

    git push origin master
    cd ../central_repo/
    git log --oneline
    8e0d789 Retaining only minified version of css/js, purging others
    d56e051 Initial commit - codebase

Now both the commits are available in our central repository as well :)

Lets say we are going to start development and will need the plain css files for reference (not just the minifed versions). We can checkout a previous commit

    cd ../repo
    git checkout -b tempBranch d56e051
    Switched to a new branch 'tempBranch'
Had we just used `git checkout d56e051` and not used a temporary branch, we would have ended up in a [detached head](http://stackoverflow.com/questions/3965676/why-did-my-git-repo-enter-a-detached-head-state) state. It can be [fixed](http://stackoverflow.com/questions/10228760/fix-a-git-detached-head) however.

Now we have all the plain css files and the .css.map files as well in our repo.

    ls -l css/
    total 1308
    -rw-rw-r-- 1 balaji142857 balaji142857 146010 May 13 11:12 bootstrap.css
    -rw-rw-r-- 1 balaji142857 balaji142857 389287 May 13 11:12 bootstrap.css.map
    -rw-r--r-- 1 balaji142857 balaji142857 121200 Jul 25  2016 bootstrap.min.css
    -rw-r--r-- 1 balaji142857 balaji142857 542194 Jul 25  2016 bootstrap.min.css.map
    -rw-r--r-- 1 balaji142857 balaji142857  26132 Jul 25  2016 bootstrap-theme.css
    -rw-rw-r-- 1 balaji142857 balaji142857  47706 May 13 11:12 bootstrap-theme.css.map
    -rw-r--r-- 1 balaji142857 balaji142857  23409 Jul 25  2016 bootstrap-theme.min.css
    -rw-r--r-- 1 balaji142857 balaji142857  25648 Jul 25  2016 bootstrap-theme.min.css.map

Assuming that we have got what we intended to from the plain css, lets revert to the latest codebase. Before doing so, lets first look at the available branches and then delete the temporary branch.

    git branch -a
    master
    * tempBranch
    remotes/origin/master

    git branch -d tempBranch
    error: Cannot delete the branch 'tempBranch' which you are currently on.
    
    git checkout master
    Switched to branch 'master'
    
    git branch -d tempBranch
    Deleted branch tempBranch (was d56e051).

Staging unstaging and amend the last commit
    As seen above, to stage a change (adding to index), just use `git add path/to/file`
Whenever we have some changes staged and issue `git status`, git itself would tell us how to unstage. Example:

    echo "test" > deleteMe.tmp
    git add deleteMe.tmp
    git status
    #response
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
       
        new file:   deleteMe.tmp

Let use the command git provided and unstage the change we just made

    git reset HEAD deleteMe.tmp
    git status
    #response
    On branch master
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
       
        deleteMe.tmp
       
Now lets try amending the last commit (not creating a new commit, adding changes to the last commit). Lets look at the existing commits first:

    git log --oneline
    8e0d789 Retaining only minified version of css/js, purging others
    d56e051 Initial commit - codebase
    
Scenario: Lets say we want to start using maven to build our project and have that change pushed along the previous commit. Have created a dummy pom.xml file as below

    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>com.krishnan.balaji</groupId>
        <artifactId>parent-module</artifactId>
        <packaging>pom</packaging>
        <version>1.0-SNAPSHOT</version>
        <name>parent-module</name>
        <url>http://maven.apache.org</url>
        <properties>
                <junit.version>3.8.1</junit.version>
                <logback.version>1.2.3</logback.version>
        </properties>
        <dependencyManagement>
                <dependencies>
                        <dependency>
                                <groupId>ch.qos.logback</groupId>
                                <artifactId>logback-classic</artifactId>
                                <version>${logback.version}</version>
                        </dependency>
                </dependencies>
        </dependencyManagement>
        <dependencies>
                <dependency>
                        <groupId>junit</groupId>
                        <artifactId>junit</artifactId>
                        <version>${junit.version}</version>
                        <scope>test</scope>
                </dependency>
        </dependencies>
</project>

Lets add the pom.xml to the existing commit

    git commit --amend -m "Retaining only minified version of css/js, introducing maven build"
    git log --oneline
    e0fbaf7 Retaining only minified version of css/js, introducing maven build
    d56e051 Initial commit - codebase

[**Git reset**](http://stackoverflow.com/questions/3528245/whats-the-difference-between-git-reset-mixed-soft-and-hard)
When you modify a file in your repository, the change is initially unstaged. In order to commit it, you must stage it—that is, add it to the index—using git add. When you make a commit, the changes that are committed are those that have been added to the index.

---------
git reset changes, at minimum, where the current branch (HEAD) is pointing. The difference between --mixed and --soft is whether or not your index is also modified. So, if we're on branch master with this series of commits:

- A - B - C (master)
HEADpoints to C and the index matches C.

When we run git reset --soft B, master (and thus HEAD) now points to B, but the index still has the changes from C; git status will show them as staged. So if we run git commit at this point, we'll get a new commit with the same changes as C.

------
Okay, so starting from here again:

- A - B - C (master)
Now let's do git reset --mixed B. (Note: --mixed is the default option). Once again, master and HEAD point to B, but this time the index is also modified to match B. If we run git commit at this point, nothing will happen since the index matches HEAD. We still have the changes in the working directory, but since they're not in the index, git status shows them as unstaged. To commit them, you would git add and then commit as usual.

----------
And finally, --hard is the same as --mixed (it changes your HEAD and index), except that --hard also modifies your working directory. If we're at C and run git reset --hard B, then the changes added in C, as well as any uncommitted changes you have, will be removed, and the files in your working copy will match commit B. Since you can permanently lose changes this way, you should always run git status before doing a hard reset to make sure your working directory is clean or that you're okay with losing your uncommitted changes.



![Git reset Visualization](https://i.stack.imgur.com/qRAte.jpg)


**Stashing**
The `git stash` command takes your uncommitted changes (both staged and unstaged), saves them away for later use, and then reverts them from your working copy
At this point you're free to make changes, create new commits, switch branches, and perform any other Git operations; then come back and re-apply your stash when you're ready.
`git stash pop` command removes the changes from your stash and reapplies them to your working copy
Alternatively, you can reapply the changes to your working copy and keep them in your stash with `git stash apply`

*By default, running git stash will stash:*

 - changes that have been added to your index (staged changes)
 - changes made to files that are currently tracked by Git (unstaged changes)
*But it will not stash:*
 - new files in your working copy that have not yet been staged
 - files that have been ignored

> Adding the -u option (or --include-untracked) tells git stash to also stash your untracked files:
> You can include changes to ignored files as well by passing the -a option (or --all) when running git stash.


By default, stashes are identified simply as a "WIP" – work in progress – on top of the branch and commit that you created the stash from. After a while it can be difficult to remember what each stash contains

    $ git stash list
    stash@{0}: WIP on master: 5002d47 our new homepage
    stash@{1}: WIP on master: 5002d47 our new homepage
    stash@{2}: WIP on master: 5002d47 our new homepage

it's good practice to annotate your stashes with a description, using git stash save "message":

    $ git stash save "add style to our site"
    Saved working directory and index state On master: add style to our site
    HEAD is now at 5002d47 our new homepage
    $ git stash list
    stash@{0}: On master: add style to our site
    stash@{1}: WIP on master: 5002d47 our new homepage
    stash@{2}: WIP on master: 5002d47 our new homepage

By default, git stash pop will re-apply the most recently created stash: stash@{0}

You can choose which stash to re-apply by passing its identifier as the last argument, for example:

    $ git stash pop stash@{2}

**Best Practices**
***commit messages:*** 

 1. Keep in mind: This has all been said before.
 2. Separate subject from body with a blank line
 3. Limit the subject line to 50 characters
 4. Capitalize the subject line
 5. Do not end the subject line with a period
 6. Use the imperative mood in the subject line
 7. Wrap the body at 72 characters
 8. Use the body to explain what and why vs. how
  
***branches:***
https://softwareengineering.stackexchange.com/questions/165725/git-branching-and-tagging-best-practices

**References**

 - https://www.atlassian.com/git/tutorials/git-stash
 - http://stackoverflow.com/questions/2003505/how-to-delete-a-git-branch-both-locally-and-remotely
 - http://stackoverflow.com/questions/3965676/why-did-my-git-repo-enter-a-detached-head-state
 - http://stackoverflow.com/questions/10228760/fix-a-git-detached-head
 - http://stackoverflow.com/questions/3528245/whats-the-difference-between-git-reset-mixed-soft-and-hard
 - https://git-scm.com/book/en/v2/Git-Basics-Tagging