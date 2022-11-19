VIMRC_SRC="./src/vimrc"
VIMRC_DST="$HOME/.vimrc"
LUBUNTURC_SRC="./src/lubuntu-rc.xml"
LUBUNTURC_DST="$HOME/.config/openbox/lubuntu-rc.xml"

write_with_confirm () {
	if test -f "$1"
	then
		read -p "$1 already exists. Replace? " INPUT
		if [ "$INPUT" = "Y" ] || [ "$INPUT" = "y" ]
		then
			cp $1 $2
		fi
	else
		cp $1 $2
	fi
}

echo "Setting .vimrc in $VIMRC_DST"
write_with_confirm $VIMRC_DST $VIMRC_SRC

echo "Setting git configs"
bash ./src/setup-git.sh

echo "Setting openbox config in $LUBUNTURC_DST"
write_with_confirm $LUBUNTURC_DST $LUBUNTURC_SRC
