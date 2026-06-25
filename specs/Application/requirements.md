# Application — Requirements

## User Stories

### Story 1: Network-aware endpoints
As a developer building features, I want a single source of truth for network endpoints and feature base URLs so that the app talks to the correct staging or production services for the active build target.

**Acceptance Criteria**
- [ ] `AppEnvironment.current` returns a single shared instance.
- [ ] Endpoint and base-URL resolution switches between staging and production based on `ALGAppTarget.current.isProduction`.
- [ ] Missing configuration values degrade to empty strings rather than crashing.

### Story 2: Target configuration and link acceptance
As the app shell, I want to load per-build identity and link-handling configuration so that incoming deeplinks and universal links are accepted only when they match the configured sources.

**Acceptance Criteria**
- [ ] `ALGAppTarget.setup()` loads `current` from the bundled `Config` resource, including app flavor, deeplink, universal-link, and WalletConnect configs.
- [ ] `canAcceptScheme` returns true only for schemes in a source group's accepted list.
- [ ] `canAccept` returns true only for URLs matching the QR or WalletConnect accepted-path prefixes.
- [ ] Cards feature is disabled for TestNet on production builds.
