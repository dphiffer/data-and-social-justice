# Tutorial: ssh + scp + rsync

By [Dan Phiffer](https://phiffer.org/)

This tutorial offers an introduction to the Swiss army knife of networked computing: `ssh`. We'll start by generating a public/private key pair, then use them to login to a remote server. We will also cover `ssh`'s cousins `scp` and `rsync` which use an `ssh` connection to transfer files.

We're building on skills from the [command line tutorial](01-command-line.md) and we will be assuming that you have a USB thumb drive to store files onto.

## Logging into the server

Let's start out by logging into the server using SSH (secure shell). You'll want to replace the `dphiffer` below with your username.

```
$ ssh dphiffer@organizer.network
dphiffer@organizer.network's password:
```

Then, type your password in. You should see something like the following:

```
Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-33-generic x86_64)

  System information as of Mon Sep 10 21:59:53 UTC 2018

  System load:  0.01                Processes:             152
  Usage of /:   23.0% of 213.17GB   Users logged in:       0
  Memory usage: 15%                 IP address for enp2s0: 192.168.1.216
  Swap usage:   0%
 _        _ _           
| | _____| | | ___ _ __
| |/ / _ \ | |/ _ \ '__|
|   <  __/ | |  __/ |   
|_|\_\___|_|_|\___|_|   

This server is dedicated to disability rights activist Helen Keller.
https://en.wikipedia.org/wiki/Helen_Keller

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

0 packages can be updated.
0 updates are security updates.

Last login: Mon Sep 10 21:37:35 2018 from 204.77.151.204
dphiffer@keller:~$
```

If that didn't work for you, there are a couple things you can double-check:

1. did you specify the right username?
2. are you sure you got the password right?

For now, go ahead and logout from your SSH session once you know it's working.

```
$ exit
logout
Connection to organizer.network closed.
```

Next we will set up __public keys__ to use with the server. Public keys are kind of like passwords, but they're encoded into a file instead of being something you remember.

## Formatting your USB thumb drive

If you have a portable hard drive you want to use instead of a USB thumb drive, feel free to skip this section. Before you do, be sure to rename the drive `USB`. This is important for making sure all the configuration paths will work.

If you have any files on your USB thumb drive, copy them to another drive. We are going to reformat the disk to an __APFS (Encrypted)__ volume.

* In the Finder, go to __Applications → Utilities__ and double-click on __Disk Utility.app__.
* Select your thumb drive and double-check you have the right one selected, you really don't want to erase the wrong one.
* Click the __Erase__ button.
* Enter a `USB` as the name for your drive.
* Choose the Format as __APFS (Encrypted)__.
* Enter a password for your drive. Choose a password you will remember and make a note of it somewhere.
* Press the __Erase__ button.

![Format your USB thumb drive](img/02/02-0.png)

Now you should have a new disk mounted with the name `USB`.

## Generate your SSH key pair

Next we will generate an SSH key pair. This is kind of like a password that's stored on your disk as a pair of two files.

* The __public key__ is called a key but it is really more a personal lock that you can send to other people safely.
* The __private key__ is something you keep secret, it is the key to your lock and you should never share it with anyone.

Let's start by opening up the Terminal.

* In the Finder, go to __Applications → Utilities__ and double-click on __Terminal.app__.
* Change directory to your newly formatted USB thumb drive

```
$ cd /Volumes/USB
```

That command should work whether you have a USB thumb drive or another kind of external drive called `USB`.

Let's make a new folder for your SSH keys.

```
$ mkdir ssh
$ cd ssh
```

Now we can generate our new keys.

```
$ ssh-keygen
```

* You will be asked to provide a name, you should enter: `./organizer.network` (the `./` part means "put this file in the current folder.")
* When prompted for a password, just press enter (no password protection).
* Press enter again to confirm you don't want a password.

You should see something like the following:

```
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/dphiffer/.ssh/id_rsa): ./organizer.network
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ./organizer.network.
Your public key has been saved in ./organizer.network.pub.
```

The output will also include some extra information about your key's fingerprint.

* Your _private key_ that you should __never share__, is the file `organizer.network`
* Your _public key_ that is __okay to share__ is the file `oragnizer.network.pub`

## Transfer your public key

In order for you to get access to the server we're using in the course, you'll need to upload the _public_ key to the server. We will use `scp` (secure copy) to upload the file.

```
$ scp organizer.network.pub organizer.network:~/authorized_keys
dphiffer@organizer.network's password:
organizer.network.pub                        100%  400    11.7KB/s   00:00
```

This will upload a file to the server in your `~` directory and, in the process, rename the file to be `authorized_keys`. It's not super important that you understand all the parts of the command at this point. The main thing is that you see that `100%` part in the response.

## Back to SSH

For this next configuration we'll need to log back into the server.

```
$ ssh dphiffer@organizer.network
```

After you enter your password, create a new hidden `.ssh` folder:

```
$ mkdir -p ~/.ssh
```

Next, make sure you see the `authorized_keys` file that you uploaded before.

```
$ ls
authorized_keys
```

Now we can move the file into the `.ssh` folder.

```
$ mv authorized_keys .ssh/
```

## Test out the public keys

Now we can try logging in again using the key pair (again, with `dphiffer` replaced with your username).

```
$ ssh -i organizer.network dphiffer@organizer.network
```

If everything is working, you should get logged in without having to type your password.

The `-i organizer.network` part instructs `ssh` to use the private key (and associated `.pub` file) to login instead of using your password.

## SSH configuration

We can make the login process even easier, since that involves a whole lot of typing. Let's add some configuration settings for the server, which we'll nickname `keller`. These configurations will be stored on the thumb drive with our key pair.

```
$ nano /Volumes/USB/ssh/keller.config
```

And then add the following:

```
Host keller
	Hostname organizer.network
	Username dphiffer
	IdentityFile /Volumes/USB/ssh/organizer.network
```

Then, to save and quit out of `nano` type __ctrl-O__ to output and then __ctrl-X__ to exit.

Finally, we will add one more configuration that lives on the computer itself.

```
$ nano ~/.ssh/config
```

And we will add the following line, to include the other configuration that's on your your USB thumb drive.

```
Include /Volumes/USB/ssh/keller.config
```
