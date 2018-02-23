#! /bin/sh

error () {
	echo $@
	exit 1
}

[ -z "$1" ] && error "Nothing to wrap."

# Keep a cache.
if [ ! -d ./squashfs-root-$1/ ]; then
	./$1 --appimage-extract > /dev/null
	mv ./squashfs-root/ ./squashfs-root-$1
fi

exec ./squashfs-root-$1/AppRun $@
