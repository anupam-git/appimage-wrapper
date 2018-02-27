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
if [ ! -d /tmp/squashfs-root-$BASENAME/ ]; then
	./$NAME --appimage-extract &> /dev/null
	mv ./squashfs-root/ /tmp/squashfs-root-$BASENAME
fi

/tmp/squashfs-root-$BASENAME/AppRun $@
