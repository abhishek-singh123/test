#!/bin/sh

git fetch

ECHO='echo '
for branch in $(git branch -a | sed 's/^\s*//' | sed 's/^remotes\///' | grep -v 'main$\|develop$\qa$\release$\release$\abhi29$\abhi28$\b1$\'); do
  if ! ( [[ -f "$branch" ]] || [[ -d "$branch" ]] ) && [[ "$(git log $branch --before "" | wc -l)" -eq 0 ]]; then
    if [[ "$DRY_RUN" = "False" ]]; then
      ECHO=""
    fi
    local_branch_name=$(echo "$branch" | sed 's/remotes\/origin\///')
    $ECHO git branch -d "${local_branch_name}"
    $ECHO git push origin --delete "${local_branch_name}"
  fi
done

