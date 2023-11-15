#! /bin/bash

# T1562.003 - Impair Defenses: HISTCONTROL

# Atomic Test 1 - Disable history collection
sh -c 'export HISTCONTROL=ignoreboth'
whoami
sh -c 'sleep 5'
echo 'HIST Test 1 completed'

# Atomic Test 4 - Clear bash history
bashfile=$(echo "$HOME")/.bash_history
cp ~/.bash_history ~/.bash_history.old
echo "" > ~/.bash_history
ls -la $HISTFILE
echo "" > ~/.bash_history
cat ~/.bash_history
history -c
sleep 10
# Clean up Atomic Test 4 - Clear bash history
mv -f ~/.bash_history.old ~/.bash_history
history -w
echo 'HIST Test 4 completed'

# Atomic Test 5 - Setting the HISTCONTROL environment variable
TEST=$(echo $HISTCONTROL)
if [ "$HISTCONTROL" != "ignoreboth" ]; then export HISTCONTROL="ignoreboth"; fi
history -c 
ls -la $HISTFILE # " ls -la $HISTFILE"
if [ $(history |wc -l) -eq 1 ]; then echo "ls -la is not in history cache"; fi
# -> ls -la is not in history cache
if [ "$HISTCONTROL" != "erasedups" ]; then export HISTCONTROL="erasedups"; fi
history -c 
ls -la $HISTFILE
ls -la $HISTFILE
ls -la $HISTFILE
if [ $(history |wc -l) -eq 2 ]; then echo "Their is only one entry for ls -la $HISTFILE"; fi
sleep 15
sh -c 'export HISTCONTROL=$(echo $TEST)'
echo 'HIST Test 5 completed'

# Atomic Test #6 - Setting the HISTFILESIZE environment variable
TEST=$(echo $HISTFILESIZE)
echo $HISTFILESIZE
export HISTFILESIZE=0
if [ $(echo $HISTFILESIZE) -eq 0 ]; then echo "\$HISTFILESIZE is zero"; fi
# -> $HISTFILESIZE is zero
sleep 10
export HISTCONTROL=$(echo $TEST)
echo 'HIST Test 6 completed'

# Atomic Test #7 - Setting the HISTSIZE environment variable
echo $HISTSIZE
export HISTSIZE=0
if [ $(echo $HISTSIZE) -eq 0 ]; then echo "\$HISTSIZE is zero"; fi
# -> $HISTSIZE is zero
sleep 10
export HISTSIZE=100
echo 'HIST Test 7 completed'

# Atomic Test #8 - Setting the HISTFILE environment variable
TEST=$(echo $HISTFILE)
echo $HISTFILE
export HISTFILE="/dev/null"
if [ $(echo $HISTFILE) == "/dev/null" ]; then echo "\$HISTFILE is /dev/null"; fi
# -> $HISTFILE is /dev/null
sleep 10
export HISTFILE=$(echo $TEST)
echo 'HIST Test 8 completed'

# Atomic Test #10 - Setting the HISTIGNORE environment variable
if ((${#HISTIGNORE[@]})); then echo "\$HISTIGNORE = $HISTIGNORE"; else export HISTIGNORE='ls*:rm*:ssh*'; echo "\$HISTIGNORE = $HISTIGNORE"; fi
# -> $HISTIGNORE = ls*:rm*:ssh*
history -c 
ls -la $HISTFILE
ls -la ~/.bash_logout
if [ $(history |wc -l) -eq 1 ]; then echo "ls commands are not in history"; fi
# -> ls commands are not in history
unset HISTIGNORE

if ((${#HISTIGNORE[@]})); then echo "\$HISTIGNORE = $HISTIGNORE"; else export HISTIGNORE='*'; echo "\$HISTIGNORE = $HISTIGNORE"; fi
# -> $HISTIGNORE = *
history -c 
whoami
groups
if [ $(history |wc -l) -eq 0 ]; then echo "History cache is empty"; fi
# -> History cache is empty

sleep 10
unset HISTIGNORE
echo 'HIST Test 10 completed'
