#!/bin/sh
if [ "${1}" == "pre" ]; then
	betterlockscreen -l dimblur
elif [ "${1}" == "post" ]; then
	# Do the thing you want after resume here, e.g.:
	echo ""
fi
