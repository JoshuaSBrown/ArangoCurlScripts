# Get information about the current database
response=$(curl -X POST -u root:"" --header 'accept: application/json' --data-binary @- --dump - http://172.20.49.72:8529/_api/database << \
EOF
{
  "name" : "example_database",
  "options" : {
    "sharding" : "flexible",
    "replicationFactor" : 3
  }
}
EOF
) # Remove header

json_data=$(echo "$response" | sed '1,/^\r\{0,1\}$/d')
echo "$json_data" | jq

