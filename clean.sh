#!/bin/env bash
# Global clean rules
rm -rvf ./*/src ./*/pkg ./*/*.pkg.tar.{xz,zst}
find . -type f -iname '*.src.tar.gz' -exec rm -v {} \;
find . -type f -iname '*.orig.tar.gz' -exec rm -v {} \;
find . -type f -iname '*.deb' -exec rm -v {} \;
find . -type f -iname '*.src.zip' -exec rm -v {} \;
#find . -type f -iname '*.snap' -exec rm -v {} \;

# Clean rules for certain packages
rm -vf ./majsoul-plus/*.tar.gz

# Clean nvchecker old files
rm -vf ./old.txt~
