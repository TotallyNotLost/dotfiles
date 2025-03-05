NAME=$(gum input --placeholder name)
TYPE=$(gum choose coding-golang writing)

if [ $TYPE = "coding-golang" ]; then
	GIT_REPO=$(cat ~/.config/mdnotes/git-repos.txt | sort --reverse | gum filter)

	if [ "$GIT_REPO" = "create new" ]; then
		GIT_REPO=$(gum input --placeholder "repo")
		echo $GIT_REPO >> ~/.config/dw/git-repos.txt
	fi

	sudo docker build \
		-t $NAME \
		--build-arg "IMAGE=golang" \
		--build-arg "LSP_SERVER=gopls" \
		--build-arg "TEAMOCIL_LAYOUT=golang" \
		--build-arg "TYPE=$TYPE" \
		--build-arg "GIT_REPO=$GIT_REPO" \
		~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env
elif [ $TYPE = "writing" ]; then
	sudo docker build \
		-t $NAME \
		--build-arg "TEAMOCIL_LAYOUT=writing" \
		--build-arg "TYPE=$TYPE" \
		~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env
fi

echo $NAME >> ~/.config/dw/workspaces.txt

sudo docker run -dit --name $NAME $NAME
