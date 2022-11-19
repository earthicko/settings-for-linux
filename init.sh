VIMRC_SRC="./src/vimrc"
VIMRC_DST="$HOME/.vimrc"

write_vimrc () {
	cp $VIMRC_SRC $VIMRC_DST
}

echo "Setting .vimrc in $VIMRC_DST"
if test -f "$VIMRC_DST"
then
	read -p "$VIMRC_DST already exists. Replace? " INPUT
	if [ "$INPUT" = "Y" ] || [ "$INPUT" = "y" ]
	then
		write_vimrc
	fi
else
	write_vimrc
fi
	
