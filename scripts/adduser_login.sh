#!/bin/bash

if [ "$#" -lt 4 ] || [ "$(id -u)" != "0" ] ; then
	echo "Usage: sudo adduser_login.sh [wordpress] [username] [email] [name]"
	exit 1
fi

host="organizer.network"
wordpress="$1"
username="$2"
email="$3"
name="$4"
url="https://organizer.network/week-2/tutorial-ssh-scp/"

if [ -d "/home/$username" ] ; then
	echo "/home/$username exists (not adding user login)"
	exit
fi

useradd -m "$username"

if [ $? -ne 0 ] ; then
	echo "Could not create login."
	exit 1
fi

password=`apg -n 1`
echo "$username:$password" | chpasswd

if [ $? -ne 0 ] ; then
	echo "Could not change password."
	exit 1
fi

cat << EOF > /tmp/user_email.txt
Hello $name,

Welcome to $host!

This email includes your temporary login credentials, which should
allow you to SSH into the server and change your password.

Here's what you should type into your command line terminal:

ssh $username@$host
Password: $password (input is hidden when you type this)

Once you login, you can change your password like this:

passwd

It will prompt you for your current password, and ask you to set a new
password. Note that you will receive a separate email from WordPress
about your login there. These are separate accounts, so changing the
password for one account won't apply to the other one.

You can find more info at:
$url

Have fun,
Dan
EOF

cmd="wp_mail('$email', 'Welcome to $host (SSH)', file_get_contents('/tmp/user_email.txt'));"
echo "$cmd" | sudo -u www-data wp --path="$wordpress" shell

if [ $? -ne 0 ] ; then
	echo "Could not email user."
	exit 1
else
	echo "Added login $username and emailed $email"
fi
