---
name: npw
description: Start coding work on a project with repository instruction discovery and an approved plan. Use when the user says npw, new-project-work, or explicitly asks for this project-start workflow.
---

# New project work

Invocation: `npw <project-folder> [task]`. Paths with spaces may be quoted. Also accept `$npw` in Codex and `/npw` in Claude Code. The first argument identifies the project; the remaining text describes the task. Missing task text is not permission to invent work.

## Orient

1. Resolve the folder. If missing or ambiguous, ask which project. For a repository name or URL, use an unambiguous existing checkout; otherwise ask for its local location or authorization to clone. Do not initialize Git or clone before plan approval unless explicitly authorized.
2. Inspect the Git root, branch, working-tree status, remotes, and repository PR guidance when applicable. Preserve existing changes. Identify the intended base branch and available hosting authentication. Non-Git folders are valid targets too; surface the missing PR destination as a planning decision.
3. Discover and read applicable instructions in the target folder, applicable ancestors, and repository root: `AGENTS.md`, `AGENTS.override.md`, `CLAUDE.md`, `CLAUDE.local.md`, `.claude/CLAUDE.md`, and client-configured names. Search case variants such as `agent.md`, `agents.md`, and `claude.md`. Follow relevant referenced instruction files. Respect the client's scope and precedence rules; discovery does not make instructions global.
4. Locate nested instruction files, excluding dependencies, generated outputs, and Git internals. Read those governing relevant code. Before entering another subtree later, read its applicable instructions. Avoid loading unrelated modules' guidance.
5. Read [guideline.md](guideline.md) and [plan-archive.md](plan-archive.md). Locate the dotfiles archive, check this project for unfinished plans, and offer to resume a relevant plan instead of duplicating it. Read only the selected plan and its progress notes. Inspect relevant README/contribution guidance, manifests, build/test commands, and representative code. Keep inspection proportional to the task.
6. If the task was omitted, ask what the user wants done after initial orientation. If present, clarify only requirements that materially affect the plan. Do not implement while waiting.

## Agree on the plan

Read-only inspection may proceed to make the plan concrete. Establishing the verified dotfiles archive checkout and writing plan/progress records there are explicit exceptions, authorized by this workflow; they do not authorize project implementation. Before approval, do not edit project files, install dependencies, change configuration, or run builds/tests/scripts that write files or have external side effects. Include needed mutating investigations in the plan or obtain specific authorization for them.

Present the intended behavior, affected components, implementation steps, verification, PR delivery, and material open decisions. Scale detail to the task, but always propose a plan, even for small changes. Explain repository patterns and ownership when relevant.

Save the proposed plan using [plan-template.md](plan-template.md) in the archive, share its location and summarize it, then ask the user to approve or revise the plan and stop and wait. This gate is explicitly required by this skill and the user's requested workflow; link this SKILL.md when explaining why approval is needed. Questions, revisions, silence, and elapsed time are not approval. Incorporate revisions and obtain approval of the resulting plan. Ordinary language such as "approved" or "go ahead" counts when it clearly refers to the current plan.

## Execute the approved work

Record approval and implement the agreed plan using project instructions and guideline.md. Maintain plan status and concise progress notes at meaningful checkpoints according to plan-archive.md. Do not ask again for routine choices within the approved plan. If the objective, public behavior, architecture, dependency strategy, or scope materially changes, revise the plan and wait for approval of that change. Plan approval does not override client permissions or authorize unrelated external actions.

## Deliver a pull request

The default completion goal for coding changes is a pull request, not local edits alone. Include branch, commit, push, and PR creation in the proposed plan. Once that plan is approved, carry those steps through without another routine approval question unless the user restricts delivery or client permissions require it.

For Kelvin's work, prefix task branch names and PR titles with `kelvinfann/`. For example, use branch `kelvinfann/npw-project-work` and title `kelvinfann/Add shared npw project workflow`. Keep the repository's PR template and other conventions while applying this naming preference. Reuse the task's existing branch/PR when appropriate; otherwise create a branch from the agreed base without discarding existing work. Stage only task-related changes, commit them, push the branch, and create or update the PR. Never force-push or merge merely to satisfy this delivery goal.

Review the final diff and run the planned checks before delivery. Commit and publish the task's plan/progress records in dotfiles, following plan-archive.md; link the archive PR and implementation PR in the records and PR descriptions. Use one PR when the coding project is dotfiles. Describe the actual change and validation in the PR; if checks are blocked or fail, disclose that and use a draft when appropriate rather than imply readiness. Attach the PR to the current chat when the client supports it.

Finish with the PR link, outcome, verification actually performed, and remaining limitations. Report checks as passed only when they ran successfully. If authentication, hosting access, or a missing repository prevents PR creation, complete the authorized local work, report what remains unpublished, and request the specific missing access. Do not claim completion or substitute a comparison URL for a created PR. Explicit requests for planning or investigation alone do not require an empty PR.
