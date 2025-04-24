set -e

NAME=$(gum input --placeholder name)
TYPE=$(gum choose coding-golang writing)

echo $NAME >> ~/.config/dw/workspaces.txt

if [ "$TYPE" = "coding-golang" ]; then
	GIT_REPO=$(tac ~/.config/dw/git-repos.txt | gum filter)

	if [ "$GIT_REPO" = "create new" ]; then
		GIT_REPO=$(gum input --placeholder "repo")
		echo $GIT_REPO >> ~/.config/dw/git-repos.txt
	fi

	mkdir tmpfordwc

	DIRS=$(ls -d ~/.ssh/*/)
	GIT_KEYS_DIR=$(gum choose $DIRS)

	cp -r $GIT_KEYS_DIR* tmpfordwc/

	sudo docker build \
		-t $NAME \
		--build-arg "IMAGE=golang" \
		--build-arg "LSP_SERVER=gopls" \
		--build-arg "TEAMOCIL_LAYOUT=golang" \
		--build-arg "TYPE=$TYPE" \
		--build-arg "GIT_REPO=$GIT_REPO" \
		--build-arg "GIT_KEYS_DIR=./tmpfordwc" \
		-f ~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env/Dockerfile \
		.

	rm -r tmpfordwc
elif [ "$TYPE" = "writing" ]; then
	sudo docker build \
		-t $NAME \
		--build-arg "TEAMOCIL_LAYOUT=writing" \
		--build-arg "TYPE=$TYPE" \
		-f ~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env/Dockerfile \
		.
fi

sudo docker run -dit --name $NAME $NAME
