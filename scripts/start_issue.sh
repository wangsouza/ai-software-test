#!/bin/bash

set -e

echo "Issues abertas:"
echo

gh issue list \
 --state open \
 --json number,title \
 --jq '.[] | "\(.number) - \(.title)"'

echo
read -p "Digite o número da Issue: " ISSUE_ID

TITLE=$(gh issue view "$ISSUE_ID" --json title --jq '.title')

SLUG=$(echo "$TITLE" \
 | sed -E 's/\[(STORY|EPIC|DOCS|TECH|BUG)\]//g' \
 | tr '[:upper:]' '[:lower:]' \
 | sed -E 's/[^a-z0-9]+/-/g' \
 | sed -E 's/^-|-$//g')

TYPE="feature"

if [[ "$TITLE" == *"[DOCS]"* ]]; then
 TYPE="docs"
elif [[ "$TITLE" == *"[BUG]"* ]]; then
 TYPE="fix"
fi

BRANCH="${TYPE}/${ISSUE_ID}-${SLUG}"

git checkout main
git pull
git checkout -b "$BRANCH"