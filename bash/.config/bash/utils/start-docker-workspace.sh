NAME=$(gum input --placeholder name)
TYPE=$(gum choose coding-golang writing)

if [ $TYPE = "coding-golang" ]; then
	sudo docker build \
		-t $NAME \
		--build-arg "IMAGE=golang" \
		--build-arg "LSP_SERVER=gopls" \
		--build-arg "TEAMOCIL_LAYOUT=golang" \
		--build-arg "TYPE=$TYPE" \
		~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env
elif [ $TYPE = "writing" ]; then
	sudo docker build \
		-t $NAME \
		--build-arg "TEAMOCIL_LAYOUT=writing" \
		--build-arg "TYPE=$TYPE" \
		~/.code/github.com/TotallyNotLost/dotfiles/docker/dev-env
fi

sudo docker run -dit --name $NAME $NAME
