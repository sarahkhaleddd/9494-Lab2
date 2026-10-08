#!/bin/bash
while true
do
if [ -z "$(ls $2)" ]
then
echo "No malicious files to review."
exit
fi
count=1
for file in $2/*
do
echo "$count. $file"
count=`expr $count + 1`
done
echo "Enter file number:"
read choice
count=1
for file in $2/*
do
if [ $count -eq $choice ]
then
selected=$file
fi
count=`expr $count + 1`
done
echo "1.Restore"
echo "2.Permanantly Delete"
echo "3.Leave as-is"
echo "Enter Choice:"
read action
if [ $action -eq 1 ]
then
cp $selected $1
rm $selected
echo "Restored $selected to $1."
exit
elif [ $action -eq 2 ]
then
rm $selected
echo "$selected permanantly deleted."
exit
else
echo "Leaving and going back to list"
fi
done
