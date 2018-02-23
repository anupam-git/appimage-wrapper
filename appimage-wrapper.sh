#! /bin/sh

error () {
	echo $@
	exit 1
}

[ -z "$1" ] && error "Nothing to wrap."

NAME=$1
shift

# Keep a cache.
if [ ! -d ./squashfs-root-$NAME/ ]; then
	./$NAME --appimage-extract > /dev/null
	mv ./squashfs-root/ ./squashfs-root-$NAME
fi

./squashfs-root-$NAME/AppRun $@
