# Changelog Integration Guide

This guide explains how the `CHANGELOG.md` template (based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)) integrates with your overall development process, including commit conventions, Kanban workflows, milestones, and GitHub releases.

---

## 🧩 How CHANGELOG.md Fits In

### Commit Conventions (Conventional Commits)

Conventional commits (e.g., `feat:`, `fix:`, `chore:`) are used to describe code changes in a consistent way.

* Tools like `release-please` use these commit types to determine what to put in `CHANGELOG.md`
* Example:

  * `feat: add user login` → `Added` section
  * `fix: resolve memory leak` → `Fixed` section
  * `BREAKING CHANGE:` footer → Triggers a `MAJOR` version and highlights in changelog

This ensures that commits automatically generate a meaningful changelog with version bumps.

### Kanban Tasks (Projects)

In your GitHub Kanban board (e.g., `Ideas`, `Todo`, `In Progress`, `Done`):

* Each card should represent an issue or feature.
* When moved to `Done`, its status confirms the task is complete.
* At release time, scan completed tasks and ensure relevant entries appear in `CHANGELOG.md`.
* Example:

  * A `Done` card titled “PDF export” would correspond to:

```markdown
### Added
- Added export to PDF functionality.
```

### Milestones

Milestones help group issues and PRs under a planned version release (e.g., `v1.1.0`).

* All issues/PRs under a milestone should have matching changelog entries.
* When milestone is closed, it's a signal to create a release section in `CHANGELOG.md`.

> Tip: Milestones define *what* is being released; the changelog documents *how* and *why*.

### GitHub Releases with release-please

The tool `release-please` automates the process:

1. It reads your commits (in Conventional Commit format)
2. It determines the version bump (PATCH, MINOR, MAJOR)
3. It updates `CHANGELOG.md` and `version.txt`
4. It creates a Pull Request with the changelog and version bump
5. When you merge the PR, GitHub automatically tags and publishes the release

> Bonus: You can continue tracking work in `Unreleased` section before merging a release PR.

---

## 🧠 Best Practices

* Keep an `Unreleased` section always at the top.
* Group changes by type: `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`
* Be clear and concise – changelogs are for humans.
* Don’t just list file names or commit hashes.
* Always keep `CHANGELOG.md` in sync with releases and milestones.

---

## ✅ Summary

| Tool/Element         | Purpose                        | Sync with Changelog       |
| -------------------- | ------------------------------ | ------------------------- |
| Conventional Commits | Standardize commit messages    | 🔄 Auto-mapped to entries |
| Kanban (Projects)    | Track tasks visually           | ✅ Manual summary          |
| Milestones           | Group work by release goal     | ✅ Maps to version         |
| release-please       | Automate changelog and tagging | ✅ Fully integrated        |

---

## 🛠 How to initialize changelog in a project

1. Open a terminal in the folder where your `workspace/` repository is located:

```bash
cd /path/to/workspace/
pwd   # Copy the output path
```

**Example output:** `/home/bee/Projects/workspace/`

2. Go to the root directory of your target project and run the `changelog.sh` script using the full path:

```bash
bash /full/path/to/workspace/tools/changelog.sh
```

**Example input:** `bash ~/Projects/workspace/tools/changelog.sh`

This will:

* Copy `CHANGELOG.md`, `version.txt`, and `.github/workflows/release-please.yml`
* Prepare your project for automated changelog generation

---

## 📂 What to include in .gitignore

Do **not** ignore:

* `CHANGELOG.md`
* `version.txt`
* `release-please.yml`

---

## 📂 Files involved

* `CHANGELOG.md` → Tracks user-facing changes
* `version.txt` → Source of truth for current version
* `.github/workflows/release-please.yml` → CI automation for release flow

---

By following this workflow, your changelog will remain clean, useful, and fully automated, without sacrificing human readability.
