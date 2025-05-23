#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $(basename $0) prompt_to_send_to_perplexity"
  echo ""
  echo "Requirements: jq must be installed, and PERPLEXITY_API_KEY defined"
  exit 1
fi

echo 'input:'
echo $*
echo ''

current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")
directory=~/Documents/llm_queries
mkdir -p $directory
filename="${directory}/search_query_${current_datetime}.txt"

echo "$1" >> $filename
echo '' >> $filename

# Compose the JSON payload

# Available models:
#
## Search models
#
# sonar: A lightweight, cost-effective search model optimized for quick, grounded answers with real-time web search.
#
# sonar-pro: An advanced search model designed for complex queries, delivering deeper content understanding with enhanced citation accuracy.
#
## Research models
#
# sonar-deep-search: A powerful research model capable of conducting exhaustive searches, synthesizing expert-level insights, and generating detailed reports.
#
## Reasoning models
#
# sonar-reasoning: A reasoning-focused model that applies Chain-of-Thought (CoT) reasoning for quick problem-solving and structured analysis.
#
# sonar-reasoning-pro:
# A high-performance reasoning model leveraging advanced multi-step CoT reasoning and enhanced information retrieval.

json_request=$(jq -n \
  --arg content "$*" \
  '{
    "model": "sonar-pro",
    "messages": [
      {"role": "user", "content": $content}
    ]
  }')

# Make the API request
json_response=$(curl -sS https://api.perplexity.ai/chat/completions \
  -H "authorization: Bearer $PERPLEXITY_API_KEY" \
  -H 'Content-Type: application/json' \
  -d "$json_request")

# response example:
# {
#   "id": "foobar",
#   "model": "sonar-pro",
#   "created": 1746629013,
#   "usage": {
#     "prompt_tokens": 7,
#     "completion_tokens": 17,
#     "total_tokens": 24,
#     "search_context_size": "low"
#   },
#   "citations": [
#     "https://en.wikipedia.org/wiki/Paris",
#     "https://home.adelphi.edu/~ca19535/page%204.html",
#     "https://www.coe.int/en/web/interculturalcities/paris",
#     "https://www.britannica.com/place/Paris",
#     "https://en.wikipedia.org/wiki/List_of_capitals_of_France"
#   ],
#   "object": "chat.completion",
#   "choices": [
#     {
#       "index": 0,
#       "finish_reason": "stop",
#       "message": {
#         "role": "assistant",
#         "content": "The capital of France is Paris[1][2][3][4][5]."
#       },
#       "delta": {
#         "role": "assistant",
#         "content": ""
#       }
#     }
#   ]
# }

# Output the assistant's reply
model=$(echo "$json_response" | jq -r '.model')
content=$(echo "$json_response" | jq -r '.choices[].message.content')
citations=$(echo "$json_response" | jq -r '.citations')
total_tokens=$(echo "$json_response" | jq -r '.usage.total_tokens')

echo "$content" >> $filename

echo 'content:'
echo $content
echo ''
echo 'citations:'
echo $citations
echo ''
echo 'total tokens:'
echo $total_tokens
echo ''
echo 'model:'
echo $model

less $filename | sed 's/\\//g' | batcat --language markdown
