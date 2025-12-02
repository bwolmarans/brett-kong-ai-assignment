# KONG AI ASSIGNMENT

## Part 1: Using quickstart script remote data-plane to single LLM
## Part 2: Konnect AiGw flow to LB between two different LLM's

### Part 1 - Quickstart - remote data-plane
<img width="1228" height="644" alt="Screenshot 2025-11-28 225632" src="https://github.com/user-attachments/assets/95dfc84e-fe37-46fd-8929-de584d482f63" />

```
export OPENAI_KEY=<your OpenAI key>
export KONNECT_TOKEN=<your token from KONNECT admin portal>
source deck_container_alias_command.sh
source konnect_aigw_envars.sh 
deck gateway ping
source kong-konnect-aigw-quickstart.sh

<img width="300" height="175" alt="image" src="https://github.com/user-attachments/assets/b23faa2d-eaee-474f-b687-0039b5298dd1" />

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



https://github.com/user-attachments/assets/5fd10ac7-5962-4767-a4dd-72d66579dd63



## Part 2 - To call AI Gateway in Konnect (no remote node)
<img width="709" height="289" alt="Screenshot 2025-11-28 225827" src="https://github.com/user-attachments/assets/caf3979e-c8d8-485b-ba8c-093b951cd3ae" />

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

## Debug Notes: To send a POST in Chrome dev tools, open a new tab, browse to http://52.206.9.54:8000

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
