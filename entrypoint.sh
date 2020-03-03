#!/bin/bash

github_event_before=$(jq -r '.before' $GITHUB_EVENT_PATH)
github_event_after=$(jq -r '.after' $GITHUB_EVENT_PATH)

changed_files=$(git diff-tree --no-commit-id --name-only --no-merges --diff-filter=d -r "$github_event_before" "$github_event_after")
echo "Added or changed files: $changed_files"
echo ""

exit_status=0

for fileName in $changed_files
  do
    (fortellis-cli api-lint $fileName --safe) && status=$? || status=$?
    if [[ "$status" == 0 ]]; then
      echo "Spec $fileName is valid"
    elif [[ "$status" == 103 ]]; then
      echo "Skipping $fileName not added in Fortellis repo"
    elif [[ "$status" == 110 ]]; then
      echo "Spec $fileName is invalid"
      exit_status=1
    else
      echo "An error has occured while attempting to lint $filename"
      exit_status=1
    fi;
    echo "";
done

exit $exit_status
