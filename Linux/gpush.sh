#!/bin/bash

# --- Colors for that "Flamboyant" Terminal feel ---
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. Check if a commit message was provided
if [[ -z "$1" ]];
then
    echo -e "${RED}Error: Yo, you forgot the commit message!${NC}"
    echo -e "${CYAN}Usage: ./gpush.sh \"your message here\"${NC}"
    exit 1
fi

# 2. The Git Workflow
echo -e "${YELLOW}Staging all changes...${NC}"
git add .

echo -e "${YELLOW}Committing with message: \"$1\"${NC}"
git commit -m "$1"

echo -e "${YELLOW}Pushing to remote...${NC}"
# Capture the output and check if it actually went to GitHub
# Redirect errors (2>&1) so the script can "read" the warnings too
PUSH_OUTPUT=$(git push 2>&1)
echo "$PUSH_OUTPUT" 

if echo "$PUSH_OUTPUT" | grep -qE "To github.com|Everything up-to-date|main -> main"; then
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  Successful!    ${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
else
    echo -e "${RED}Push failed. Check your connection or merge conflicts.${NC}"
fi