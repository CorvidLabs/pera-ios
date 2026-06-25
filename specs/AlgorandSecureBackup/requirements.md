# AlgorandSecureBackup Requirements

## User Stories

### Story 1: Describe a backup
As a wallet user creating a secure backup, I want each backup to carry a stable identifier and a creation timestamp so that backups can be uniquely referenced and ordered.

**Acceptance Criteria**
- [ ] Each backup is represented by a `BackupMetadata` value holding an `id` and a `createdAtDate`.
- [ ] The `id` and `createdAtDate` are set at creation time and remain immutable.

### Story 2: Persist and restore backup metadata
As the backup subsystem, I want backup metadata to serialize and deserialize reliably so that stored backups can be read back and matched.

**Acceptance Criteria**
- [ ] `BackupMetadata` encodes to and decodes from JSON without losing `id` or `createdAtDate`.
- [ ] Two metadata values with the same `id` and `createdAtDate` compare as equal.
