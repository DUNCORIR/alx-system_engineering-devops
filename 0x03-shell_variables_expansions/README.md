0.alias ls='rm *': script that creates an alias.

Name: ls
Value: rm *
1.echo "hello $(whoami)":Create a script that prints hello user, where user is the current Linux user.
2.export PATH="$PATH:/action":Add /action to the PATH. /action should be the last directory the shell looks into when looking for a program
3.echo $PATH | tr ':' '\n' | wc -l:script that counts the number of directories in the PATH`
4.printenv:Creates a script that lists environment variables.
5.set: script that lists all local variables, environment variables, and functions.
6.BEST="School":Create a script that creates a new local variable.
Name: BEST
Value: School
7.export BEST="School":export BEST="School"export BEST="School":Create a script that creates a new global variable.
8.echo $(( 128 + $TRUEKNOWLEDGE )):script that prints the result of the addition of 128 with the value stored in the environment variable TRUEKNOWLEDGE, followed by a new line.
9.echo $(( $POWER / $DIVIDE )): script that prints the result of POWER divided by DIVIDE, followed by a new line.
10.echo $(( $BREATH ** $LOVE )):script that displays the result of BREATH to the power LOVE
11.echo $((2#$BINARY)):script that converts a number from base 2 to base 10i.
The number in base 2 is stored in the environment variable BINARY
The script should display the number in base 10, followed by a new line
12.echo {a..z}{a..z} | tr ' ' '\n' | grep -v "oo":script that prints all possible combinations of two letters, except oo
13.printf "%.2f\n" $NUM:script that prints a number with two decimal places, followed by a new line.
