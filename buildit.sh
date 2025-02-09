#!/bin/bash
TO_BUILD="Astrometry gphoto2 indiserver"
BUILD_TAG="0.1"

# start with a clean slate
docker builder prune -a -f

(
for i in $TO_BUILD
do
	LOWER_NAME=`echo "$i" | tr '[:upper:]' '[:lower:]'`
	echo; echo; echo
	echo "Building $i as $LOWER_NAME:$BUILD_TAG"
	docker build --progress=plain -t $LOWER_NAME:$BUILD_TAG ./$i 2>&1
	echo "Tag as latest"
	docker tag $LOWER_NAME:$BUILD_TAG $LOWER_NAME:latest
done
) | tee build.log
