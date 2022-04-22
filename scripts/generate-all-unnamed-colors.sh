#!/bin/bash

TOTAL_COLORS=$((256*256*256))
STEP_SIZE=8

for (( i=0; i<$TOTAL_COLORS; i+=$STEP_SIZE ))
do
   HEX=$(printf '%06x' $i)
   echo "" >> "../unnamed/#$HEX"

   if (( $i % 100 == 0 && $i != 0 ))
   then
      git add -A
      git commit -m "add: colours $(($i-100)) to $i"

      if (( $i % 1000 == 0 ))
      then
         git push
      fi
   fi

done
