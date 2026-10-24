# 🧾 Changelog

## [2026-10-24]
- Migrated from a flat network to a segmented, firewall-routed design
- Moved the Wi-Fi router to access point mode and the home server into its own zone
- Centralized DHCP and time on the firewall
- Enforced filtered DNS for all trusted devices
- Published the architecture, design decisions and project summary in `docs/`

## [2025-11-13]
- Purchased a managed switch and a network rack

## [2025-11-12]
- Finalized Pi-hole configuration
- Prepared the network for VLAN trunking

## [2025-11-01]
- Migrated DHCP from the router to Pi-hole
- Implemented DNS over TLS
- Added blocklists to Pi-hole
- 300,000 blocked addresses

## [2025-10-15]
- Created the initial Pi-hole and router configuration
- Designed a static IP address range
- Created the initial README.md and changelog.md
