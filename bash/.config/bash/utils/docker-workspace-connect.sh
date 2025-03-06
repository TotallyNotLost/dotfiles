set -e

NAME=$1

if [ "$NAME" = "" ]; then
	NAME=$(tac ~/.config/dw/workspaces.txt | gum filter)
fi

sudo docker exec -it $NAME tmux a
