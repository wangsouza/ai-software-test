#!/bin/bash

set -e

BRANCH=$(git branch --show-current)

ISSUE_ID=$(echo "$BRANCH" | sed -E 's#^[a-zA-Z]+/([0-9]+)-.*$#\1#')

ISSUE_TITLE=$(gh issue view "$ISSUE_ID" --json title --jq '.title')

PR_TITLE=$(echo "$ISSUE_TITLE" \
 | sed -E 's/\[(STORY|EPIC|DOCS|TECH|BUG)\]//g')

BODY_FILE=$(mktemp)

cat > "$BODY_FILE" <<EOF
## O que foi feito

Implementação relacionada à Issue #$ISSUE_ID.

## Issue relacionada

Closes #$ISSUE_ID
EOF

git push -u origin "$BRANCH"

gh pr create \
 --base main \
 --head "$BRANCH" \
 --title "$PR_TITLE" \
 --body-file "$BODY_FILE"

rm "$BODY_FILE"