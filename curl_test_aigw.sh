curl -X POST "$KONNECT_PROXY_URL/chat" \
     -H "Accept: application/json"\
     -H "Content-Type: application/json"\
     -H "Authorization: Bearer $OPENAI_KEY" \
     --data '{
       "model": "gpt-4",
       "messages": [
         {
           "role": "user",
           "content": "Say this is a test!"
         }
       ]
     }'
