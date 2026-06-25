# Analytics — Requirements

## Overview

The Analytics module provides a single, provider-agnostic surface for emitting
user-action events, screen views, and error/diagnostic logs from anywhere in the
Pera Wallet app. It centralizes the catalog of tracked names and metadata keys so
that instrumentation stays consistent and the underlying provider (currently
Firebase Analytics + Crashlytics) can be swapped without touching call sites.

## User Stories

### Story 1: Product analyst tracking feature usage
**As a** product analyst,
**I want** every meaningful user action (swaps, buys, onboarding steps, WalletConnect
sessions, tab taps) to be emitted as a named event with structured metadata,
**so that** I can measure feature adoption and funnels in the analytics dashboard.

**Acceptance Criteria:**
- [ ] Each tracked action has a single, stable event name with a defined provider-facing key.
- [ ] Events carry typed metadata keyed by `ALGAnalyticsMetadataKey`.
- [ ] Testnet events are distinguishable from mainnet events (prefixed with `t_`).
- [ ] Emitting an event requires only a one-line call against the `ALGAnalytics` facade.

### Story 2: Engineer diagnosing production failures
**As an** engineer,
**I want** known failure modes (migration failures, WalletConnect errors, Ledger
fetch failures, persistent-container creation errors) to be recorded as crash reports
with stable codes and contextual metadata,
**so that** I can triage and group production issues in Crashlytics.

**Acceptance Criteria:**
- [ ] Each error log has a unique, stable integer code used as the recorded `NSError` code.
- [ ] Logs are recorded with their metadata as `NSError` user info.
- [ ] Recording a log requires only a one-line call against the `ALGAnalytics` facade.

### Story 3: Platform engineer swapping providers
**As a** platform engineer,
**I want** the analytics backend to be configurable via a provider list,
**so that** I can change or add providers (or inject a no-op/mock for tests) without
modifying any feature call sites.

**Acceptance Criteria:**
- [ ] `ALGAnalyticsCoordinator` accepts an explicit provider list, defaulting to Firebase.
- [ ] Dispatch respects each provider's `canTrack`/`canRecord` gate.
- [ ] Call sites depend only on the `ALGAnalytics` protocol, not on a concrete provider.

## Non-Goals

- Defining new analytics provider integrations beyond Firebase.
- Persisting or batching events locally; dispatch is immediate per provider.
- Enforcing consent / opt-out logic (handled outside this module).
