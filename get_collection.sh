# Get information about the current database

if [[ ! -z "$1" ]]
then
  response=$(curl -X GET -u root:"" --header 'accept: application/json' --dump - http://172.20.49.72:8529/_db/$1/_api/collection) # Remove header
else
  response=$(curl -X GET -u root:"" --header 'accept: application/json' --dump - http://172.20.49.72:8529/_api/collection) # Remove header
fi
json_data=$(echo "$response" | sed '1,/^\r\{0,1\}$/d')
echo "$json_data" | jq

