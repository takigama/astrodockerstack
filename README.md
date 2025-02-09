# Docker set for astrophotography

Its a bunch of custom containers that get built for doing astrophotography in linux. Yeah, i love containers a little too much, currently has
 - Astrometry
 - gphoto2
 - indiserver

Its based on what im currently doing to remote control a telescope using a Nexstar 6se and a Canon EOS camera

This should be easily portable between architectures using buildx

## Knnowns
 - reading the gps to find my location and time

## Maybes
 - add a custom usb hub with 2 x uarts (FTX200's) that talk to the gps and aux port

## TODO
 - moonlight (For remote desktop)
 - webtop (for all the desktop apps required)
 - so many other things
 - figure out where a telescope is pointing from solve-field and calibrate the telescope externally (such as the way starsense autoalign does
	- solve-field, wcs-info outputs RA/dec of center
	- solve-field --overwrite -D test/ -N none --temp-axy -M none -U none -R none -C none -B none -S `pwd`/this.solved --wcs `pwd`/this.wcs $1
		 - this outputs 3 files into the test directory which has the tages images and this.solved to claim solve and this.wcs the RA/DEC
