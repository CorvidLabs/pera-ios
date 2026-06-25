# Data Module Requirements

## User Stories

### Story: Persist HD wallet seeds securely
As a wallet user, I want my HD wallet seeds and derived addresses stored securely so that my keys survive app restarts without being exposed in plaintext.

**Acceptance Criteria**
- Given a generated HD wallet seed, when it is saved, then it is written to the keychain and never to `UserDefaults`.
- Given a saved seed, when I look it up by wallet id, then the decoded seed is returned.
- Given a saved wallet, when I delete it, then subsequent lookups by its id return nil.

### Story: Limit PIN attempts
As a wallet user, I want failed PIN attempts tracked so that the app can lock out after too many failures.

**Acceptance Criteria**
- Given a fresh install, when no attempts have been made, then `attemptCount` and `remainingTime` are 0.
- Given `allowedAttemptLimitCount` is 5, when attempt counting is performed, then the app can compare attempts against this limit.

### Story: Show one-time UI prompts once
As a wallet user, I want warnings and tutorials shown only once so that I am not repeatedly interrupted.

**Acceptance Criteria**
- Given a one-time warning key, when it is marked displayed, then `isDisplayedOnce` returns true thereafter.
- Given the transaction tutorial has been displayed, when checked again, then `isTransactionTutorialDisplayed` returns true.

### Story: Persist app entities via Core Data
As a developer, I want a reusable CRUD facade over Core Data so that managed objects can be created, fetched, updated, and removed consistently.

**Acceptance Criteria**
- Given a persistent container, when CRUD operations run, then objects are created, fetched, updated, and removed against its view context.
- Given no persistent container, when operations run, then they fail gracefully with a typed error or a `noContext` result rather than crashing.
