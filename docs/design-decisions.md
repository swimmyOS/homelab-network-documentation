# Design decisions

The main choices behind the network, and why.

## 1. Make the firewall the router, and the Wi-Fi router an access point

The consumer Wi-Fi router used to route, hand out addresses and filter traffic for the whole house. Moving routing to a dedicated firewall gives stateful policy between zones, proper logging and a configuration that can be backed up and reviewed. The Wi-Fi router now only bridges wireless clients, which is what it does best.

**Considered:** keeping the router and adding the firewall behind it. Rejected because it would mean double NAT and two places making routing decisions.

## 2. One trunk, VLANs routed on the firewall

All zones share a single 802.1Q trunk between the switch and the firewall, and the firewall routes between them. Every inter-zone packet passes through firewall policy, and the switch stays a simple Layer 2 device.

**Considered:** routing on a Layer 3 switch. Rejected because traffic between zones would never reach the firewall's policy and logging.

## 3. Give the server its own zone, with one-way trust

The home server runs network-facing services, so it is the device most likely to be exposed to something untrusted. Placing it in its own zone means Trusted devices can reach its services, but the server can't start connections back into Trusted.

**Considered:** leaving the server on the same network as everything else. Rejected because a compromise of any one service would put every device in reach.

## 4. Force all DNS through the filtering resolver

Trusted clients receive only the filtering resolver from DHCP, and the firewall blocks DNS to any other resolver. Ad and tracker blocking then applies to every device, including ones with hard-coded DNS servers.

## 5. Keep the firewall independent of the server

The firewall uses public resolvers for its own lookups and is the network's time source. If the server is down for maintenance, routing, DHCP and time keep working.

## 6. Treat management as its own problem

- Device management interfaces live in their own zone and answer only to trusted sources.
- Admin logins are restricted by source as well as by interface, because a firewall can answer admin requests on one interface's address that arrive through another.
- A dedicated out-of-band port and the serial console provide recovery paths that don't depend on the production network.

## 7. No NAT between internal zones

NAT is used only towards the internet. Between zones, addresses pass through unchanged, so DNS filtering statistics and service logs are per device instead of showing the firewall for everything.

## 8. Document from the real configuration

The documentation is checked against exported device configurations rather than written from memory. That review caught a hardening step that had been marked complete but never saved, and an unused interface that was still enabled.
