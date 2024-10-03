#!/bin/bash

# Test setup: Create a temporary Git repository
TEST_DIR=$(mktemp -d)
cd $TEST_DIR || exit 1
git init

# Create the current branch where commits will be cherry-picked to
git checkout -b target-branch

# Create a source branch where commits will be cherry-picked from
git checkout -b source-branch

# Create some commits with different prefixes
echo "Commit 1: Adding a test file" > file1.txt
git add file1.txt
git commit -m "feat: OG-111 Initial commit with ticket"

echo "Commit 2: Modifying a test file" > file2.txt
git add file2.txt
git commit -m "feat: OG-222 Second commit with another ticket"

echo "Commit 3: Another change for testing" > file3.txt
git add file3.txt
git commit -m "feat: OG-111 Another commit with the same ticket"

# Checkout to the target branch for cherry-picking
git checkout target-branch

# Run the git cherrycrop command to cherry-pick commits with prefix "feat: OG-111" from the source branch
../git-cherrycrop -b source-branch -p "feat: OG-111"

# Check if the correct commits were cherry-picked
echo "Verifying cherry-picked commits..."
if git log --oneline | grep "feat: OG-111"; then
    echo "Test Passed: Correct commits were cherry-picked"
else
    echo "Test Failed: Cherry-pick did not work as expected"
fi

# Clean up the temporary test directory
cd ..
rm -rf $TEST_DIR
