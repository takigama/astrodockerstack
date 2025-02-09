#!/bin/bash

TO_BUILD="Astrometry gphoto2 indiserver"

(
for i in $TO_BUILD
do
	LOWER_NAME=`echo "$i" | tr '[:upper:]' '[:lower:]'`
	echo; echo; echo
	echo "Starting up container $i"
	docker kill $LOWER_NAME
	docker rm $LOWER_NAME
	docker run -d --privileged -v /dev/:/dev --name $LOWER_NAME $LOWER_NAME
done
) | tee build.log
