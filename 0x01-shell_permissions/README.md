su: script that switches the current user to the user betty.
whoami:script that prints the effective username of the current user
groups:script that prints all the groups the current user is part of.
sudo chown betty hello:Write a script that changes the owner of the file hello to the user betty
touch hello:script that creates an empty file called hello
chmod +x hello:script that adds execute permission to the owner of the file hello.
chmod u+rwx,g+rx,o+r hello/chmod ug+x,o+r hello:script that adds execute permission to the owner and the group owner, and read permission to other users, to the file hello.
chmod u+rwx,g+rx,o+r hello:script that adds execution permission to the owner, the group owner and the other users, to the file hello
chmod 007 hello:Write a script that sets the permission to the file hello as follows:Owner: no permission at all
Group: no permission at all
Other users: all the permissions
chmod 751 hello:script that sets the mode of the file hello to this:-rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello
chmod --reference=olleh hello:script that sets the mode of the file hello the same as olleh’s mode
find . -type d -exec chmod +x {} +:script that adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users.
mkdir -m 751 my_dir:Create a script that creates a directory called my_dir with permissions 751 in the working directory
chgrp school hello:Write a script that changes the group owner to school for the file hello.
