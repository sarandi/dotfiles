#!/usr/bin/env bash
#echo $BASH_VERSION

# This should eventually be moved to extra

# when no arguments given exit with errcode 1
if [ -z "$@" ]
then
   >&2 echo "ERROR: You need to provide GitHub logins!"
   exit 1
fi

for user in $@
do
  echo "Fetching key for $user..."
  # fetch pubkeys by GitHub user login
  RESPONSE=$(su -c "curl https://api.github.com/users/$user/keys 2>/dev/null")
  # get the key from JSON
  KEY=$(echo $RESPONSE | sed -n 's/"key": "\(.*\)"/\1/p' | head -n1)

  # append the key to authorized_keys
  su -c "echo 'command=\"/usr/bin/tmux new -s $user -t pair\" $KEY' >> /home/pair/.ssh/authorized_keys" pair
done

# start ssh daemon
exec /usr/sbin/sshd -Def /etc/ssh/sshd_config

# Where is this from???