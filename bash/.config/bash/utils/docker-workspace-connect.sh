NAME=$1

if [ "$NAME" = "" ]; then
	NAME=$(cat ~/.config/dw/workspaces.txt | sort --reverse | gum filter)
fi

sudo docker exec -it $NAME tmux a
