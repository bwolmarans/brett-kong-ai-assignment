# KONG AI ASSIGNMENT

```
export OPENAI_KEY=<your OpenAI key>
export KONNECT_TOKEN=<your token from KONNECT admin portal>
source deck_container_alias_command.sh
deck gateway ping
deck gateway apply llm_service.yaml
deck gateway apply openai-chat.yaml
deck gateway apply aiproxy_plugin.yaml

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

for i in {1..10}; do source curl_test_aigw.sh; done 
```


Uploading kong_remote_aigw - Made with Clipchamp.mp4…


## To send a POST in Chrome dev tools, open a new tab, browse to http://52.206.9.54:8000

### Ignore any errors, and then just a little bit of Javascript, nothing to be afraid of:

```
const OPENAI_KEY = <'your openai key here'>;
const headers = new Headers();
headers.append('Authorization', `Bearer ${OPENAI_KEY}`)
headers.append('Content-Type', 'application/json');

fetch('http://52.206.9.54:8000/chat', {
    method: 'POST',
    headers: headers,
    body: JSON.stringify({ // Stringify the body for JSON content-type
       "model": "gpt-4",
       "messages": [
         {
           "role": "user",
           "content": "Say this is a test!"
         }
       ]
    })
})
.then(response => {
    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }
    return response.json(); // Or response.text() if the response is not JSON
})
.then(data => {
    console.log('Success:', data);
})
.catch(error => {
    console.error('Error:', error);
});
```
## To call Claude directly

```
curl https://api.anthropic.com/v1/messages \
  -H "content-type: application/json" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d '{
    "model": "claude-sonnet-4-0",
    "max_tokens": 1024,
    "messages": [
      {
        "role": "user",
        "content": "Hello, Claude!"
      }
    ]
  }'
```
## to call OpenAI Directly

```
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
        "model": "gpt-4.1",
        "messages": [
          { "role": "user", "content": "Hello!" }
        ]
      }'

```

## To call AI Gateway datapath in Konnect 
### ( This is different and not the AI GW  running in my EC2 instance )
```
curl -X POST https://kong-f40972acc5us3jemn.kongcloud.dev/api/v1 \
-H 'Content-Type: application/json' -d '{
  "messages": [
    {
      "role": "user",
      "content": "How does Kong AI Gateway work?"
    }
  ]
}'

```


https://github.com/user-attachments/assets/b47682a6-fe11-4c20-ad2c-30adef042288


