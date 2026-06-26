#!/bin/sh
echo "=== API Poker DevOps AI Kingdom ==="
echo "Target: $1"
echo ""
curl -s "$1" | jq '.' 2>/dev/null || curl -s "$1"
echo ""
echo "Poke complete."
