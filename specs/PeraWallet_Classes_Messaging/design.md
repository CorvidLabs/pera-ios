# PeraWallet_Classes_Messaging — Design

## Screens
- Conversation list (rows: peer + last-message preview).
- Chat thread (message list + compose bar).

## Navigation
Menu -> Conversation list -> Chat thread (push).

## Tokens
Uses the app design system (Colors, typography). Current slice uses plain UIKit; production should adopt MacaroonUIKit cells.
