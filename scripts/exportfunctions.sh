#!/bin/sh

ex_unrar()
{
	parallel "mkdir {.}" ::: "$1"
	parallel "unrar x -op{.} {}" ::: "$1"
}

ex_un7z()
{
	parallel "mkdir {.}" ::: "$1"
	parallel "7z -o{.} x {}" ::: "$1"
}

ex_undeb()
{
	parallel "mkdir {.}" ::: "$1"
	parallel "cp {} {.}" ::: "$1"
	parallel "cd {.}; ar x {}; cd .." ::: "$1"
}

ex_unzip()
{
	parallel unzip -d "{.}" "{}" ::: "$1"
}

# # ex = Extractor for all kinds of archives
# # usage: ex <file>
ex ()
{
	if [ -z "$1" ]
	then
		echo "usage: ex <file>"
		return 1
	fi

	if [ -f "$1" ]
	then
		case "$1" in
			*.tar.bz2)   	tar xjf "$1"   		;;
			*.tar.gz)    	tar xzf "$1"   		;;
			*.tar.xz)    	tar xJf "$1"		;;
			*.tar.zst)   	tar xf --zstd "$1"	;;
			*.tar.lz)	tar xf --lzip "$1"	;;
			*.bz2)       	bunzip2 "$1"   		;;
			*.rar)       	ex_unrar "$1" 		;;
			*.gz)        	gunzip "$1"    		;;
			*.tar)       	tar xf "$1"    		;;
			*.tbz2)      	tar xjf "$1"   		;;
			*.tgz)       	tar xzf "$1"   		;;
			*.ZIP)		ex_unzip "$1"		;;
			*.zip)		ex_unzip "$1"		;;
			*.Z)         	uncompress "$1"		;;
			*.7z)		ex_un7z "$1"		;;
			*.deb)       	ex_undeb "$1"      	;;
			*.lz)	  	lzip -d "$1"		;;
			*.zstd) 	zstd -d "$1" 		;;
			*.zst) 		zstd -d "$1" 		;;
			*) \
			echo "'$1' can't be extracted via ex()" ;;
		esac
	else
		echo "'$' is not a valid file"
	fi
}
export ex

ffv()
{
	if [ -f "$1" ]
	then
		case "$1" in
			*.png) png2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.PNG) png2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.jpg) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.JPG) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.jpeg) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.JPEG) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.ff) lel "$1" ;;
			*) echo "Can't convert that format." ''
		esac
	fi
	rm -f /tmp/image.ff
}

export ffv

bookmark_extract()
{
	echo "h1 a attr href > dest < src"
}

export bookmark_extract

tcc_bootstrap()
{
	old_ld="${LDFLAGS}"
	export LDFLAGS="-Wl,-z,defs -Wl,-z,now -Wl,-z,relro -Wl,-z,nodlopen -Wl,-z,noexecstack  -Wl,--as-needed "
	./configure --cc=tcc --extra-cflags="$CFLAGS"
	make -j24
	doas make install
	make clean
	export LDFLAGS="${old_ld}"
}

export tcc_bootstrap

sixel()
{
	[ -z "$1" ] && return

	convert "$1" -resize 500x500 sixel:-
}
export sixel

set_xterm_title()
{
	print -Pn "\e]0;$@\a"
}
export set_xterm_title
