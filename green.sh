#!/bin/bash

START_DATE="2025-01-01"
END_DATE="2025-01-31"

CURRENT_DATE="$START_DATE"

while [ "$CURRENT_DATE" != "$END_DATE" ]; do
  echo "Commit on $CURRENT_DATE" >> activity.txt
  git add activity.txt

  GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" \
  GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" \
  git commit -m "Commit on $CURRENT_DATE"

  CURRENT_DATE=$(date -j -f "%Y-%m-%d" "$CURRENT_DATE" -v+1d +"%Y-%m-%d")
done
