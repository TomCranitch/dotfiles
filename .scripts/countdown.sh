seconds=$1; date1=$((`date +%s` + $seconds));file=$2;
while [ "$date1" -ge `date +%s` ]; do 
  echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)" > $2; 
  sleep 0.1;
done
echo "Time's Up!" > $2;
