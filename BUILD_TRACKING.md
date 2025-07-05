# Build Tracking

This directory contains files used by the auto-build system to track build history and prevent unnecessary rebuilds.

## Files

- `last_built_commit.txt` - Contains the SHA-1 hash of the last successfully built commit from the Aegisum core repository. This file is automatically updated by the GitHub Actions workflow.

## Format

The `last_built_commit.txt` file should contain only the 40-character SHA-1 commit hash, with no comments or additional text, to ensure proper parsing by the GitHub Actions workflow.

Example:
```
a1b2c3d4e5f6789012345678901234567890abcd
```

## Auto-Update Process

1. The workflow checks the latest commit from the Aegisum core repository
2. Compares it with the commit hash in `last_built_commit.txt`
3. If different (or if file is empty), triggers a new build
4. After successful build, updates `last_built_commit.txt` with the new commit hash