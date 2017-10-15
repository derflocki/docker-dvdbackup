#!/bin/bash
TEMPDIR=/tmp/`date +%s`
TITILE=$(lsdvd 2> /dev/null | awk '/Disc Title: / {print $3}')

echo ">> ripping DVD to " $TEMPDIR/$TITILE".iso"

mkdir -p "$TEMPDIR"

echo ">> dvdbackup..."
dvdbackup -p -i /dev/dvd -M -o "$TEMPDIR" -n "$TITILE"

echo ">> genisoimage..."
genisoimage -dvd-video -o /rips/$(date --iso=seconds | sed -r 's/(.*)\+.*/\1/')-$TITILE".iso" "$TEMPDIR/$TITILE"

echo ">> rm dvd folder..."
rm -rf "$TEMPDIR/$TITILE"
