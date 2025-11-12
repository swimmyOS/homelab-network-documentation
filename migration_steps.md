# Migration Plan: Router + Pi-hole

**Objective:** Move DHCP/DNS functionality from the ISP router to the Pi-hole.

### Steps:
1. Disable DHCP on ISP router
2. Assign static IP to Pi-Hole (192.168.1.70)
3. Enable DHCP in Pi-Hole (scope 192.168.1.50–200)
4. Set Pi-hole as DNS server in configuration software
5. Test connectivity and ad blocking
6. Commit configuration to GitHub
