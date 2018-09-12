#!/bin/bash

if [ "$#" -lt 4 ] || [ "$(id -u)" != "0" ] ; then
	echo "Usage: sudo adduser_wordpress.sh [wordpress] [username] [email] [name]"
	exit 1
fi

wordpress="$1"
username="$2"
email="$3"
name="$4"

sudo -u www-data wp --path="$wordpress" user get "$username"

if [ $? -eq 0 ] ; then
	echo "WordPress user $username exists already (not adding user)."
	exit
fi

sudo -u www-data wp --path="$wordpress" \
	user create "$username" "$email" \
	--first_name="$name" \
	--display_name="$name" \
	--send-email

if [ $? -ne 0 ] ; then
	echo "Could not add WordPress user."
	exit 1
else
	echo "Added WordPress user $username and emailed $email"
fi
