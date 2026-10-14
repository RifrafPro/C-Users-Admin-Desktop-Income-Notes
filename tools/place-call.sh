#!/bin/sh
# Place ONE ElevenLabs outbound call from a call JSON (agent_id, agent_phone_number_id, to_number, dynamic vars).
# Rich runs this himself (send-gate). Usage: bash tools/place-call.sh <call.json>
set -e
[ -f "$1" ] || { echo "usage: bash tools/place-call.sh <call.json>"; exit 1; }
K=$(grep -o 'ELEVENLABS_API_KEY=.*' "$HOME/.elevenlabs.env" | cut -d= -f2 | tr -d '\r"')
curl -s -X POST -H "xi-api-key: $K" -H "Content-Type: application/json" --data @"$1" \
  https://api.elevenlabs.io/v1/convai/sip-trunk/outbound-call
echo
