---
module: PeraWallet_Classes_Discover
version: 1
status: active
files:
  - PeraWallet/Classes/Discover/AssetDetail/DiscoverAssetDetailScreen.swift
  - PeraWallet/Classes/Discover/DappDetailNavigationViewTheme.swift
  - PeraWallet/Classes/Discover/DiscoverInAppBrowser/BrowserAuthorizedAddressEventHandler.swift
  - PeraWallet/Classes/Discover/DiscoverInAppBrowser/DiscoverInAppBrowserScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/DiscoverDappDetailScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/DiscoverExternalInAppBrowserScreen.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationView.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationViewModel.swift
  - PeraWallet/Classes/Discover/ExternalInAppBrowser/Views/NavigationView/DiscoverExternalInAppBrowserNavigationViewTheme.swift
  - PeraWallet/Classes/Discover/Generic/DiscoverGenericScreen.swift
  - PeraWallet/Classes/Discover/Home/DiscoverHomeScreen.swift
  - PeraWallet/Classes/Discover/Home/DiscoverHomeScreenTheme.swift
  - PeraWallet/Classes/Discover/Search/Data/DiscoverSearchAPIDataController.swift
  - PeraWallet/Classes/Discover/Search/Data/DiscoverSearchDataController.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchDataSource.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreen.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreenLayout.swift
  - PeraWallet/Classes/Discover/Search/DiscoverSearchScreenTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetListItemViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchAssetCell/DiscoverSearchAssetNameListItemViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListErrorCell/DiscoverSearchListErrorViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/DiscoverSearchListLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListLoadingCell/Views/DiscoverSearchAssetLoadingView/DiscoverSearchAssetLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchListNotFoundCell/DiscoverSearchListNotFoundViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorView.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorViewModel.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListErrorCell/DiscoverSearchNextListErrorViewTheme.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListLoadingCell/DiscoverSearchNextListLoadingCell.swift
  - PeraWallet/Classes/Discover/Search/Views/DiscoverSearchNextListLoadingCell/DiscoverSearchNextListLoadingViewTheme.swift
  - PeraWallet/Classes/Discover/Utils/DiscoverURLGenerator.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/DiscordDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/DiscoverSocialMediaRouter.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/SocialMediaDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/TelegramDeeplink.swift
  - PeraWallet/Classes/Discover/Utils/SocialMediaDeeplinkRouter/TwitterDeeplink.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorCell.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorView.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorViewModel.swift
  - PeraWallet/Classes/Discover/Views/DiscoverErrorCell/DiscoverErrorViewTheme.swift
  - PeraWallet/Classes/Discover/Views/NavigationBar/DiscoverNavigationBarView.swift
  - PeraWallet/Classes/Discover/Views/NavigationBar/DiscoverNavigationBarViewTheme.swift
db_tables: []
depends_on: []
---

# PeraWallet_Classes_Discover

## Purpose

App-target UI/feature module (`PeraWallet/Classes/Discover`). Internal-by-default; see Public API for any cross-module-public surface.

## Public API

| Export | Description |
|--------|-------------|
| `BrowserAuthorizedAddressEventHandler` | Encodes the user's (optionally authorized-only, non-joint) accounts as base64 and injects them into an in-app browser web view via `handleMessage` JavaScript. |

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
