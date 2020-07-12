START_POSITION=0; 
FINAL_POSITION=100;

playerPos1=0;
dieCount=6;
function rollDie()
{
	diceValue=$(((RANDOM%6)+1))
	echo $diceValue
}


function play()
{
	while (( $playerPos1 < $FINAL_POSITION ))
	do
		random=$((RANDOM%3))
			case $random in
				0)
					echo "NO PLAY : player position="$playerPos1
					       	;;
				1)
					count=$(rollDie)
					reqValue=$((FINAL_POSITION-playerPos1))
							if [ $reqValue -gt $dieCount ]
							then
								playerPos1=$((playerPos1+count))
								echo "You got Ladder: Dice value=$count & player position="$playerPos1
							elif [ $reqValue -le $dieCount ] && [ $count -le $reqValue ]
							then
								playerPos1=$((playerPos1+count))
								echo "You got Ladder: Dice value=$count & player position="$playerPos1
							else
								echo "You got Ladder: Dice value=$count & player position="$playerPos1
							fi
								;;
				2)
					count=$(rollDie)
						if [ $playerPos1 -le $START_POSITION ]||[ $playerPos1 -lt $count ]
						then
								playerPos1=0;
          					echo "Got a Snake: Dice value=$count & player position="$playerPos1
						else
								playerPos1=$((playerPos1-count))
								echo "Got a Snake: Dice value=$count & player position="$playerPos1
						fi
								;;
			esac
	done
}
play
