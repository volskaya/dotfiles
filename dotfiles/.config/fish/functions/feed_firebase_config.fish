function feed_firebase_config
firebase functions:config:set (jq -r 'to_entries[] | [.key, (.value | tojson)] | join("=")' < $argv)
end
