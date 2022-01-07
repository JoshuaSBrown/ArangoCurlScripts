# Get information about the current database
response=$(curl -X DELETE -u root:"" --header 'accept: application/json' --dump - http://172.20.49.72:8529/_api/database/example_database)

json_data=$(echo "$response" | sed '1,/^\r\{0,1\}$/d')
echo "$json_data" | jq

