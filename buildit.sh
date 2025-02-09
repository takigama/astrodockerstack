#!/bin/bash
TO_BUILD="Astrometry gphoto2 indiserver"
BUILD_TAG="0.1"

(
for i in $TO_BUILD
do
	LOWER_NAME=`echo "$i" | tr '[:upper:]' '[:lower:]'`
	echo; echo; echo
	echo "Building $i as $LOWER_NAME:$BUILD_TAG"
	docker build --progress=plain -t $LOWER_NAME:$BUILD_TAG . 2>&1
done
) | tee build.log
