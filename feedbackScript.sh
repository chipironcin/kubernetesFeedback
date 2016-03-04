#!/bin/bash

export TERM=xterm-256color

BOLD="\e[1m"
NO_BOLD="\e[21m"
CLEAN_ATTRIBUTES="\e[0m"
GREEN="\e[38;5;34m"
GREEN_TWO="\e[32m"
READ_PROMPT=$(echo $'\n> ')

OVERALL_RATING=""
WRONG_INPUT=""

clear

echo "Before you go and forget all we have teached you, God forbid, we would like to get your feedback!"
echo "(Press enter ONLY if you want to do it)"
read
echo "Ok, I promise this will be short, and then we can have pizza together :) [Press Enter]"
read

echo "First thing we need to know is... Was it worth it? I mean, Friday evening? Are you crazy?"
read -e -p "Was it worth it?: $READ_PROMPT" WORTH_IT

echo ""
echo "Ok, we got it. Now we need you to express your overall satisfaction with the workshop, from 0 (I don't give a sh**) to 10 (will marry Jose Fuentes)..."

while ! [ "$WRONG_INPUT" = false ]
do
    WRONG_INPUT=false
    read -p "Overall rating [integer]: $READ_PROMPT" OVERALL_RATING
    if ! [ "$OVERALL_RATING" -eq "$OVERALL_RATING" ] &>/dev/null
    then
        echo "Sorry integers only"
        WRONG_INPUT=true
    elif [ "$OVERALL_RATING" -lt 0 ] || [ "$OVERALL_RATING" -gt 10 ]
    then
        echo "Sorry, the value has to be between 0 and 10"
        WRONG_INPUT=true
    fi
done

echo "Three more to go until you can get some pizza (yummmm) [Press Enter]"
read

read -e -p "What part did you like the most? Why?: $READ_PROMPT" MOST_LIKED
read -e -p "What part did you like the least? Why? (uninteresting, boring, very easy): $READ_PROMPT" LEAST_LIKED

read -e -p "Suggestions, comments, improvements: $READ_PROMPT" COMMENTS


echo "Wohoooo, you did it! Thanks for your answers, you are awesome!"
read -p "Now, for the last part of the trick, we need you to write here the server URL that will be processing all this feedback (organizers at the workshop will let you know): $READ_PROMPT" SERVER_URL

echo "overall_rating=$OVERALL_RATING&worth_it=$WORTH_IT&most_liked=$MOST_LIKED&least_liked=$LEAST_LIKED&comments=$COMMENTS" > data.txt
RESPONSE=$(curl -sS -X POST $SERVER_URL -d @data.txt --connect-timeout 15)
if [ $? -ne 0 ]
then
    echo "Data was not sent successfully. Please check the parameter you introduced and run the feedback tool again :("
    exit 1
elif [[ ! "$RESPONSE" =~ "Data received correctly" ]]
then
    echo "Server did not answer correctly. Please check the parameter you introduced and run the feedback tool again :("
    exit 1
else
    echo $RESPONSE
fi
#rm -R data.txt

echo "Let's close this workshop with some awesomeness...It's dangerous to go alone! Take this [press Enter]"
read
echo "Loading awesomeness, it will only take a few seconds"

tput sgr0
apt-get update && apt-get install -y nyancat &> /dev/null
nyancat
