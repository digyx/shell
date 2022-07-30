#!/usr/bin/env bash
TYPE=$(gum choose "fix" "feat" "docs" "ci" "style" "refactor" "test" "chore" "revert")
SCOPE=$(gum input --placeholder "scope")

test -n "$SCOPE" && SCOPE="($SCOPE)"

TO_COMMIT=$(gum choose --no-limit $(git ls-files --modified --others --exclude-standard))

SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Commit Summary")
DESCRIPTION=$(gum write --placeholder "Details of this change...")

gum confirm "Commit?"

if [[ "$?" -eq 0 ]]; then
    git add $TO_COMMIT;
    git commit -m "$SUMMARY" -m "$DESCRIPTION";
fi
