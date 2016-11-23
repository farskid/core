bodyfile=$1
url=$2
curl -H "Content-Type: application/json" --data @$bodyfile $url
