#!/bin/bash

docker build --progress=plain -t astrometry:0.1 . > build.log 2>&1
