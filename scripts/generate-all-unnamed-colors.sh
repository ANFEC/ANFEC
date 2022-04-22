#!/bin/bash

TOTAL_COLORS=$((256*256*256))

for (( i=0; i<$TOTAL_COLORS; i++ ))
do
   HEX=$(printf '%06x' $i)
   echo "" >> "../unnamed/#$HEX"

   git add -A
   git commit -m "add(colour): \`$i\` represented as a file named \`#$HEX\`"

   if (( $i % 10000 == 0 && $i != 0 ))
   then
      git push
   fi
done
