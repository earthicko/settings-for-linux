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
			cp -f $2 $1
		fi
	else
		cp $2 $1
	fi
}

read -p "Setting .vimrc in $VIMRC_DST: continue? " INPUT
if [ "$INPUT" = "Y" ] || [ "$INPUT" = "y" ]
then
	write_with_confirm $VIMRC_DST $VIMRC_SRC
fi

read -p "Setting git configs: continue? " INPUT
if [ "$INPUT" = "Y" ] || [ "$INPUT" = "y" ]
then
	bash ./src/setup-git.sh
fi

read -p "Setting openbox config in $LUBUNTURC_DST: continue? " INPUT
if [ "$INPUT" = "Y" ] || [ "$INPUT" = "y" ]
then
	write_with_confirm $LUBUNTURC_DST $LUBUNTURC_SRC
fi
