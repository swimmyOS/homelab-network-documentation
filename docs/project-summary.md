# Project summary: flat network to segmented zones

## Goal

Replace a single flat home network, where every device could reach every other device, with a segmented design: a firewall routing separate zones for users, servers and management, filtered DNS for everyone, and no single misconfiguration able to lock out administration.

## Approach

The migration was planned as a runbook with a rollback path for every stage.

1. **Preparation, with the old network still live.** Configuration backups of every device. Server changes that are safe in advance: a pre-built network profile kept switched off, DNS settings that work across zones, and removal of an unused lab environment.
2. **Firewall build, offline.** The whole firewall configuration was entered over the serial console with no network cables attached, so changing interface addresses couldn't cut off the admin session.
3. **Cutover, in lockout-safe order.** The server and access point moved first while the switch was still flat. VLANs were applied from a dedicated management port. The internet link was only recabled at the end, which kept the outage to a single short window.
4. **Validation.** A test plan covering gateway reachability, internet access, local DNS, ad blocking, forced DNS, filtering with real client addresses, every server service, management access, Wi-Fi clients, zone isolation, time sync, and a full power-cycle to prove that the configuration survives reboots.
5. **Hardening and cleanup.** Unused services on the server disabled, admin logins restricted by source, an unused firewall interface shut down, the server's clock pointed at the firewall, and fresh configuration backups of every device.

## Rollback planning

Each stage had its own fix-in-place steps, indexed by symptom, plus a full rollback to the original network that could be run in a few minutes. None of it was needed. The full rollback was later revised when the post-cutover cleanup changed what it depended on.

## Lessons learned

- **Serial consoles drop pasted line breaks.** Losing one `config` line made every following command fail silently. Typing section headers by hand and pasting one block at a time fixed it.
- **Verify, don't assume.** Two interfaces that appeared to be entered were never created, and everything depending on them failed with them. Checking each object with `show` before moving on caught it.
- **Policy order matters.** The firewall stops at the first matching policy, so the DNS block has to sit above the general internet rule.
- **ISP modems remember the first device they see.** The modem only issued an address to the new firewall after a power cycle.
- **Consumer gear has quirks.** The access point's web interface only answers by address, not by hostname.
- **Service restarts aren't optional.** The server kept using a fallback time source until its time sync service was restarted after the config edit.
- **Reconcile documentation with exported configs.** Comparing the runbook against the backups found a step marked done that had never been saved.

## Skills demonstrated

- Network segmentation with 802.1Q VLANs and router-on-a-stick
- Stateful firewall policy design: default deny, least privilege, ordering
- DNS filtering and enforcement
- Change management: runbooks, staged cutover, rollback plans, validation testing
- Linux server administration with NetworkManager, systemd and Samba
- Configuration backup, documentation, and redacting it for publication
