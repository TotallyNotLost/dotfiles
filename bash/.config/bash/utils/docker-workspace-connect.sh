set -e

NAME=$1

if [ "$NAME" = "" ]; then
	NAME=$(tac ~/.config/dw/workspaces.txt | gum filter)
fi

# Move the workspace to the bottom of the file so it shows up
# at the top of the gum filter next time
sed -i /^$NAME$/d ~/.config/dw/workspaces.txt
echo $NAME >> ~/.config/dw/workspaces.txt

sudo docker exec -it $NAME tmux a
