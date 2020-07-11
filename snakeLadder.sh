#!/bin/bash -x
START_POSITION=0;
FINAL_POSITION=100;
P1_START_POS=0;

function rollDie()
{
random=$(((RANDOM%6)+1))
echo $random
}

rollDie
