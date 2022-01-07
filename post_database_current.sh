
echo "Attempting to switch to database $1"
# Get information about the current database
response=$(curl -X POST -u root:"" --header 'accept: application/json' --dump - http://172.20.49.72:8529/_api/database/current << \
EOF
{
  "name" : "arango_client_db",
}
EOF
) # Remove header



json_data=$(echo "$response" | sed '1,/^\r\{0,1\}$/d')
echo "$json_data" | jq

