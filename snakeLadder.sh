START_POSITION=0; 
FINAL_POSITION=100;
DICE_VALUE_LIMIT=6;

playerPos1=0;
diceCount=0;

function rollDie()
{
	((++diceCount))
	diceValue=$(((RANDOM%6)+1))

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
					rollDie
					reqValue=$((FINAL_POSITION-playerPos1))
							if [ $reqValue -gt $DICE_VALUE_LIMIT ]
							then
								playerPos1=$((playerPos1+diceValue))
								echo "You got Ladder: Dice value=$diceValue & player position="$playerPos1
							elif [ $reqValue -le $DICE_VALUE_LIMIT ] && [ $diceValue -le $reqValue ]
							then
								playerPos1=$((playerPos1+diceValue))
								echo "You got Ladder: Dice value=$diceValue & player position="$playerPos1
							else
								echo "You got Ladder: Dice value=$diceValue & player position="$playerPos1
							fi
								;;
				2)
					rollDie
						if [ $playerPos1 -le $START_POSITION ]||[ $playerPos1 -lt $diceValue ]
						then
								playerPos1=0;
          					echo "Got a Snake: Dice value=$diceValue & player position="$playerPos1
						else
								playerPos1=$((playerPos1-diceValue))
								echo "Got a Snake: Dice value=$diceValue & player position="$playerPos1
						fi
								;;
			esac
	done
echo -e "\nNumber of times dice was rolled in the game="$diceCount
}
play
