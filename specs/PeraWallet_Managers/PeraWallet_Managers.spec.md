---
module: PeraWallet_Managers
version: 1
status: active
files:
  - PeraWallet/Managers/API/API Services/Algod/AlgodApiManager.swift
  - PeraWallet/Managers/API/API Services/Algod/Requests/Algod/WaitForBlockRequest.swift
  - PeraWallet/Managers/API/API Services/Indexer/IndexerApiManager.swift
  - PeraWallet/Managers/API/API Services/Indexer/Requests/AccountRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/ASAInboxMeta.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountDetailRequestResponse.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountSignRequestResponse.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/JointAccountTransactionStatus.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/MultiSigAccountObject.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/SignRequestObject.swift
  - PeraWallet/Managers/API/API Services/Mobile/Data Objects/SignRequestStatus.swift
  - PeraWallet/Managers/API/API Services/Mobile/MobileApiManager.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CancelJointAccountAccountImportRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CreateJointAccountRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/CurrencyDataRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/InboxCreateRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountDetailRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountSignRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/JointAccountsSignRequestSearchRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/NameServiceSearchRequest.swift
  - PeraWallet/Managers/API/API Services/Mobile/Requests/ProposeSignRequest.swift
  - PeraWallet/Managers/API/CoreApiManager.swift
  - PeraWallet/Managers/API/Data Types/APICodingKey.swift
  - PeraWallet/Managers/API/Data Types/EmptyResponse.swift
  - PeraWallet/Managers/API/Enums/RequestMethod.swift
  - PeraWallet/Managers/API/Protocols/BodyRequestable.swift
  - PeraWallet/Managers/API/Protocols/QueryRequestable.swift
  - PeraWallet/Managers/API/Protocols/Requestable.swift
  - PeraWallet/Managers/Core/Data Providers/AccountDataProvider.swift
  - PeraWallet/Managers/Core/Data Providers/ContactDataProvider.swift
  - PeraWallet/Managers/Core/Formatters/AccountNameFormatter.swift
  - PeraWallet/Managers/Core/PeraCoreManager.swift
  - PeraWallet/Managers/Core/Services/AccountsService.swift
  - PeraWallet/Managers/Core/Services/BlockchainService.swift
  - PeraWallet/Managers/Core/Services/CurrencyService.swift
  - PeraWallet/Managers/Core/Services/Data Types/NonFungibleDomainData.swift
  - PeraWallet/Managers/Core/Services/Data Types/PeraAccount.swift
  - PeraWallet/Managers/Core/Services/InboxService.swift
  - PeraWallet/Managers/Core/Services/NFDService.swift
  - PeraWallet/Managers/Core/Services/Protocols/NetworkConfigureable.swift
  - PeraWallet/Managers/Tasks Manager/CancellableTask.swift
  - PeraWallet/Managers/Tasks Manager/CancellableTasksManager.swift
db_tables: []
depends_on: []
---

# PeraWallet_Managers

## Purpose

App-target UI/feature module (`PeraWallet/Managers`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

This module is part of the app target (internal access) and exposes no
public cross-module API. Its types (screens, view controllers, view
models) are consumed only within the app target.

## Invariants

1. Module is part of the app target (internal access); not a public library boundary.

## Behavioral Examples

### Scenario: Placeholder
- **Given** the app is running
- **When** this module's flow is entered
- **Then** it behaves per its screens/controllers

## Error Cases

| Condition | Behavior |
|-----------|----------|
| N/A | Documented per screen |

## Dependencies

| Module | Usage |
|--------|-------|
| PeraWalletCore | Shared models/services |

## Change Log

| Change | Date | Version |
|--------|------|---------|
| Created | 2026-06-25 | 1 |
