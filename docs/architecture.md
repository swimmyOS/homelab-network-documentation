# Architecture

A segmented home network built around a next-generation firewall. The firewall routes every zone, enforces policy between them, and provides DHCP and time. A managed switch carries all zones to the firewall over a single 802.1Q trunk, the Wi-Fi router runs as a plain access point, and a Linux home server sits in its own zone.

![Network architecture](network-diagram.svg)

## Components

| Component | Role |
| --- | --- |
| Next-generation firewall | Routing between zones (router-on-a-stick), stateful inter-zone policy, NAT to the internet, DHCP, time source |
| Managed switch | 802.1Q VLANs; one trunk to the firewall, access ports for each zone |
| Wi-Fi access point | Bridges wireless clients into the Trusted zone; routing and DHCP turned off |
| Home server | DNS filtering, media streaming, file sharing, web-based server management |
| Workstation and wireless clients | Everyday devices in the Trusted zone |

## Zones

| Zone | What lives there | Gets DHCP |
| --- | --- | --- |
| Management | Network device management interfaces | No |
| Trusted | Workstation, access point, phones, laptops, streaming devices | Yes |
| Servers | Home server | No, fixed addressing |
| Out-of-band | A dedicated firewall port used only for recovery | Yes, small pool |

Each zone has its own private subnet. Infrastructure and servers use fixed addresses, and clients use DHCP with reservations where a fixed address helps.

## Trust model

- **Default deny.** Traffic between zones is dropped unless a policy allows it.
- **Trusted → Servers:** only the application services the server offers. Everything else is dropped.
- **Servers → Trusted:** never allowed to start a connection, so a compromised server can't reach user devices.
- **Management:** device admin interfaces answer only to the Trusted zone and the out-of-band path, and admin logins are restricted to those sources as well as by interface. Nothing on the internet side accepts management traffic, not even ping.
- **Internet:** Trusted and Servers reach the internet through NAT. Nothing on the internet can start a connection inward.
- **No NAT between internal zones,** so the server's logs and DNS filtering see each client's real address.

## DNS

- Trusted clients get the home server's filtering resolver as their only DNS server.
- DNS requests to any other resolver are blocked at the firewall, so devices with hard-coded DNS still get filtered.
- The firewall uses its own public upstream resolvers, so it keeps resolving names even when the server is offline.
- Local hostnames for each service are served by the filtering resolver.

## Time

The firewall syncs to public NTP servers and serves time to every zone. The server and the access point both sync from the firewall, because it stays up when the server reboots.

## Resilience

- The firewall is configured from the serial console during changes, so an addressing mistake can't lock it out.
- The out-of-band port gives a second way in if the normal admin path is lost.
- Every device's configuration is backed up after each change, and the backups are kept offline from this repository.
