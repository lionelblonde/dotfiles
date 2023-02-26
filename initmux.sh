#!/usr/bin/env bash

SESSIONNAME="main"
STARTDIR="$HOME/Documents"
tmux has-session -t apr &> /dev/null

# NOTE: C-m is an alternative to Enter (CR)
# NOTE: I specified in my tmux conf that the window numbers start at 1, not 0

if [ $? != 0 ]
then
    tmux new-session -s $SESSIONNAME -c $STARTDIR/notes -n "notes" -d
    tmux send-keys -t $SESSIONNAME:1 "ll" C-m
    tmux new-window -t $SESSIONNAME:2 -n "vitals" "htop"
    # tmux split-window -t $SESSIONNAME:2 -v "watch -n 2 nvidia-smi"
    tmux new-window -t $SESSIONNAME:4 -n "cover-letter" -c $STARTDIR/git/code/ego/noremote/cover-letters
    tmux new-window -t $SESSIONNAME:5 -n "resume-latex" -c $STARTDIR/git/code/ego/github/private/resume-latex
fi
tmux select-window -t $SESSIONNAME:1
# tmux attach -t $SESSIONNAME

# tmux new-session -d
# tmux rename 'boot'
# tmux renamew 'grunt'
# tmux new-window -n 'code' -c ~/Documents/notes
# tmux new-window -n 'math' -c ~/Documents/notes
# tmux new-window -n 'cheatsheet' -c ~/Documents/notes
# tmux new-window -n 'cl' -c ~/Documents/git/code/ego/noremote/cover-letters
# tmux new-window -n 'cv' -c ~/Documents/git/code/ego/github/private/resume-latex

# SESSIONNAME="niid"
# STARTDIR="/home/niid/Documents/Projects"
# tmux has-session -t apr &> /dev/null

# if [ $? != 0 ]
  # then
    # tmux new-session -s $SESSIONNAME -c $STARTDIR/TCM -n "jptr" -d
    # tmux send-keys -t $SESSIONNAME:0 "source activate TCM" C-m
    # tmux send-keys -t $SESSIONNAME:0 "CUDA_VISIBLE_DEVICES=1 jupyter notebook --allow-root" C-m
    # tmux split-window -t $SESSIONNAME:0 -v -c $STARTDIR/TCM
    # tmux send-keys -t $SESSIONNAME:0 "source activate TCM" C-m
    # tmux new-window -t $SESSIONNAME:1 -n "vitals" "htop"
    # tmux split-window -t $SESSIONNAME:1 -v "watch -n 2 nvidia-smi"
    # tmux new-window -t $SESSIONNAME:2 -n "KISHOW" -c $STARTDIR/kishow
    # tmux send-keys -t $SESSIONNAME:2 "source activate kishow" C-m
    # tmux split-window -t $SESSIONNAME:2 -v -c $STARTDIR/kishow
    # tmux send-keys -t $SESSIONNAME:2 "source activate kishow" C-m
    # tmux split-window -t $SESSIONNAME:2 -v -c $STARTDIR/kishow
    # tmux send-keys -t $SESSIONNAME:2 "source activate kishow" C-m
# fi
# tmux select-window -t $SESSIONNAME:0
# tmux attach -t $SESSIONNAME
