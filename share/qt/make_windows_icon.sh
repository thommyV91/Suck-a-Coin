#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/Suck-a-Coin.png
ICON_DST=../../src/qt/res/icons/Suck-a-Coin.ico
convert ${ICON_SRC} -resize 16x16 Suck-a-Coin-16.png
convert ${ICON_SRC} -resize 32x32 Suck-a-Coin-32.png
convert ${ICON_SRC} -resize 48x48 Suck-a-Coin-48.png
convert Suck-a-Coin-48.png Suck-a-Coin-32.png Suck-a-Coin-16.png ${ICON_DST}

