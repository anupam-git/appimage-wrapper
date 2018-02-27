#! /bin/sh

error () {
	echo $@
	exit 1
}

[ -z "$1" ] && error "Nothing to wrap."

NAME=$1
BASENAME=$(basename $1)
shift

echo $BASENAME

# Keep a cache.
if [ ! -d ./squashfs-root-$BASENAME/ ]; then
	./$NAME --appimage-extract > /dev/null
	mv ./squashfs-root/ ./squashfs-root-$BASENAME
fi

./squashfs-root-$BASENAME/AppRun $@
