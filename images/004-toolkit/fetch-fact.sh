#!/bin/bash
echo "=== DevOps AI Kingdom — Random Fact ==="
echo ""
RESPONSE=$(curl -s https://uselessfacts.jsph.pl/api/v2/facts/random)
FACT=$(echo "$RESPONSE" | jq -r '.text')
SOURCE=$(echo "$RESPONSE" | jq -r '.source')
echo "Fact: $FACT"
echo "Source: $SOURCE"
echo ""
echo "Brought to you by the toolkit image."
