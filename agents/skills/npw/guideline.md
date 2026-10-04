# Coding guidelines

Apply these throughout work started with npw. Explicit user direction takes precedence. Follow applicable repository instructions; surface material conflicts before choosing an approach.

## Isolate dependencies

Strongly prefer project-local or disposable environments. Reuse the repository's dependency manager and lockfile. Avoid global package installs, system Python changes, global runtime upgrades, and system package-manager changes just to run project code. If a system change is genuinely necessary, explain why isolation is insufficient and obtain explicit authorization for that change.

For Python, follow the existing virtual environment workflow. Prefer uv when none is established, or use `python3 -m venv .venv`. Install through that environment's interpreter or uv's virtual-environment interface. Never use `sudo pip`, `pip --user`, or `uv pip --system` for project dependencies. For a maintained uv lockfile, use `uv sync --locked` and `uv run --locked`. Do not migrate an existing project to uv merely to run it.

For other languages, use repository-local dependencies and the existing build system, or an isolated container. Respect lockfiles and avoid incidental upgrades. Treat installs, uv run/sync, builds, and tests as potentially mutating operations; the npw approval gate applies.

Official uv references: [projects](https://docs.astral.sh/uv/guides/projects/) and [environments](https://docs.astral.sh/uv/pip/environments/).

## Terse comments

Let code explain ordinary mechanics. Add short comments only for non-obvious intent, invariants, gotchas, compatibility constraints, or surprising tradeoffs. Do not narrate code line by line. Preserve required API documentation and useful existing comments; update comments made inaccurate by the change.

## Repository patterns first

Match nearby implementations, naming, structure, error handling, tests, and tooling before applying general style preferences. Reuse established helpers and dependencies. Avoid unrelated reformatting, framework changes, and cleanup. Explain concrete reasons for departing from local patterns, and include material departures in the plan.

## DRY and clear ownership

Identify the existing source of truth for behavior, state, configuration, and business rules before adding another representation. Reuse or extend the owning component instead of copying its logic into callers. Keep responsibility and dependency direction explicit. Derive values from their owner instead of maintaining parallel writable state.

Avoid duplicated rules and divergent implementations. Tie abstractions to actual shared behavior; do not force unrelated concepts into a generic helper because their syntax resembles each other. Make necessary caches or derived state explicit about their authority and update/invalidation rules.
