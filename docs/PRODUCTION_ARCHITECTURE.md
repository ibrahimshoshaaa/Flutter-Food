# Flutter Food — Production Architecture

## Phase 1 foundation

This repository is the Flutter customer application. Production services are intentionally kept behind APIs so the mobile client never owns business-critical rules.

### Layers

- **Presentation:** screens, widgets, navigation and UI state.
- **Domain:** use cases and business rules independent of Flutter widgets.
- **Data:** API clients, DTOs, repositories and local persistence.
- **Core:** configuration, networking, errors, logging, security helpers and shared utilities.

### Planned feature boundaries

- auth
- home
- restaurants
- products
- cart
- checkout
- orders
- tracking
- profile
- notifications

### Backend boundary

Flutter -> HTTPS API -> application backend -> database/storage/payment/notification providers.

The client must never trust prices, totals, permissions or order status supplied by itself. The backend recalculates and authorizes all sensitive operations.

### Environments

- development
- staging
- production

Secrets are supplied through local ignored files or CI secret storage. No credentials belong in source control.

### Phase 1 exit criteria

- branded application identity
- unique Android/iOS identifiers
- no debug signing configuration for release
- reproducible dependency install
- baseline widget test
- static analysis in CI
- production architecture documented
- repository documentation no longer references the source/demo project
