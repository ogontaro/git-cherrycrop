
# git cherrycrop

`git cherrycrop` is a custom Git subcommand that allows you to cherry-pick commits based on specific prefixes, such as ticket numbers. This tool helps streamline the process of extracting relevant commits and applying them to different branches.

## Installation

To use `git cherrycrop`, you need to follow these steps:

1. Copy the `git-cherrycrop` script into your local system's PATH, such as `/usr/local/bin`.

```bash
sudo cp git-cherrycrop /usr/local/bin/git-cherrycrop
sudo chmod +x /usr/local/bin/git-cherrycrop
```

2. Ensure the script is executable by running:

```bash
chmod +x /usr/local/bin/git-cherrycrop
```

## Usage

The basic command format for `git cherrycrop` is as follows:

```bash
git cherrycrop -b <branch> -p <prefix>
```

### Options:

- `-b <branch>`: The branch where the commits will be cherry-picked to.
- `-p <prefix>`: The prefix to filter commits by (e.g., ticket numbers or specific keywords in commit messages).

### Example:

If you want to cherry-pick all commits with the prefix `TICKET-1234` into a branch named `feature/branch`, you would run the following command:

```bash
git cherrycrop -b feature/branch -p TICKET-1234
```

This will:
1. Switch to the specified branch (`feature/branch`).
2. Find all commits that have `TICKET-1234` in their commit messages.
3. Cherry-pick those commits into the current branch.

### Error Handling:

- If there are any conflicts during cherry-pick, the script will stop, and you will be prompted to resolve the conflicts manually.
- Once the conflicts are resolved, you can continue the cherry-pick process by running:

```bash
git cherry-pick --continue
```

If you want to abort the cherry-pick after a conflict, use:

```bash
git cherry-pick --abort
```

## How It Works

1. The script searches for commits using the `git log --grep="<prefix>"` command, which looks for commit messages that contain the specified prefix.
2. The commit hashes are collected, and `git cherry-pick` is applied to each commit individually.

## Why Use `git cherrycrop`?

- **Efficiency**: Easily cherry-pick multiple commits based on specific keywords without manually searching through the commit history.
- **Flexibility**: Perfect for teams that organize their commits by ticket numbers or other unique identifiers in commit messages.
- **Error Management**: Handles errors like conflicts gracefully, allowing developers to resolve them before continuing the process.

## License

This project is licensed under the MIT License.
