# Homelab Network Documentation

This repository documents the design, configuration, and maintenance of my homelab and home network environment.
It demonstrates my ability to manage enterprise-style infrastructure using open-source and professional tools.

---

## Overview

**Primary Goals**
- Implement segmented VLAN architecture for IoT, Guest, and Lab networks
- Implement network-wide DNS level adblocking
- Implement NAS and SFF PC for server hosting
- Automate configuration backups with Git and scripting
- Provide secure remote access via VPN and DNS over TLS

**Technologies Used**
- Pi-hole DNS
- OpenVPN / WireGuard
- DHCP, NAT/PAT, VLANs
- Linux & Windows Server

---

## VLAN Segmentation TODO

**VLAN goal**
| VLAN | Name | Purpose |
|------|------|----------|
| 10 | Management | Admin access and pfSense |
| 20 | LAN | General devices |
| 30 | Guest | Isolated guest Wi-Fi |
| 40 | IoT | Smart devices |
| 99 | Transit | Inter-VLAN routing |

---

## Lessons Learned
- Network segmentation
- Certificate signing and creation
- Built an understanding of VLAN trunking and inter-VLAN routing
- Implemented DHCP/DNS migration from router to Pi-hole
- Documented changes professionally using Git version control

---

## Future Plans
- Integrate Layer 3 Switch for VLAN trunking
- Integrate monitoring via Grafana + InfluxDB
- Add IDS/IPS (Suricata or Snort)
- Deploy Docker containers for isolated network services
- Host air-gapped sandbox for pentesting and exploit crafting

---

## 👨‍💻 Author
Joseph Leahy Jr. 
IT & Cybersecurity Enthusiast | Network Engineer in Training  
www.linkedin.com/in/joseph-l-904673159 | josephleahyjr@outlook.com
