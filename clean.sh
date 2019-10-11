#!/bin/env bash
rm -rf ./*/src ./*/pkg
find . -type f -iname '*.src.tar.gz' -exec rm -v {} \;
find . -type f -iname '*.orig.tar.gz' -exec rm -v {} \;
find . -type f -iname '*.deb' -exec rm -v {} \;
find . -type f -iname '*.src.zip' -exec rm -v {} \;
#find . -type f -iname '*.snap' -exec rm -v {} \;
