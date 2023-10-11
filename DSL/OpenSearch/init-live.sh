#!/bin/bash

# Clear existing indices
curl -XDELETE 'http://localhost:9200/*' -u admin:admin --insecure

# responses
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/responses" -ku admin:admin --data-binary "@fieldMappings/responses.json"
curl -L -X POST 'http://localhost:9200/_scripts/response-with-name-and-text' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/response-with-name-and-text.json"

# intents
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/intents" -ku admin:admin --data-binary "@fieldMappings/intents.json"
curl -L -X POST 'http://localhost:9200/_scripts/intent-with-name' -H 'Content-Type: application.json' --data-binary "@templates/intent-with-name.json"
curl -L -X POST 'http://localhost:9200/_scripts/intents-with-examples-count' -H 'Content-Type: application/json' --data-binary "@templates/intents-with-examples-count.json"

# rules
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/rules" -ku admin:admin --data-binary "@fieldMappings/rules.json"
curl -L -X POST 'http://localhost:9200/_scripts/rule-with-name' -H 'Content-Type: application/json' --data-binary "@templates/rule-with-name.json"
curl -L -X POST 'http://localhost:9200/_scripts/rule-with-forms' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/rule-with-forms.json"
curl -L -X POST 'http://localhost:9200/_scripts/rule-with-responses' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/rule-with-responses.json"
curl -L -X POST 'http://localhost:9200/_scripts/rule-with-slots' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/rule-with-slots.json"

# stories
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/stories" -ku admin:admin --data-binary "@fieldMappings/stories.json"
curl -L -X POST 'http://localhost:9200/_scripts/story-with-name' -H 'Content-Type: application/json' --data-binary "@templates/story-with-name.json"
curl -L -X POST 'http://localhost:9200/_scripts/story-with-forms' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/story-with-forms.json"
curl -L -X POST 'http://localhost:9200/_scripts/story-with-responses' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/story-with-responses.json"
curl -L -X POST 'http://localhost:9200/_scripts/story-with-slots' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/story-with-slots.json"

# test-stories
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/test-stories" -ku admin:admin --data-binary "@fieldMappings/test-stories.json"
curl -L -X POST 'http://localhost:9200/_scripts/test-story-with-name' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/test-story-with-name.json"

# forms
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/forms" -ku admin:admin --data-binary "@fieldMappings/forms.json"
curl -L -X POST 'http://localhost:9200/_scripts/form-with-slot' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/form-with-slot.json"

# entities
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/entities" -ku admin:admin --data-binary "@fieldMappings/entities.json"
curl -L -X POST 'http://localhost:9200/_scripts/entity-with-name' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/entity-with-name.json"
curl -L -X POST 'http://localhost:9200/_scripts/entities-with-examples' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/entities-with-examples.json"

# regexes
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/regexes" -ku admin:admin --data-binary "@fieldMappings/regexes.json"
curl -L -X POST 'http://localhost:9200/_scripts/regex-with-name' -H 'Content-Type: application/json' -H 'Cookie: customJwtCookie=test' --data-binary "@templates/regex-with-name.json"

# examples-entities
curl -H "Content-Type: application/x-ndjson" -X PUT "http://localhost:9200/examples-entities" -ku admin:admin --data-binary "@fieldMappings/examples-entities.json"
