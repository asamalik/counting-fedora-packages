#!/bin/bash

cat all-pkgs.txt | sed -e 's/(\(.*\):.*:.*:.*)/(\1)/g' > all-pkgs-module-streams.txt

cat all-pkgs-module-streams.txt | grep \( > modular.txt
cat all-pkgs-module-streams.txt | grep -v \( > non-modular.txt

cat modular.txt | sed -e 's/\(.*\)-.*-.* \((.*)\)/\1 \2/g' > modular-names.txt
cat non-modular.txt | sed -e 's/\(.*\)-.*-.*/\1/g' > non-modular-names.txt

cat non-modular-names.txt > all-names.txt
cat modular-names.txt >> all-names.txt

cat all-names.txt | sort -u > all-names-unique.txt

echo "There are $(cat all-names-unique.txt | wc -l | tr -d ' ') binary RPM packages in total."
echo "Of those, $(cat all-names-unique.txt | grep \( | wc -l | tr -d ' ') come from a module stream."
