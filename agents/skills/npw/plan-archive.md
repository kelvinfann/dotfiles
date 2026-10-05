# Kelvin's portable plan archive

Read this when npw starts, and maintain its records throughout the task. The archive is Kelvin's dotfiles Git repository, not client session storage. Markdown records are the shared source of truth across agents; no Codex or Claude chat ID is required.

## Locate the checkout

Use `git@github.com:kelvinfann/dotfiles.git` (or its HTTPS equivalent). Validate a candidate's Git remote before using it; do not assume a folder named dotfiles is the right repository.

1. Reuse the checkout containing this installed skill if its remote matches. Otherwise check a user-provided checkout, `~/dotfiles`, the existing `~/Project/dotfiles`, and `/tmp/kelvinfann-dotfiles`.
2. If none exists, clone into `~/dotfiles` for persistent local work, or `/tmp/kelvinfann-dotfiles` for a temporary environment where home is unsuitable. Try HTTPS if SSH authentication is unavailable. Do not overwrite an occupied destination, alter unrelated remotes, or move a working checkout just to match the preferred path.
3. Check status before changing branches. Never discard unrelated changes. Inspect relevant remote archive branches/PRs when looking for prior work, without overwriting local files; an unmerged plan may live on a task branch rather than the default branch. Use an isolated Git worktree if necessary to avoid another task's checkout.

If archive access is blocked, report the specific missing access and request it. Keep a provisional plan in an allowed scratch directory, clearly marked unpublished, if useful; do not call it archived or begin implementation without the required approval. Preserve provisional records until they have been saved in dotfiles.

## Directory convention

```text
plans/<project>/<year>/<YYYY-MM-DD>-<task-slug>-<unique-id>/
  plan.md
  progress.md
```

For example: `plans/dotfiles/2026/2026-10-04-portable-plan-archive-a1b2c3/`.

Use the repository basename as the project slug, lowercase with non-alphanumeric runs replaced by hyphens. Store the credential-free remote URL in plan.md to identify the repository across machines. For non-Git folders, use the folder basename and record that it is a local project. If two different projects collide, use a short stable disambiguator and retain the existing directory mapping; do not add owner directories by default.

Use Kelvin's date/time in America/Los_Angeles. Choose a short task slug and a random six-or-more-character suffix; check that the directory does not exist before creating it. Keep its path fixed when status changes. Create only directories needed for actual plans; no central mutable index or numbered duplicate revisions. Git history records revisions.

## Plan and continuation records

Create plan.md from [plan-template.md](plan-template.md), replacing template fields and removing irrelevant sections. Create progress.md with a short current checkpoint and next step. Save every substantive plan and revision, including planning-only tasks, rejected plans, and cancelled work. Do not fabricate approval for prior work.

Statuses: `draft`, `approved`, `in-progress`, `blocked`, `pr-open`, `completed`, `cancelled`. A delivery task reaches `pr-open` when its PR exists; use `completed` when the agreed outcome is met, and do not imply that a PR was merged unless verified. Record the user's approval wording or an accurate description with its date. Material scope revisions require renewed approval; preserve the earlier approval context and explain what changed.

In progress.md keep completed steps, decisions affecting continuation, checks actually run and their results, blockers, and the next concrete action. Update after meaningful milestones, changed scope, blocking failures, and before handing off. Keep notes concise; avoid per-turn transcripts, duplicate full plans, machine-specific session IDs, or private source dumps. Do not publish secrets or confidential material into a repository that is not appropriate for them; use a sanitized summary and flag any missing context.

On resume, read plan.md and progress.md, verify branch/PR state and relevant workspace changes, and confirm the remaining objective when ambiguous. An existing approval applies only to its recorded scope. Conflicting simultaneous edits require reconciliation rather than blindly replacing a record.

## Commit and PR delivery

Saving draft records before approval is allowed; committing/pushing/opening PRs follows plan approval unless separately authorized. Every plan must ultimately be committed and published in dotfiles, even for a planning-only task; obtain specific publication authorization when implementation was not approved. Include archive delivery in each proposed plan.

For work on dotfiles itself, keep the plan and implementation in the same task branch/PR. For another project, use a separate dotfiles branch such as `kelvinfann/plan-<project>-<task>-<unique-id>` and PR title starting with `kelvinfann/`. Reuse that archive PR as progress changes. Keep commits scoped to the task's records. Link both PRs in plan.md and cross-reference their descriptions. Never force-push, automatically merge, or change another task's branch to publish records.

Once approved, checkpoint plan revisions and meaningful progress in scoped commits. Push at handoff, when blocked, and at PR delivery; keep the archive PR up to date. If push/authentication fails, report which records remain local and what access is needed. Do not delete a temporary checkout or provisional records until publication is confirmed. Local commits alone do not make the archive available on another machine.
