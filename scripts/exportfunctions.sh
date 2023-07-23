#!/bin/sh


undeb()
{
	parallel mkdir "{.}" ::: "$1"
	parallel cp "{}" "{.}" ::: "$1"
	parallel "cd {.}; ar x {}; cd .." ::: "$1"
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
			*.rar)       	unrar x "$1"   		;;
			*.gz)        	gunzip "$1"    		;;
			*.tar)       	tar xf "$1"    		;;
			*.tbz2)      	tar xjf "$1"   		;;
			*.tgz)       	tar xzf "$1"   		;;
			*.ZIP)		parallel \
			unzip -d "{.}" "{}" ::: "$1"		;;
			*.zip)       	parallel \
			unzip -d "{.}" "{}" ::: "$1"		;;
			*.Z)         	uncompress "$1"		;;
			*.7z)        	7z x "$1"      		;;
			*.deb)       	undeb "$1"      	;;
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
	./configure --cc=tcc
	make -j24
	doas make install
	make clean
}

export tcc_bootstrap
