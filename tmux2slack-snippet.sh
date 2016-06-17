#!/bin/sh
set -eu

token=$(cat ~/etc/slack-api-token.txt)
filename='tmux-buffer.txt'

channels="$1"

title="$LOGNAME@$(uname -n)"
content=$(tmux show-buffer 2> /dev/null)

curl --data-urlencode token="${token}" \
     --data-urlencode filename="${filename}" \
     --data-urlencode filetype="shell" \
     --data-urlencode channels="${channels}" \
     --data-urlencode title="${title}" \
     --data-urlencode content="${content}" \
     https://slack.com/api/files.upload \
     > /dev/null 2>&1
