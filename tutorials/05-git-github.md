# Tutorial: Git and GitHub

By [Dan Phiffer](https://phiffer.org/)

Git is a popular way to organize files and track changes to them. If you've ever used Microsoft Word to _track changes_, Git and GitHub should seem familiar.

## Commits, repositories, and branches (oh my!)
 
The basic organizing unit in the Git universe is a *commit*. Each commit is like a snapshot of a certain arrangement of many files and the data they contain. A *repository* is the mechanism for collecting each of those commits, which are organized in sequences of threads called *branches*.

## GitHub

If all of this feels overwhelming, don't worry, that's normal. Git is infamous for having too many moving parts, too many options, and sometimes can feel overwhelming. There is a social media website called [GitHub](https://github.com/) that makes all of this much easier to understand.

## Create an account

Before we can do anything, we'll need to create a (free) account on GitHub.

* Go to [github.com](https://github.com/) and sign up using the form on the front page
* Choose the *free* option and click *continue* (you can skip the rest of the "account wizard" steps)
* Check for an email verification in your inbox and click on the verify link

## Check for SSH keys

In order to upload changes to GitHub, we need an SSH key pair. I know, this probably feels like a lot of trouble, but we only need to set it up once.

*Note: in earlier tutorials we have done some SSH key stuff already, and here we are going to pretend that __none of that happened__ for the sake of not getting things confused. We are starting fresh here, as though you did not already have keys for `dsj.organizer.network`.*

Let's check to see if you already have an SSH key pair.

Open the Terminal and then:

```
$ ls ~/.ssh/id_rsa.pub
```

If you see something like `No such file or directory` then *you do need to create a new key pair*. If you see the path repeated back to you then you already have keys and *you can skip the next section*.

## Generate an SSH key pair

Let's create a new SSH key pair.

```
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/dphiffer/.ssh/id_rsa):
```

* Press __Enter__ to accept the default name `id_rsa`
* Press __Enter__ twice more to accept no password

## Copy your public key

Now you can grab the contents of `id_rsa.pub` (the public key) in your clipboard.

```
$ pbcopy < ~/.ssh/id_rsa.pub
```

If you are using Windows or Linux you can open the file and copy/paste it without `pbcopy` (a macOS-specific utility).

## Add your public key to GitHub

In order for GitHub to know who you are, it'll need a copy of your public key.

* Go to the [GitHub homepage](https://github.com/)
* Click on the account menu on the very top-right part of the page
* Choose __Settings__
* Click on the __SSH and GPG Keys__ tab
* Click __New SSH Key__
* Enter __id_rsa.pub__ as the name and paste the contents of your key that you copied earlier
* Click the __Add SSH Key__ button

## Create a repo

Okay, now we can create a new repository on GitHub.

* Go to the [GitHub homepage](https://github.com/)
* Click on the + menu near the top-right part of the page
* Click *New Repository*
* Choose a name for your repo (something like "dan-midterm" but with your name instead of mine)
* Click *Create repository*

## Make a clone of your repository

Cloning the repository will let you start making commits and uploading your changes to GitHub.

* If you don't have it open already, go to the page for the repository you just created
* Click on the __SSH__ button in the __Quick Setup__ area of the repo
* Copy the URL for your repository (it should look like `git@github.com...`)

Now we'll clone the empty repository you just created onto your desktop. Note that you should replace the part that says `[your repo URL]` with the URL you just copied.

```
$ cd Desktop
$ git clone [your repo URL]
```

You should see something like:

```
Cloning into 'dan-midterm'...
warning: You appear to have cloned an empty repository.
```

## Adding new files

Let's add a new file to the repository. (You will need to change the `cd dan-midterm` part to your own folder name.)

```
$ cd dan-midterm
$ nano index.html
```

Type a basic "hello world" message into `index.html` and then save (__ctrl-O__, then __enter__) and quit (__ctrl-x__).

```
$ git add index.html
$ git status
```

The `git status` command should show you that you now have a new `index.html` file added to the repository.

```
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   index.html
```
That last part about "changes to be committed" is what we're interested in. Let's commit that change...

## Committing changes

One thing we need to do _before_ we commit the change. We need to set up one more config file for `git`. This will just take a minute, and you only need to do it once.

```
$ nano ~/.gitconfig
```

Then add the following text (replacing the name/email with your own).

```
[user]
        name = Dan Phiffer
        email = dan@phiffer.org
[push]
        default = simple
```

You'll want to save (__ctrl-O__, then __enter__) and quit (__ctrl-x__), as usual.

Ok, now we can make a new commit.

```
$ git commit -m "first commit"
```

The `-m "first commit"` part is a message _describing_ your changes. You should add a short description like that each time you make a new commit. (I have a weird habit of putting [emoji codes](https://www.webpagefx.com/tools/emoji-cheat-sheet/) into my commit messages, like `:sparkles: first commit`, but that is by no means required or encouraged.)

## Pushing your changes to GitHub

Okay, now that we've created a new file, added it to the repo, and committed the change, we can push that up to GitHub.

```
$ git push -u origin master
```

The `-u` part tells `git` that we want to set this to be our new _upstream_. You only need to do this once, from now on you can just type `git push` and it will assume the `origin master` upstream part.

## Rinse, repeat

Now you can edit files to your heart's content and follow this pattern to upload your changes to GitHub.

```
$ git add [file that changed]
$ git commit -m "description of the changes"
$ git push
```

And the changes will be tracked and archived. If you ever need to find an old revision, it's all there saved in the history.

## References

* [GitHub help: Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
* [Oh shit, git!](http://ohshitgit.com/)
* [git - the simple guide](http://rogerdudler.github.io/git-guide/)
