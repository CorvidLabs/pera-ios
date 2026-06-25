# Migrations — Requirements

## User Stories

### Story 1: Seamless data-store relocation
As a returning user upgrading the app, I want my existing wallet data to be moved into the shared App Group storage automatically, so that all app extensions can access it without me losing any accounts or settings.

**Acceptance Criteria**
- The migration runs automatically and requires no user interaction.
- Existing data in the App Group store is never overwritten by older data.
- Legacy database files are removed once their contents are successfully relocated.
- If no legacy data exists, the migration completes without side effects.

### Story 2: Secure password storage
As a user who previously stored a password in the app database, I want that password moved into the Keychain, so that my credentials are stored more securely.

**Acceptance Criteria**
- If a password already exists in the Keychain, it is not overwritten.
- A stale password copy remaining in the database is removed.
- If no password is present in the database, nothing changes.

### Story 3: Biometric authentication continuity
As a user who had biometric login enabled in a previous version, I want that setting preserved, so that I can keep using biometrics without re-enabling them.

**Acceptance Criteria**
- A legacy "enabled" biometric status results in a silently set biometric password.
- The legacy status flag is cleared after a successful migration.
- A failure to set the biometric password leaves the legacy status untouched.
