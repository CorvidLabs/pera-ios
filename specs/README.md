# Specs (spec-sync)

Bidirectional spec-to-code validation for `PeraWalletCore`, powered by
[CorvidLabs/spec-sync](https://github.com/CorvidLabs/spec-sync) and driven via `fledge`.

Each module under `PeraWalletCore/<Module>/` has a spec at
`specs/<Module>/<Module>.spec.md` documenting its public API, plus a
`requirements.md` companion. CI (`.github/workflows/spec-sync.yml`) fails a PR
when code and specs drift apart.

## Commands

| Command | Purpose |
|---------|---------|
| `fledge run spec-check` | `specsync check --strict` — fail on any drift |
| `fledge run spec-coverage` | file/LOC coverage report |
| `fledge run spec-stale` | specs lagging behind their source |
| `fledge run spec-score` | quality score (0–100) per spec |
| `fledge run spec-deps` | **advisory** dependency graph (surfaces cycles) |
| `fledge lanes run specs` | check (strict) → score, end to end |
| `specsync check --fix` | auto-add new public exports as stub rows |

## When you change `PeraWalletCore`

Adding/removing/renaming a `public`/`open` declaration changes the validated
surface. After such a change, run `fledge run spec-check`; if it fails, update
the module's spec (`specsync check --fix` stubs new exports for you) and write a
real description. See `AGENTS.md` for the agent workflow.

## Known limitations

1. **`public extension` members are NOT enforced.** The detector only recognizes
   an explicit `public`/`open` keyword *on the declaration line*. Functions
   declared inside `public extension { … }` blocks (≈132 across `PeraWalletCore`,
   e.g. `LiquidAuthService.handleAuthRequest`, the `ALGAPI` endpoint methods) are
   effectively public but invisible to validation. Treat the "100% coverage"
   figure as *file/LOC* coverage, not full public-API coverage. Tracked upstream.

2. **Coverage is scoped to `PeraWalletCore`.** The app UI (`Classes/`,
   `PeraWallet/`, ~2,500 files) is intentionally out of scope.

3. **`spec-deps` is advisory, not a CI gate.** The single-target core has
   pre-existing circular coupling; `deps` reports it but does not block PRs.
