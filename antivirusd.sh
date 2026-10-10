#!/bin/bash
if ! [ -f directory-info.last ]
then
for file in $1/*
do
if [ -f whitelist.txt ] && grep -x "$(basename "$file")" whitelist.txt
then 
	continue
fi
case $file in
*.exe|*.bat|*.vbs|*.scr|*.ps1)
echo "$file is malicious and it is DELETED"
cp $file $2
rm $file
;;
*)
if grep -i virus $file||grep -i trojan $file||grep -i malware $file||grep -i worm $file||grep -i ransomware $file
then
echo "$file is malicious and it is DELETED"
cp $file $2
rm $file
fi
;;
esac
done
ls -l $1 > directory-info.last
fi
while true
do
sleep $3
ls -l $1 > directory-info.new
if ! diff directory-info.last directory-info.new
then
for file in $1/*
do
if [ -f whitelist.txt ] && grep -x "$(basename "$file")" whitelist.txt
then 
        continue
fi
case $file in
*.exe|*.bat|*.vbs|*.scr|*.ps1)
echo "$file is malicious and it is DELETED"
cp $file $2
rm $file
;;
*)
if grep -i virus $file||grep -i trojan $file||grep -i malware $file||grep -i worm $file||grep -i ransomware $file
then
echo "$file is malicious and it is DELETED"
cp $file $2
rm $file
fi
;;
esac
done
cp directory-info.new directory-info.last
fi
done

