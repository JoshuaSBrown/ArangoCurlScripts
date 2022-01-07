
echo "First Name: $1"

#response=$(curl -X POST -u root:"" --header 'accept: application/json' --data-binary @- --dump - http://172.20.49.72:8529/_api/cursor << EOF
#{"query" : "INSERT {\"first_name\": \"George\", \"last_name\": \"White\"} INTO users"}
#EOF
#) # Remove header

response=$(curl -X POST -u root:"" --header 'accept: application/json' --data-binary @- --dump - http://172.20.49.72:8529/_api/cursor << EOF
{ "query" : "INSERT {\"first_name\": @first_name, \"last_name\": \"White\"} INTO users",
  "bindVars" : { "first_name": "$1" }
}
EOF
) # Remove header



json_data=$(echo "$response" | sed '1,/^\r\{0,1\}$/d')
echo "$json_data" | jq

