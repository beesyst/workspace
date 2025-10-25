# Conventional Commit Guide

This guide defines the structure, purpose, and examples of using **Conventional Commits**, following the [1.0.0 specification](https://www.conventionalcommits.org/en/v1.0.0/). It helps ensure clear commit history, automated changelog generation, and semantic versioning.

---

## 🔧 Commit Format

```
<type>[optional scope][!]: <short description>

[optional body]

[optional footers]
```

### Required Elements:

* `type`: describes the category of change (e.g., `feat`, `fix`)
* `description`: short summary (max 100 chars)

### Optional Elements:

* `scope`: component or area of the project (e.g., `report`, `ui`, `parser`)
* `!`: indicates a breaking change (MAJOR release)
* `body`: multiline explanation of the change
* `footers`: metadata such as `BREAKING CHANGE`, `Refs`, `Reviewed-by`, etc.

---

## 📊 Commit Types and Version Impact

| Type               | Description                                               | Version Impact  |
| ------------------ | --------------------------------------------------------- | --------------- |
| `feat:`            | New feature                                               | **+MINOR**      |
| `fix:`             | Bug fix                                                   | **+PATCH**      |
| `chore:`           | Maintenance, CI, config, tooling changes                  | no version bump |
| `docs:`            | Documentation only changes                                | no version bump |
| `style:`           | Code style changes (formatting, spacing, no logic change) | no version bump |
| `refactor:`        | Code restructure without behavior change                  | +PATCH or none  |
| `perf:`            | Performance improvements                                  | **+PATCH**      |
| `test:`            | Adding or updating tests                                  | no version bump |
| `build:`           | Build system or dependency changes                        | no version bump |
| `ci:`              | Changes to CI/CD configuration files                      | no version bump |
| `revert:`          | Revert of a previous commit                               | no version bump |
| `BREAKING CHANGE:` | Any breaking change, regardless of type                   | **+MAJOR**      |

---

## ✅ Commit Types and Version Impact

| Type               | Description                                                  | Version Impact |
| ------------------ | ------------------------------------------------------------ | -------------- |
| `feat:`            | New feature                                                  | MINOR (+0.1.0) |
| `fix:`             | Bug fix                                                      | PATCH (+0.0.1) |
| `chore:`           | Maintenance tasks, tooling, CI setup                         | None           |
| `docs:`            | Documentation-only changes                                   | None           |
| `style:`           | Code formatting, whitespace, etc. (no logic change)          | None           |
| `refactor:`        | Code change that neither fixes a bug nor adds a feature      | PATCH or None  |
| `perf:`            | Performance improvements                                     | PATCH (+0.0.1) |
| `test:`            | Adding or updating tests                                     | None           |
| `build:`           | Build system or external dependency changes                  | None           |
| `ci:`              | Changes to CI/CD configuration and scripts                   | None           |
| `revert:`          | Reverting previous commits                                   | None           |
| `BREAKING CHANGE:` | Any change that breaks compatibility (can apply to any type) | MAJOR (+1.0.0) |

---

## ✅ Correct Examples

### Basic commits:

```bash
feat: add export to PDF reports
fix: correct spelling in title
docs: update README with setup instructions
chore: rename internal config file
style: fix code formatting and indentation
test: add unit test for report parser
refactor: simplify plugin loader logic
perf: optimize report generation speed
ci: switch to GitHub Actions v4
build: update Dockerfile to node 18
revert: revert "feat: add nuclei support"
```

### With scope:

```bash
feat(report): add dark theme support
fix(parser): prevent crash on empty input
docs(changelog): add release notes for v1.1.0
style(css): reformat buttons in report
chore(deps): update dependency versions
test(nikto): add missing edge-case tests
ci(release): fix broken release script
```

### Breaking changes using `!`:

```bash
feat!: remove legacy plugin support
fix(report)!: change output format to markdown only
refactor!: migrate to plugin system v2
chore!: drop support for Node.js 14
```

### Breaking changes with `BREAKING CHANGE` footer:

```bash
feat(parser): switch to new YAML format

BREAKING CHANGE: config files must now use .yaml extension
```

### With multi-line body and footers:

```bash
fix(report): prevent layout break in dark theme

Added logic to recalculate widths and apply CSS grid.

BREAKING CHANGE: legacy CSS class "light-layout" was removed
Reviewed-by: @alice
Refs: #123, #456
```

---

## ❌ Invalid Examples

| Commit message             | Reason                  |
| -------------------------- | ----------------------- |
| `Fix: update layout`       | Type must be lowercase  |
| `feat:`                    | Missing description     |
| `foo: update app`          | Unsupported type        |
| `feat(Report): add header` | Scope must be lowercase |
| `feat: `                   | Empty description       |

---

## ℹ️ Why use `fix(scope):` instead of just `fix:`?

Adding a scope improves clarity and traceability, especially in large modular projects. Example scopes:

* `fix(report):` — related to report logic
* `fix(ui):` — user interface issue
* `fix(db):` — database layer bug

Scopes are optional, but highly recommended.

---

## ⚠️ Why use `!` in `feat!:`?

Adding `!` marks a breaking change — it visually alerts that the change will trigger a MAJOR version bump.
You may also use `BREAKING CHANGE:` footer instead.

Both are valid:

```bash
feat!: remove legacy support
```

```bash
feat(config): refactor parser

BREAKING CHANGE: parser config is now required
```

---

## 💡 Use Cases for Conventional Commits

* Automate `CHANGELOG.md` generation
* Trigger semantic version bumps (PATCH, MINOR, MAJOR)
* Communicate intent clearly across team and users
* Enable CI/CD workflows (e.g., release-please, semantic-release)
* Improve onboarding for contributors with consistent commit style

---

## 🧪 How to enable commit conventions in your project

1. Open a terminal in the folder where your `workspace/` repository is located:

```bash
cd /path/to/workspace/
pwd   # Copy the output path
```

**Example output:** `/home/bee/Projects/workspace/`

2. Go to the root directory of your target project and run the `commits.sh` script using the full path:

```bash
bash /full/path/to/workspace/tools/commits.sh
```

**Example input:** `bash ~/Projects/workspace/tools/commits.sh`

This will:

* Copy `.commitlintrc.json`, `.husky/`, and `package.json` from your workspace
* Install required dev dependencies (`commitlint`, `husky`)
* Activate the Git hook for commit message checking

Once done, any `git commit` will be automatically validated.

Try it:

```bash
git commit -m "chore: enable commit validation hooks"
```

---

## 📂 What to include in .gitignore

Your `.gitignore` should contain:

```gitignore
node_modules/
```

Do **not** ignore:

* `.commitlintrc.json`
* `.husky/`
* `package.json`
* `package-lock.json`

These are needed for reproducible commit checking in any clone of the repo.

---

## 📂 Files involved

* `.commitlintrc.json` — defines rules for validating commit messages
* `.husky/commit-msg` — Git hook that triggers commit validation
* `package.json` — contains devDependencies (commitlint, husky) and setup scripts
* `package-lock.json` — locks exact versions of Node.js dependencies for reproducibility

---

## 📝 Tip

If you make a mistake, use `git commit --amend` or `git rebase -i` before pushing to fix the message.

---

Happy committing! 🚀
