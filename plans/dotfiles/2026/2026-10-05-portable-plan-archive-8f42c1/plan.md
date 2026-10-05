# Portable plan archive for npw

- Project: dotfiles
- Repository: https://github.com/kelvinfann/dotfiles.git
- Created: 2026-10-05T03:03:45Z
- Updated: 2026-10-05T03:20:48Z
- Status: pr-open
- Base branch: master
- Work branch: kelvinfann/npw-project-work
- Implementation PR: https://github.com/kelvinfann/dotfiles/pull/1
- Archive PR: https://github.com/kelvinfann/dotfiles/pull/1

## Objective and acceptance criteria

Persist plans and continuation notes in dotfiles so Kelvin can resume with either Codex or Claude. npw locates a verified home or temporary checkout, saves plans before approval, maintains progress, and publishes records through PRs.

## Scope and repository guidance

Extend the existing Markdown npw skill. Retain plan approval, isolated dependencies, terse comments, repository conventions, DRY ownership, and kelvinfann/ branch/PR-title prefixes. Keep the installed skill's existing checkout and symlinks; do not relocate it or change unrelated setup/configuration.

## Plan

1. Define checkout discovery: reuse the installed skill's checkout or existing verified dotfiles repository; otherwise ask Kelvin to select ~/dotfiles, /tmp/kelvinfann-dotfiles, or a custom path before cloning.
2. Organize records under plans/<project>/<year>/<date>-<task>-<unique-id>/ with plan.md and progress.md.
3. Add archive instructions and a reusable template, including resumability, status, approval history, scoped Git commits, and PR cross-links.
4. Make plan writing an explicit pre-approval exception; preserve the approval gate for implementation and publication.
5. Validate skill metadata, Markdown references, the plan layout, and diff whitespace. Commit/push this update and revise PR #1.

## Verification

Run the bundled skill validator with dependencies in a disposable virtual environment, validate local Markdown links and record metadata, and run git diff --check. Review instructions for plan-only delivery and cross-project publication. No end-to-end client execution is claimed.

## Delivery

Use the existing kelvinfann/npw-project-work branch and PR #1 for both the skill changes and this plan. Checkpoint final results, push, and update the PR description.

## Open decisions

None.

## Approval and revisions

- Earlier approval (exact UTC timestamp not captured): Kelvin authorized implementation and subsequent PR update with "update the PR after" in response to the proposed archive plan.
- Earlier clarification (exact UTC timestamp not captured): Kelvin clarified "this skill is just for me, so don't worry about other owner". Use project-only directories; retain remote identity as metadata and disambiguate only actual naming collisions.

- 2026-10-05T03:20:48Z: Kelvin requested addressing PR review comments: use UTC exclusively and ask for a destination before cloning a missing archive checkout. Updated instructions and template accordingly.
- 2026-10-05T03:20:48Z: Migrated this previously unmerged record directory to the UTC date of its first archive commit. Created metadata uses that commit timestamp; earlier approval times are explicitly unknown.
