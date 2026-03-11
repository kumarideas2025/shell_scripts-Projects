#!/bin/bash

# Script should be executed with sudo/root access.
if [[ "${UID}" -ne 0 ]]
then
    echo 'Please run with sudo or root.'
    exit 1
fi

# User should provide at least one argument as username else guide him
if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    echo 'Create a user with name USER_NAME and comments field of COMMENT'
    exit 1
fi

# Store 1st argument as user name
USER_NAME="${1}"

# In case of more than one argument, store it as account comments
COMMENT="${@:2}"

# Create a random password (8 characters)
PASSWORD=$(openssl rand -base64 8)

# Create the user
useradd -c "$COMMENT" -m "$USER_NAME"

# Check if user is successfully created or not
if [[ $? -ne 0 ]]
then
    echo 'The account could not be created'
    exit 1
fi

# Set the password for the user
echo "$USER_NAME:$PASSWORD" | chpasswd

# Check if password is successfully set or not
if [[ $? -ne 0 ]]
then
    echo 'Password could not be set'
    exit 1
fi

# Force password change on first login
passwd -e "$USER_NAME"

# Display the username, password and where it was created
echo
echo "Username : $USER_NAME"
echo "Password : $PASSWORD"
echo "Host : $(hostname)"



#-------> use to run
#sudo bash User_make.sh roy
