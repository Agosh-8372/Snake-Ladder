START_POSITION=0;
FINAL_POSITION=100;
DICE_VALUE_LIMIT=6;

playerPosCount=0;
playerFirstPos=0;
playerSecondPos=0;
diceCount=0;
player1="true"
player2="false"
player="Player1"

function rollDie(){
	((++diceCount))
	diceValue=$(((RANDOM%6)+1))
	echo "dice value="$diceValue
	return;
}

function checkWin(){
	if [[ $playerFirstPos -eq $FINAL_POSITION ]]
	then
		echo "Player 1 Wins and total times die rolled=$diceCount"
	elif [[ $playerSecondPos -eq $FINAL_POSITION ]]
	then
		echo "player 2 Wins  and total times die rolled=$diceCount"
	else
		echo "error"
fi
}

function noPlay(){
	echo "$player position=$playerPosCount"
	chance
}

function ladder(){
rollDie
reqValue=$((FINAL_POSITION-playerPosCount))
	if [ $reqValue -gt $DICE_VALUE_LIMIT ]
	then
		playerPosCount=$((playerPosCount+diceValue))
	elif [[ $reqValue -gt $START_POSITION ]] && [[ $reqValue -le $DICE_VALUE_LIMIT ]] && [[ $diceValue -le $reqValue ]]
	then
		playerPosCount=$((playerPosCount+diceValue))
	else
		playerPosCount=$playerPosCount
	fi
update
echo "$player position =$playerPosCount"
	if [[ $playerPosCount -lt $FINAL_POSITION ]]
	then
		playCondition
	else
		checkWin
	fi
}

function snake()
{
rollDie
playerPosCount=$((playerPosCount-diceValue))
	if [ $playerPosCount -lt $START_POSITION ]
	then
		playerSecondPos=$START_POSITION
		playerPosCount=$START_POSITION
	fi
echo "$player position =$playerPosCount"
update
chance
}

function chance()
{
	if [[ $player1 == true ]]
	then
		player1="false"
		player2="true"
		player="Player2"
		playerPosCount=$playerSecondPos
	else
		player1="true"
		player2="false"
		player="Player1"
		playerPosCount=$playerFirstPos
	fi
}

function update()
{
	if [[ $player1 == true ]]
	then
		playerFirstPos=$playerPosCount
	else
		playerSecondPos=$playerPosCount
	fi
}

function playCondition()
{
random=$((RANDOM%3))
	case $random in
		0)
			echo "NO PLAY"
			noPlay
			;;
		1)
			echo "Got  Ladder"
			ladder
			#playCondition
			;;
		2)
			echo "Got a Snake: "
			snake
			;;
	esac
}
while (( $playerPosCount < $FINAL_POSITION ))
do
	playCondition
done

