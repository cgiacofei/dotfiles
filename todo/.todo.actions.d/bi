#!/bin/zsh

action=$1

[ "$action" = "usage" ] && {
  echo "  Bird's eye report:"
  echo "    bi"
  echo "      generates a textual report of pending and completed tasks in all projects and contexts"
  echo ""
  exit
}

python ${TODO_ACTIONS_DIR}/birdseye.py "$TODO_FILE" "$DONE_FILE" "$COLOR_PROJECT" "$COLOR_CONTEXT"
# python ${TODO_ACTIONS_DIR}/birdseye.py "$TODO_FILE" "$DONE_FILE"
