# Shared monorepo foundation and project landing page

- Project: monorepo
- Repository: https://github.com/kelvinfann/monorepo.git
- Created: 2026-10-05T03:51:41Z
- Updated: 2026-10-05T05:47:36Z
- Status: pr-open
- Base branch: main
- Work branch: kelvinfann/monorepo-foundation
- Implementation PR: https://github.com/kelvinfann/monorepo/pull/1
- Archive PR: https://github.com/kelvinfann/dotfiles/pull/2

## Objective and acceptance criteria

Establish Kelvin's intentionally coupled personal monorepo and a simple local project landing page. Use TypeScript frontend projects in projects/js and typed Python 3 backend projects in projects/py. Dependencies and internal interfaces evolve together in the same commit/PR. The homepage uses a responsive grid of project cards; Wine Club Inventory is the first project and links to its local destination. Identify that destination honestly as upcoming, with a link to https://thewineclub.com/ and navigation home. Serve built frontend and API from one loopback address.

This delivery covers shared tooling, instruction/architecture documentation, the landing page, and a navigable wine destination. It does not implement wine scraping, CSV inventory storage, refresh APIs, or cron scheduling. Kelvin explicitly narrowed the current work to the landing page. Future wine work is an inventory/availability checker for The Wine Club; earlier assumptions about personally owned wine holdings are superseded for that first project.

## Approved architecture and guidelines

- Repository-root uv workspace registers projects/py/*, owns uv.lock, common Python tooling, and one isolated .venv. Members declare actual dependencies; resolution is shared.
- Repository-root pnpm workspace registers projects/js/*, owns pnpm-lock.yaml, and defines common JS dependency versions in a catalog. Internal JS dependencies use workspace references. Shared locks do not imply all JS transitive versions are identical.
- React/TypeScript/Vite frontend; FastAPI and Pydantic backend; strict Python and TypeScript type checking. Node is used for development/build; FastAPI serves built local assets in normal use. Development Vite proxies API requests.
- Python models own API contracts; OpenAPI generates TypeScript definitions, consumed through a typed client. Check reproducible generation for drift. Backend services own durable state/business rules; frontend owns rendering/interaction. Future HTTP endpoints and cron CLI call the same service layer.
- Root AGENTS.md is the common coding policy, CLAUDE.md imports it, and nested projects/js/AGENTS.md and projects/py/AGENTS.md contain language-specific commands/guidance. docs/architecture.md owns the design context and deferred feature boundaries. Component READMEs own setup/run/verification commands; root README is a linked component index.
- Keep dependencies repository-local or disposable; no system Python modifications, global package installs, sudo pip, pip --user, or uv pip --system. Use terse comments, existing repo conventions, DRY ownership, and abstractions only for actual shared behavior.
- Plans/progress live in Kelvin's dotfiles archive using UTC timestamps. Implementation and archive branches/PR titles use kelvinfann/. Never force-push or automatically merge.

## Plan

1. Record approval and narrowed scope; establish task branches without disturbing existing work.
2. Write common and language-specific agent instructions, architecture context, and setup documentation.
3. Create root uv/pnpm workspaces and locks, Python package/CLI with health endpoint and deterministic OpenAPI export, and a typed frontend contract.
4. Build the responsive project-card homepage and wine destination. Local routes must navigate correctly, unknown API routes must remain API errors, and unbuilt frontend should return an actionable response.
5. Validate shared resolution, lint/format/type checks, generated contract consistency, frontend build, meaningful backend route isolation/static-serving checks, and local browser navigation at desktop/mobile sizes.
6. Review diff, publish monorepo implementation PR and dotfiles archive PR, cross-link and attach both.

## Verification

Completed checks: uv lock/check and locked sync; pnpm frozen install; Python lint/format/type/tests; frontend strict types/build/format; deterministic schema/types regeneration; API/static routing and browser navigation. All listed checks passed. Three backend tests passed; browser navigation home → wine → home and mobile DOM layout at 390px passed without horizontal overflow. All runtime dependencies remain isolated. No live provider scraper is part of this stage.

## Future wine scope

The Wine Club inventory checker should expose observed retail prices/availability with source URLs and UTC timestamps, without pretending to know Kelvin's personal bottle holdings. Its public site currently distinguishes in-stock, in-transit and pre-arrival availability, including quantities such as 12+; preserve those meanings rather than converting them to fabricated exact counts. CSV storage, providers, service orchestration, refresh HTTP/CLI interfaces, and cron examples belong to a subsequent approved plan. Remaining decisions include watched products versus catalog search and refresh frequency.

## Sources

- https://thewineclub.com/
- https://docs.astral.sh/uv/concepts/projects/workspaces/
- https://pnpm.io/catalogs
- https://openapi-ts.dev/introduction
- https://openapi-ts.dev/openapi-fetch/
- https://vite.dev/guide/

## Delivery

Monorepo implementation PR and dotfiles plan/progress PR, both with kelvinfann/ prefixes and cross-links. Push scoped commits; do not merge.

## Approval and revisions

2026-10-05T04:00:42Z: Kelvin chose coupled dependencies, TypeScript frontend, typed Python 3 backend, and projects/js plus projects/py. This replaced the initial independent-project proposal.

Recorded 2026-10-05T04:17:02Z: Kelvin said "lets do it then. Make sure to add this context and guidelines to the correct md files" in response to the proposed shared tooling. This approves establishing the shared architecture and instructions.

Recorded 2026-10-05T04:17:02Z: Kelvin then explicitly narrowed the current implementation: "lets just focus on a simple home landing page first which will direct you to the sub projects" with Wine Club inventory checker first and https://thewineclub.com/ as its source. This authorizes the landing-page stage and documents the future wine project. No fresh approval gate is needed for this directly requested revision.

## Delivery checkpoint

2026-10-05T04:35:04Z: Implemented the approved landing-page stage and instruction/workspace setup in monorepo commit f1a4540. Implementation PR #1 and dotfiles archive PR #2 are open and cross-linked. The future Wine Club checker remains a documented follow-up. Browser preference: browser-scoped DOM/navigation checks, screenshots only when Kelvin asks; this is persisted in root AGENTS.md.

2026-10-05T05:24:24Z: Kelvin explicitly requested moving component run instructions out of the general README and into each project. Routine documentation revision within the delivered foundation: add frontend/backend READMEs, keep root as index, and record documentation ownership in AGENTS.md and architecture.md. Existing PRs will be updated.

2026-10-05T05:28:03Z: Kelvin requested standardized per-project Makefiles where make serve starts required services. Approved follow-up: backend make serve installs locked dependencies, builds UI and serves one local site; frontend make serve starts API and Vite with coordinated cleanup. Add shared install/build/check targets, frontend API generation, documented port overrides and a browser-free process lifecycle smoke check.

2026-10-05T05:42:34Z: Follow-up delivered in dd4033a. Component run instructions and make serve standard are documented and persisted in agent guidance. Both make check targets, README link/format checks, custom-port startup/HTTP/proxy checks, interrupt cleanup and worker-failure cleanup passed. Existing implementation/archive PRs are updated.

2026-10-05T05:45:13Z: Kelvin requested a monorepo-level Makefile to start each component. Approved routine follow-up: root make serve starts API/Vite by delegating to frontend make serve; serve-backend delegates the compiled site; install/build/check/api dispatch to component owners. Document root targets and override names; verify startup, delegation and cleanup without interrupting the existing preview. Existing PRs will be updated.

2026-10-05T05:47:36Z: Root Makefile delivered in f24e15a and pushed to implementation PR #1. Root make check passed both component checks, make api regenerated without drift, and both root serve modes passed HTTP/port-override/interrupt-cleanup smoke checks. Existing port-8000 preview remained untouched. README and agent/architecture guidance preserve root delegation and component ownership. Archive PR #2 includes this checkpoint.
