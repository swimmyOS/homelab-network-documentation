# Homelab Network Documentation

This repository documents the design, configuration, and maintenance of my homelab and home network environment.
It demonstrates my ability to manage enterprise-style infrastructure using open-source and professional tools.

---

## Overview

### Primary Goals
- Implement segmented network architecture for LAN, Guest, IoT, and Lab use
- Deploy network-wide DNS-level filtering for security and privacy
- Integrate NAS and server-hosting systems into the network
- Document configuration changes using Git-based workflows
- Lay groundwork for secure remote access and monitoring

---

### Technologies Used
- Pi-hole DNS
- Samba (SMB)
- Jellyfin
- Cockpit
- UFW Firewall
- DHCP, NAT/PAT, VLAN concepts
- Linux (Debian / Raspberry Pi OS)
- Windows and macOS clients

---

## Network Services

### DNS Filtering (Pi-hole)
- Deployed Pi-hole as the primary DNS resolver for the LAN
- Configured ~250,000 blocklist rules
- Achieved approximately 32% DNS query blocking
- Reduced ads, trackers, and malicious domains across all devices
- Integrated with DHCP and static IP assignments

---

## Related Projects

This homelab network supports and integrates with the following standalone infrastructure projects:

- **Raspberry Pi NAS & Media Server**  
  Centralized storage and media streaming platform built on Linux, providing SMB file sharing and Jellyfin-based media access across the LAN.  
  ➜ https://github.com/<your-username>/rpi-nas-media-server

---

## VLAN Segmentation (Planned)

| VLAN | Name | Purpose |
|------|------|---------|
| 10 | Management | Network infrastructure and admin access |
| 20 | LAN | Trusted user devices |
| 30 | Guest | Isolated guest Wi-Fi |
| 40 | IoT | Smart devices |
| 99 | Transit | Inter-VLAN routing |

---

## Lessons Learned
- DNS filtering and DHCP integration
- Linux service and storage management
- Firewall hardening and least-privilege access
- Cross-platform troubleshooting (Windows, macOS, smart devices)
- Professional documentation and version control using Git

---

## Future Plans
- Implement VLAN segmentation with Layer 3 routing
- Deploy monitoring (Grafana + InfluxDB)
- Add IDS/IPS (Suricata or Snort)
- Containerize network services
- Implement VPN-based remote access

---

## Author

**Joseph Leahy Jr.**  
IT & Cybersecurity Enthusiast | Help Desk Tier 1  
https://www.linkedin.com/in/joseph-l-904673159  
josephleahyjr@outlook.com
