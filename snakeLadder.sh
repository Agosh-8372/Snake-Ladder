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
					playerPos1=$((playerPos1+count))
					echo "You got Ladder: Dice value=$count & player position="$playerPos1
								;;
				2)
					count=$(rollDie)
						if [ $playerPos1 -le $START_POSITION ]
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
